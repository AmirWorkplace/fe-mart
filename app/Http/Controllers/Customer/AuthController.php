<?php

namespace App\Http\Controllers\Customer;

use App\helperClass;
use App\Models\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Location;
use App\Models\Order;
use App\Models\Review;
use App\Models\ShippingAddress;
use App\Models\Wishlist;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    public function login(Request $request)
    {
        if ($request->isMethod('GET')) {
            return view('customer.login');
        }
        if ($request->isMethod('POST')) {
            $request->validate([
                'email_or_phone' => 'required',
                'password' => 'required',
            ]);


            if (is_numeric(request()->email_or_phone)) {
                $column = 'phone';
            } elseif (filter_var(request()->email_or_phone, FILTER_VALIDATE_EMAIL)) {
                $column = 'email';
            } else {
                return redirect()->back()->withErrors('These credentials do not match our records.')->withInput();
            }

            $remember_me = $request->has('remember_me') ? true : false;
            if (auth()->attempt([$column => $request->input('email_or_phone'), 'password' => $request->input('password')], $remember_me)) {
                return redirect()->route('customer.profile')->withSuccessMessage('Logged in Successfully!');
            } else {
                return redirect()->back()->withInput($request->all())->withErrors('your email or password is wrong!');
            }
        }
    }

    public function logout()
    {
        Auth::logout();
        return redirect()->route('customer.login');
    }

    public function register(Request $request)
    {
        // return "Register";
        if ($request->isMethod('GET')) {
            return view('customer.register');
        }

        if ($request->isMethod('POST')) {
            $request->validate([
                'email' => 'required',
                'phone' => 'required',
                'password' => 'required|min:8',
            ]);

            $customer = User::create([
                'name' => $request->username,
                'role' => 0,
                'email' => $request->email,
                'phone' => $request->phone,
                'password' => Hash::make($request->password),
            ]);

            Auth::login($customer);
            return redirect()->route('customer.profile')->withSuccessMessage('Registered Successfully!');
        }
    }

    public function profile(Request $request)
    {
        if ($request->isMethod('GET')) {
            return view('customer.profile');
        }
        if ($request->isMethod('POST')) {
            $request->validate([
                'name' => 'required',
                'email' => 'required|unique:users,email,' . auth()->user()->id,
                'phone' => 'required|unique:users,phone,' . auth()->user()->id,
                'password' => 'required',
            ]);

            $user = User::findOrFail(Auth::user()->id);
            if (Hash::check($request->password, Auth::user()->password)) {
                $user->update([
                    'name' => $request->name,
                    'email' => $request->email,
                    'phone' => $request->phone,
                ]);

                if ($request->new_password) {
                    $user->update([
                        'password' => Hash::make($request->new_password),
                    ]);
                }
                return redirect()->back()->withSuccessMessage('Updated Successfully!');
            } else {
                return redirect()->back()->withErrors("Password Doesn't Match!");
            }
        }
    }

    public function address(Request $request)
    {
        if ($request->isMethod('GET')) {
            if (request()->ajax()) {
                $locations = Location::where('parent_id', request('id'))->orderBy('name')->get();
                return response()->json(['status' => 'success', 'locations' => $locations]);
            }

            $address = ShippingAddress::where('user_id', Auth::user()->id)->first();
            $divisions = Location::whereNull('parent_id')->orderBy('name')->get();
            $districts = Location::where('district', 1)->orderBy('name')->get();
            $upozilas = Location::where('thana', 1)->orderBy('name')->get();
            return view('customer.address', compact('address', 'divisions', 'districts', 'upozilas'));
        }

        $upozila_id = $request->upozila_id;
        $district_id = $request->district_id;
        $division_id = $request->division_id;

        if(is_null($upozila_id) || is_null($district_id) || is_null($division_id)) {
            return redirect()->route('customer.address')->withErrors('Please Set your Address!');
        }
        
        if ($request->isMethod('POST')) {
            $request->validate([
                'address_type' => 'required',
                'name' => 'required',
                'email' => 'email',
                'phone' => 'required',
                'division_id' => 'required',
                'district_id' => 'required',
                'upozila_id' => 'required',
                'street' => 'required',
            ]);

            $shipping_address = ShippingAddress::where('user_id', Auth::user()->id)->first();
            if (is_null($shipping_address)) {
                $shipping_address = new ShippingAddress();
            }
            $upozila = Location::where('id', $upozila_id)->first()->name;
            $district = Location::where('id', $district_id)->first()->name;
            $division = Location::where('id', $division_id)->first()->name;
            $address = $request->street . ', ' . $upozila . ', ' . $district . ', ' . $division;
            $shipping_address->user_id = Auth::user()->id;
            $shipping_address->address_type = $request->address_type;
            $shipping_address->name = $request->name;
            $shipping_address->email = $request->email;
            $shipping_address->phone = $request->phone;
            $shipping_address->street = $request->street;
            $shipping_address->address = $address;
            $shipping_address->division_id = $request->division_id;
            $shipping_address->district_id = $request->district_id;
            $shipping_address->upozila_id = $request->upozila_id;
            $shipping_address->save();
            return redirect()->back()->withSuccessMessage('Updated Successfully!');
        }
    }

    public function orders($id = null)
    {
        if (!is_null($id)) {
            $order = Order::with(['products'])->where('id', $id)->first();
            return view('customer.single_order', compact('order'));
        }

        return view('customer.orders');
    }

    public function returnOrders($id = null)
    {
        if (!is_null($id)) {
            $order = Order::with(['products'])->where('id', $id)->first();
            return view('customer.single_return_order', compact('order'));
        }
        $return_orders = Order::with('products')->where('user_id', Auth::user()->id)->whereNotNull('return_at')->get();
        return view('customer.return_orders', compact('return_orders'));
    }

    public function wishlist(Request $request)
    {
        if ($request->ajax() && $request->delete == 'true') {
            Wishlist::findOrFail($request->id)->delete();
            return response()->json(['status' => 'success']);
        }

        if ($request->ajax()) {
            $check_product = Wishlist::where('product_id', $request->id)->where('user_id', Auth::user()->id)->count();
            if ($check_product > 0) {
                return response()->json(['status' => 'error']);
            }

            Wishlist::create([
                'user_id' => Auth::user()->id,
                'product_id' => $request->id,
            ]);
            return response()->json(['status' => 'success']);
        }

        $wishlists = Wishlist::with(['product'])->where('user_id', Auth::user()->id)->latest('id')->get();
        return view('customer.wishlist', compact('wishlists'));
    }

    public function review(Request $request)
    {
        $request->validate([
            'star' => 'required',
            'product_id' => 'required',
            'description' => 'required',
        ]);

        // Images
        $images = $request->file('images');
        if (isset($images)) {
            $img_arr = [];
            foreach ($images as $key => $more_image) {
                $response = helperClass::storeImage($more_image, 600, 'media/review/');
                if ($response['status'] == 'success') {
                    $img_arr[$key] = $response['path_name'];
                }
            }
            $images_path_names = trim(implode('|', $img_arr), '|');
            if (count($img_arr) == 0) {
                $images_path_names = NULL;
            }
        } else {
            $images_path_names = NULL;
        }

        Review::create([
            'product_id' => $request->product_id,
            'user_id' => Auth::user()->id,
            'star' => $request->star,
            'title' => $request->title,
            'description' => $request->description,
            'images' => $images_path_names,
        ]);

        return redirect()->back()->withSuccessMessage('Review Created Successfully!');
    }
}
