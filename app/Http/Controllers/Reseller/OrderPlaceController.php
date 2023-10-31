<?php

namespace App\Http\Controllers\Reseller;

use App\Helper\AdditionalDataResource;
use App\Helper\UserManagement;
use App\helperClass;
use App\Http\Controllers\Controller;
use App\Models\CustomerEntry;
use App\Models\Location;
use App\Models\Order;
use App\Models\Product;
use App\Models\ProductResalePrice;
use App\Models\ShippingAddress;
use App\Models\User;
use App\Models\Withdraw;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Yajra\DataTables\Facades\DataTables;

class OrderPlaceController extends Controller
{

    public string|array $route_path;

    public function __construct(){
        $this->route_path = [
            'view' => 'reseller.order-place',
            'route' => 'admin.order-place',
        ];
    }

    // Display a listing of the resource.
    public function index()
    {
        info(AdditionalDataResource::getResellerEarning()['reserve_amount']);

        $model = Order::query()->where('user_id', Auth::id());

        if(UserManagement::role('admin')){
            $model = Order::query();
        }

        if (request()->ajax()) {
            return DataTables::eloquent($model->latest('id'))
                ->filter(function ($query) {
                    if (!empty(request('start_date')) && !empty(request('end_date'))) {
                        $query->where('created_at', '>=', request('start_date'))->where('created_at', '<=', request('end_date'));
                    }
                    if (!empty(request('status'))) {
                        $query->where('status', request('status'));
                    }
                }, true)
                ->addColumn('checkbox', function($row){
                    $checkbox = '<div class="custom-control custom-checkbox">
                    <input type="checkbox" class="custom-control-input multi_checkbox" id="'.$row->id.'" name="multi_checkbox[]" value="'.$row->id.'"><label for="'.$row->id.'" class="custom-control-label"></label></div>';
                        return $checkbox;
                })
                ->addColumn('order_status', function ($row) {
                    if ($row->status == 'Canceled') {
                        $status = '<span class="btn btn-xs text-white bg-danger">Canceled</span>';
                    } elseif ($row->status == 'Delivered') {
                        $status = '<span class="btn btn-xs text-white bg-success">Delivered</span>';
                    } else {
                        $status = '<select name="status" class="form-select select2 order_status fs-14" data-id="' . $row->id . '">';

                        $status .= '<option';
                        if ($row->status == 'Pending' || $row->status == 'Confirmed' || $row->status == 'Processing' || $row->status == 'Delivered') {
                            $status .= ' selected disabled';
                        }
                        $status .= ' value="Pending">Pending</option>';

                        $status .= '<option';
                        if ($row->status == 'Confirmed' || $row->status == 'Processing' || $row->status == 'Delivered') {
                            $status .= ' selected disabled';
                        }
                        $status .= ' value="Confirmed">Confirmed</option>';

                        $status .= '<option';
                        if ($row->status == 'Processing' || $row->status == 'Delivered') {
                            $status .= ' selected disabled';
                        }
                        $status .= ' value="Processing">Processing</option>';

                        $status .= '<option';
                        if ($row->status == 'Delivered') {
                            $status .= ' selected disabled';
                        }
                        $status .= ' value="Delivered">Delivered</option>';
                        $status .= '<option value="Canceled">Canceled</option>';

                        $status .= '</select>
                        </form>';
                    }
                    return $status;
                })
                ->addColumn('sub_total', function ($row) {
                    return number_format($row->sub_total, 2) . ' Tk.';
                })
                ->addColumn('product_names', function ($row) {
                    $products = Product::select('id', 'name')->whereIn('id', json_decode($row->product_ids, true))->where('status', true)->get();
                    $products_name = $products->pluck('name')->toArray();

                    return implode(", ", $products_name);
                })
                ->addColumn('actions', function ($row) {
                    $edit_route = Route("{$this->route_path['route']}.edit", $row->id);
                    $show_route = Route("{$this->route_path['route']}.show", $row->id);

                    $actionBtn = '<div class="btn-group">
                                    <a href="' . $edit_route . '" class="btn btn-sm btn-success border-0 px-10px fs-15"><i class="fas fa-eye"></i></a>
                                    <a href="' . $show_route . '" target="_blank" class="btn btn-sm btn-info text-white border-0 px-10px fs-15"><i class="fas fa-print"></i></a>
                                </div>';
                    return $actionBtn;
                })
                ->rawColumns(['checkbox', 'sub_total', 'product_names', 'order_status','actions'])
                ->make(true);
        }
        return view("{$this->route_path['view']}.index");
    }

    // Show the form for creating a new resource.
    public function create()
    {
        return view("{$this->route_path['view']}.create");
    }

    // Store a newly created resource in storage.
    public function store(Request $request)
    {  
        
        $user = Auth::user();
        $total_earning = AdditionalDataResource::getResellerEarning()['reserve_amount'];

        if(request()->ajax()){
            $request->validate([
                'price_ids' => 'required',
                'product_ids' => 'required',
                'sub_total' => 'required',
                'total' => 'required',
                'discount' => 'required',
                'sales_type' => 'required',
            ]);

            $amount = $request->sub_total;
            $status = 'Pending';
            $status_time = ['pending_at' => Carbon::now()];
            $free_delivery = ($request->free_delivery === 'true' || $request->free_delivery === true) ? $request->delivery_charge : 0;
            $delivery_charge = ($request->free_delivery === 'false' || $request->free_delivery === false) ? $request->delivery_charge : 0;

            $customer_id = $user->id;
            $customer_name = $user->name;
            $customer_phone = $user->phone ?? 0;

            if($request->order_type != 'self'){
                $customer = CustomerEntry::select('id', 'name', 'phone')->where('id', $request->customer_id)->first();
                $customer_id = $customer->id; 
                $customer_name = $customer->name; 
                $customer_phone = $customer->phone ?? 0; 
            } 

            $order = Order::create([
                'order_id' => mt_rand(111111, 999999),
                'user_id' => $user->id,
                'customer_id' => $customer_id,
                'price_ids' => $request->price_ids,
                'product_ids' => $request->product_ids,
                'user_name' => $customer_name,
                'user_phone' => $customer_phone,
                'order_code' => 'R' . mt_rand(111111, 999999),
                'shipping_charge' => $delivery_charge,
                'sub_total' => $amount,
                'total' => $free_delivery,
                'discount' => $request->discount,
                'paid' => 0,
                'due' => $amount,
                'coupon_id' => NULL,
                'order_note' => NULL,
                'payment_method' => $request->order_type,
                'sales_type' => $request->sales_type,
                'total_earning' => $total_earning,
                'status' => $status,
                ...$status_time,
            ]);

            $product_ids = json_decode($request->product_ids, true);

            foreach($product_ids as $product_id){
                ProductResalePrice::create([
                    'product_id'=> $product_id,
                    'customer_id'=> $customer_id,
                    'reseller_id'=> $user->id,
                    'order_id'=> $order->id,

                    'main_rate' => $request["product_main{$product_id}_rate"],
                    'resale_rate' => $request["product_resale_{$product_id}_rate"],
                    'resale_prices' => $request["product_{$product_id}_amount"],
                    'quantities' => $request["product_{$product_id}_quantities"],
                    'resale_discount_amount' => $request["product_{$product_id}_discount"],
                ]);
            }

            if($request->sales_type == 'adjustment'){
                // $balance = AdditionalDataResource::getResellerEarning()['reserve_amount'];

                if($order){
                    if($total_earning <= intval($amount)){
                        return redirect()->route('admin.order-place.create')->withErrors('You do not have enough balance for adjustment this order!');
                    }
    
                    Withdraw::create([
                        'user_id' => $user->id,
                        'total_earning' => $total_earning,
                        'withdrawal_method' => 'Adjustment Order',
                        'withdraw_amount' => ($order->shipping_charge + $order->sub_total + $order->total) - $order->discount,
                        'account_number' => '...',
                        'status' => 'Succeed'
                    ]);
    
                    $status = 'Delivered';
                    $status_time = ['delivered_at' => Carbon::now()];
                }
            }

            // clear cart
            session()->forget("cart");
            return response()->json(["status"=> true, "message"=> "Order Placed Successfully!"]);
        }
    }

    // Display the specified resource.
    public function show(string $id)
    {
        $selected_products = array();
        $order = Order::findOrFail($id);
        $data = Auth::user();
        $customer = array();

        if($order->customer_id != $order->user_id){
            $customer = CustomerEntry::findOrFail($order->customer_id);
        }
        
        if(is_array(json_decode($order->product_ids))){
            $selected_products = ProductResalePrice::with('product')->where('order_id', $id)->latest('updated_at')->get();
        } 

        return view("{$this->route_path['view']}.print", compact('selected_products', 'order', 'data', 'customer'));
    }

    // Show the form for editing the specified resource.
    public function edit(string $id)
    {
        if (request()->ajax()) {
            $data = Order::findOrFail(request('id'));
            $data->update(['status' => request('status')]);
            return response()->json(['status' => 'success']);
        }
        
        $data = Order::findOrFail($id);
        $selected_products = array();
        
        if(is_array(json_decode($data->product_ids))){
            $selected_products = ProductResalePrice::with('product')->where('order_id', $id)->latest('updated_at')->get();
        }
        
        return redirect()->route($this->route_path['route'] . ".index");
    }

    // Update the specified resource in storage.
    public function update(Request $request, string $id)
    {
        $order = Order::findOrFail($id);

        if(request()->ajax()){
            $request->validate([
                'customer_id' => 'required',
                'price_ids' => 'required',
                'product_ids' => 'required',
                'sub_total' => 'required',
                'total' => 'required',
                'discount' => 'required',
            ]);

            $customer = CustomerEntry::select('id', 'name', 'phone')->where('id', $request->customer_id)->first();

            $order->customer_id = $customer->id;
            $order->user_name = $customer->name;
            $order->phone = $customer->phone;
            $order->price_ids = $request->price_ids;
            $order->product_ids = $request->product_ids;
            $order->shipping_charge = $request->shipping_charge;
            $order->sub_total = $request->sub_total;
            $order->total = $request->total;
            $order->discount = $request->discount;
            $order->due = $request->sub_total;
            $order->payment_method = $request->sales_type;
            $order->sales_type = $request->order_type;

            $product_ids = json_decode($request->product_ids, true);
            $previous_resale_ids = ProductResalePrice::where('order_id', $id)->pluck('id')->toArray();
            ProductResalePrice::whereIn('id', $previous_resale_ids)->delete();

                foreach($product_ids as $product_id){ 
                    ProductResalePrice::create([
                        'product_id'=> $product_id,
                        'reseller_id'=> Auth::id(),
                        'customer_id'=> $customer->id,
                        'order_id'=> $order->id,

                        'main_rate' => $request["product_main{$product_id}_rate"],
                        'resale_rate' => $request["product_resale_{$product_id}_rate"],
                        'resale_prices' => $request["product_{$product_id}_amount"],
                        'quantities' => $request["product_{$product_id}_quantities"],
                        'resale_discount_amount' => $request["product_{$product_id}_discount"],
                    ]);
                }

            $order->save();

            return response()->json(["status"=> true, "message"=> "Order updated Successfully!"]);
        }  

    }

    // Remove the specified resource from storage.
    public function destroy(Request $request, string $id)
    {
        // return helperClass::resourceDataDelete('orders', $request, $id, null, null);
    }

    // Reseller order place from client view
    public function resellerCart($user_name){
        return view('reseller.order.cart');
    }

    // Reseller order place from client view
    public function resellerCheckout($user_name){
        if (request()->ajax()) {
            $locations = Location::where('parent_id', request('id'))->orderBy('name')->get();
            return response()->json(['status' => 'success', 'locations' => $locations]);
        }

        $divisions = Location::whereNull('parent_id')->orderBy('name')->get();
        $get_customer = CustomerEntry::where('reseller_id', Auth::id())->latest('updated_at')->get();
        return view('reseller.order.checkout', compact('get_customer', 'user_name'));
    }

    // Reseller order place from client view
    public function resellerOrderPlace(Request $request, $user_name){
        $cart = session()->get('cart');
        $total_earning = AdditionalDataResource::getResellerEarning()['reserve_amount'];

        $request->validate(['select_customer'=> 'required']);
        if(empty($cart)) return redirect()->back()->withErrors('Nothing is available in your cart!');
        
        $user = User::with('reseller')->where('id', Auth::id())->first();

        $product_ids = [];
        $cart_products = [];
        foreach($cart as $product){
            $cart_products[] = $product;
            $product_ids[] = $product['product_id'];
        } 

        switch ($request->input('order_type')) {
            case 'self':
                $order = Order::create([
                    'order_id' => mt_rand(111111, 999999),
                    'user_id' => $user->id,
                    'customer_id' => $user->id,
                    'price_ids' => null,
                    'product_ids' => json_encode($product_ids),
                    'user_name' => $user->name,
                    'user_phone' => $user->phone ? $user->phone : 0,
                    'order_code' => 'R' . mt_rand(111111, 999999),
                    'shipping_charge' => $request->delivery_charge,
                    'sub_total' => $request->sub_total,
                    'total' => $request->delivery_charge == 0 ? $request->hidden_delivery_charge : 0,
                    'discount' => 0,
                    'paid' => 0,
                    'due' => $request->sub_total,
                    'coupon_id' => null,
                    'order_note' => null,
                    'payment_method' => 'cod',
                    'sales_type' => $request->order_type,
                    'total_earning' => $total_earning,
                    'pending_at' => Carbon::now(),
                ]);
    
                foreach($cart_products as $product){
                    $resale_prices = $product['reseller_price'] * $product['qty'];

                    ProductResalePrice::create([
                        'product_id'=> $product['product_id'],
                        'customer_id'=> $user->id,
                        'reseller_id'=> $user->id,
                        'order_id'=> $order->id,
    
                        'main_rate' => $product['reseller_price'],
                        'resale_rate' => $product['reseller_price'],
                        'resale_prices' => $resale_prices,
                        'quantities' => $product['qty'],
                        'resale_discount_amount' => ($product['qty'] * $product['reseller_price']) - $resale_prices,
                    ]);
                }
    
                session()->forget("cart");
                return redirect()->route('frontend.home')->withSuccessMessage("Order Placed Successfully!");
            
            case 'new-business':
                $request->validate([
                    'name'=> 'required',
                    'phone'=> 'required',
                    'street'=> 'required',
                ]);

                $customer = CustomerEntry::create([
                    'reseller_id' => $user->id, 
                    'name' => $request->name, 
                    'phone' => $request->phone, 
                    'email' => $request->email, 
                    'address' => $request->street, 
                    'status' => true
                ]);

                $order = Order::create([
                    'order_id' => mt_rand(111111, 999999),
                    'user_id' => $user->id,
                    'customer_id' => $customer['id'],
                    'price_ids' => null,
                    'product_ids' => json_encode($product_ids),
                    'user_name' => $customer['name'],
                    'user_phone' => $customer['phone'] ? $customer['phone'] : 0,
                    'order_code' => 'R' . mt_rand(111111, 999999),
                    'shipping_charge' => $request->delivery_charge,
                    'sub_total' => $request->sub_total,
                    'total' => $request->delivery_charge == 0 ? $request->hidden_delivery_charge : 0,
                    'discount' => 0,
                    'paid' => 0,
                    'due' => $request->sub_total,
                    'coupon_id' => null,
                    'order_note' => null,
                    'payment_method' => 'cod',
                    'sales_type' => $request->order_type,
                    'total_earning' => $total_earning,
                    'pending_at' => Carbon::now(),
                ]);
    
                foreach($cart_products as $product){
                    $resale_prices = $product['price'] * $product['qty'];

                    ProductResalePrice::create([
                        'product_id'=> $product['product_id'],
                        'customer_id'=> $customer['id'],
                        'reseller_id'=> $user->id,
                        'order_id'=> $order->id,
    
                        'main_rate' => $product['reseller_price'],
                        'resale_rate' => $product['price'],
                        'resale_prices' => $resale_prices,
                        'quantities' => $product['qty'],
                        'resale_discount_amount' => ($product['qty'] * $product['reseller_price']) - $resale_prices,
                    ]);
                }
    
                session()->forget("cart");
                return redirect()->route('frontend.home')->withSuccessMessage("Order Placed Successfully!");

            case 'business':
                // return  $total_earning;
                $customer = json_decode($request->select_customer, true);

                $order = Order::create([
                    'order_id' => mt_rand(111111, 999999),
                    'user_id' => $user->id,
                    'customer_id' => $customer['id'],
                    'price_ids' => null,
                    'product_ids' => json_encode($product_ids),
                    'user_name' => $customer['name'],
                    'user_phone' => $customer['phone'] ? $customer['phone'] : 0,
                    'order_code' => 'R' . mt_rand(111111, 999999),
                    'shipping_charge' => $request->delivery_charge,
                    'sub_total' => $request->sub_total,
                    'total' => $request->delivery_charge == 0 ? $request->hidden_delivery_charge : 0,
                    'discount' => 0,
                    'paid' => 0,
                    'due' => $request->sub_total,
                    'coupon_id' => null,
                    'order_note' => null,
                    'payment_method' => 'cod',
                    'sales_type' => $request->order_type,
                    'total_earning' => $total_earning,
                    'pending_at' => Carbon::now(),
                ]);
    
                foreach($cart_products as $product){
                    $resale_prices = $product['price'] * $product['qty'];

                    ProductResalePrice::create([
                        'product_id'=> $product['product_id'],
                        'customer_id'=> $customer['id'],
                        'reseller_id'=> $user->id,
                        'order_id'=> $order->id,
    
                        'main_rate' => $product['reseller_price'],
                        'resale_rate' => $product['price'],
                        'resale_prices' => $resale_prices,
                        'quantities' => $product['qty'],
                        'resale_discount_amount' => ($product['qty'] * $product['reseller_price']) - $resale_prices,
                    ]);
                }
    
                session()->forget("cart");
                return redirect()->route('frontend.home')->withSuccessMessage("Order Placed Successfully!");
            
            default:
                return redirect()->back()->withErrors('Please Select an `order type` and try again!');
        }
    }
}
