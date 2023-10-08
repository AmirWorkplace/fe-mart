<?php

namespace App\Http\Controllers\Customer;

use App\Http\Controllers\Controller;
use App\Mail\RegisterMail;
use App\Models\FlashdealProduct;
use App\Models\Location;
use App\Models\Order;
use App\Models\OrderProduct;
use App\Models\ProductStock;
use App\Models\ShippingAddress;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;

class CheckoutController extends Controller
{
    public function checkout()
    {
        if (request()->ajax()) {
            $locations = Location::where('parent_id', request('id'))->orderBy('name')->get();
            return response()->json(['status' => 'success', 'locations' => $locations]);
        }

        $divisions = Location::whereNull('parent_id')->orderBy('name')->get();
        if (Auth::check()) {
            $shipping_address = ShippingAddress::where('user_id', Auth::user()->id)->first();

            if(empty($shipping_address)) {
                return redirect()->route('customer.address')->withErrors('Please set your profile & address before checkout!');
            }

            $selected_district = Location::find($shipping_address->upozila_id);
            $selected_upozila = Location::find($shipping_address->district_id);
        } else {
            $shipping_address = NULL;
            $selected_district = NULL;
            $selected_upozila = NULL;
        }
        return view('customer.checkout', compact('divisions', 'shipping_address', 'selected_district', 'selected_upozila'));
    }

    public function checkoutStore(Request $request)
    {
        $this->validate($request, [
            'address_type' => 'required',
            'payment_method' => 'required',
            'name' => 'required',
            'phone' => 'required',
            'email' => 'email',
            'division' => 'required',
            'district' => 'required',
            'upozila' => 'required',
            'street' => 'required',
        ]);

        $cart = session()->get('cart');
        if (!is_null($cart) && count($cart) > 0) {

            $total_cart_price = 0;
            foreach ($cart as $key => $item) {
                $variant = ProductStock::findOrFail($item['variant_id']);
                $stock = $variant->qty - $variant->ordered;
                if ($stock < $item['qty']) {
                    $total_cart = session()->get('cart');
                    $total_cart[$variant->id]['qty'] = $stock;
                    session()->put('cart', $total_cart);

                    return redirect()->back()->withErrors($variant->product->name . ' is Out of Stock!');
                } elseif ($stock < 1) {
                    return redirect()->back()->withErrors($variant->product->name . ' is Out of Stock!');
                }
                $total_cart_price += $item['price'] * $item['qty'];
            }

            if (!Auth::user()) {
                $check_user = User::where('phone', $request->phone)->orWhere('email', $request->email)->count();
                if ($check_user > 0) {
                    return redirect()->back()->withErrors('User Exists Please Login First!');
                }
                $alphabet = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';
                $pass = array(); //remember to declare $pass as an array
                $alphaLength = strlen($alphabet) - 1; //put the length -1 in cache
                for ($i = 0; $i < 8; $i++) {
                    $n = rand(0, $alphaLength);
                    $pass[] = $alphabet[$n];
                }
                $password = implode($pass);

                $otp = rand(11111, 99999);
                $user = new User();
                $user->name = $request->name;
                $user->email  = $request->email;
                $three_ch = substr($request->input('phone'), 0, 3);
                $two_ch = substr($request->input('phone'), 0, 2);
                if ($three_ch == '+88') {
                    $user->phone = substr($request->input('phone'), 3);
                } elseif ($two_ch == '+8' || $two_ch == '88') {
                    $user->phone = substr($request->input('phone'), 2);;
                } else {
                    $user->phone = $request->phone;
                }
                // $user->otp = $otp;
                // $user->phone_verified_at = Carbon::now();
                $user->password = Hash::make($password);
                $user->status = 1;
                $user->save();

                Auth::login($user);
                if (@$user) {
                    $login_link = Route('customer.login');
                    $mailData = [
                        'name' => $request->name,
                        'phone' => $request->phone,
                        'email' => $request->email,
                        'password' => $password,
                        'login_link' => $login_link,
                    ];
                    Mail::to($request->email)->send(new RegisterMail($mailData));
                }
            } else {
                $user = Auth::user();
                $password = 11;
            }

            $upozila = Location::where('id', $request->upozila)->first()->name;
            $district = Location::where('id', $request->district)->first()->name;
            $division = Location::where('id', $request->division)->first()->name;
            $address = $request->street . ', ' . $upozila . ', ' . $district . ', ' . $division;

            if (!$request->has('shipping_address_id')) {
                $shipping_address = ShippingAddress::create([
                    'user_id' => $user->id,
                    'address_type' => $request->address_type,
                    'name' => $request->name,
                    'email' => $request->email,
                    'phone' => $request->phone,
                    'street' => $request->street,
                    'address' => $address,
                    'division_id' => $request->division,
                    'district_id' => $request->district,
                    'upozila_id' => $request->upozila,
                ]);
            } else {
                $shipping_address = ShippingAddress::findOrFail($request->shipping_address_id);
                $shipping_address->update([
                    'address_type' => $request->address_type,
                    'name' => $request->name,
                    'email' => $request->email,
                    'phone' => $request->phone,
                    'street' => $request->street,
                    'address' => $address,
                    'division_id' => $request->division,
                    'district_id' => $request->district,
                    'upozila_id' => $request->upozila,
                ]);
            }

            $order = Order::create([
                'order_id' => mt_rand(111111, 999999),
                'user_id' => $user->id,
                'user_name' => $user->name,
                'user_phone' => $user->phone,
                'order_code' => 'R' . mt_rand(111111, 999999),
                'shipping_charge' => 0,
                'shipping_address_id' => $shipping_address->id,
                'sub_total' => $total_cart_price,
                'total' => $total_cart_price,
                'discount' => 0,
                'paid' => 0,
                'due' => $total_cart_price,
                'coupon_id' => NULL,
                'order_note' => NULL,
                'payment_method' => $request->payment_method,
                'pending_at' => Carbon::now(),
            ]);

            foreach ($cart as $key => $item) {
                $variant = ProductStock::findOrFail($item['variant_id']);

                if (!is_null($item['flash_deal_item_id'])) {
                    $deal_product = FlashdealProduct::find($item['flash_deal_item_id']);
                    if ($deal_product->discount_type == 'amount') {
                        $discount = $deal_product->discount;
                        $discounted_price = $variant->price - $discount;
                    } else {
                        $discount = ($variant->price / 100) * $deal_product->discount;
                        $discounted_price = $variant->price - floor($discount);
                    }
                } else {
                    $discount = 0.00;
                    $discounted_price = $variant->price;
                }

                OrderProduct::create([
                    'flash_deal_id' => $item['flash_deal_id'],
                    'flash_deal_item_id' => $item['flash_deal_item_id'],
                    'order_id' => $order->id,
                    'variant_id' => $variant->id,
                    'product_id' => $variant->product_id,
                    'product_name' => $variant->product->name,
                    'product_thumbnail' => $variant->product->thumbnail,
                    'discount' => $discount,
                    'discount_price' => $discounted_price,
                    'sale_price' => $variant->price,
                    'regular_price' => $variant->product->price->regular_price,
                    'order_price' => $item['price'] * $item['qty'],
                    'quantity' => $item['qty'],
                ]);
                $ordered = $variant->ordered + $item['qty'];
                $variant->update(['ordered' => $ordered]);
            }
            session()->forget('cart');
            return redirect()->route('customer.profile')->withSuccessMessage('Ordered Successfully!');
        } else {
            return redirect()->route('frontend.home')->withErrors('Please add some product into cart!');
        }
    }
}
