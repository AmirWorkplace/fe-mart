<?php

namespace App\Http\Controllers\Reseller;

use App\helperClass;
use App\Http\Controllers\Controller;
use App\Models\Order;
use App\Models\Product;
use App\Models\ProductResalePrice;
use App\Models\User;
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
        $model = Order::query()->where('user_id', Auth::id());

        if(Auth::user()->hasRole('System Admin')){
            $model = Order::query();
        }

        // return helperClass::resourceDataView($query, ['user_phone', 'user_phone', 'email'], null, $this->route_path);

        if (request()->ajax()) {
            // $model = Order::with(['products', 'user']);
            return DataTables::eloquent($model)
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
                    } elseif ($row->status == 'Successed') {
                        $status = '<span class="btn btn-xs text-white bg-success">Succeed</span>';
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
                        $status .= '<option value="Successed">Succeed</option>';
                        $status .= '<option value="Canceled">Canceled</option>';

                        $status .= '</select>
                        </form>';
                    }
                    return $status;
                })
                ->addColumn('order_date', function ($row) {
                    return Carbon::parse($row->created_at)->format('d M Y | h:i A');
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
                ->rawColumns(['checkbox', 'order_date',  'order_status','actions'])
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
        
        if(request()->ajax()){
            $request->validate([
                'customer_id' => 'required',
                'price_ids' => 'required',
                'product_ids' => 'required',
                'sub_total' => 'required',
                'total' => 'required',
                'discount' => 'required',
            ]);

            $order = Order::create([
                'order_id' => mt_rand(111111, 999999),
                'user_id' => $user->id,
                'customer_id' => $request->customer_id,
                'price_ids' => $request->price_ids,
                'product_ids' => $request->product_ids,
                'user_name' => $user->name,
                'user_phone' => $user->phone ? $user->phone : 0,
                'order_code' => 'R' . mt_rand(111111, 999999),
                'shipping_charge' => $request->shipping_charge,
                'sub_total' => $request->sub_total,
                'total' => $request->total,
                'discount' => $request->discount,
                'paid' => 0,
                'due' => $request->sub_total,
                'coupon_id' => NULL,
                'order_note' => NULL,
                'payment_method' => $request->order_type,
                'sales_type' => $request->sales_type,
                'pending_at' => Carbon::now(),
            ]);

            $product_ids = json_decode($request->product_ids, true);

            foreach($product_ids as $product_id){
                ProductResalePrice::create([
                    'product_id'=> $product_id,
                    'customer_id'=> $request->customer_id,
                    'reseller_id'=> $user->id,
                    'order_id'=> $order->id,

                    'main_rate' => $request["product_{$product_id}_rate"],
                    'resale_rate' => $request["product_resale_{$product_id}_rate"],
                    'resale_prices' => $request["product_{$product_id}_amount"],
                    'quantities' => $request["product_{$product_id}_quantities"],
                    'resale_discount_amount' => $request["product_{$product_id}_discount"],
                ]);
            }

            return response()->json(["status"=> true, "message"=> "Order Placed Successfully!"]);
        }
    }

    // Display the specified resource.
    public function show(string $id)
    {
        $selected_products = array();
        $order = Order::findOrFail($id);
        $reseller = User::with('reseller')->where('id', $id)->first();
        if(!$reseller){
            $reseller = Auth::user();
        }
        
        if(is_array(json_decode($order->product_ids))){
            $selected_products = ProductResalePrice::with('product')->where('order_id', $id)->latest('updated_at')->get();
        }

        // return compact('selected_products', 'order', 'reseller');

        return view("{$this->route_path['view']}.print", compact('selected_products', 'order', 'reseller'));
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

        return view("{$this->route_path['view']}.edit", compact('data', 'selected_products'));
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

            $order->customer_id = $request->customer_id;
            $order->price_ids = $request->price_ids;
            $order->product_ids = $request->product_ids;
            $order->shipping_charge = $request->shipping_charge;
            $order->sub_total = $request->sub_total;
            $order->total = $request->total;
            $order->discount = $request->discount;
            $order->due = $request->sub_total;
            $order->payment_method = $request->order_type;
            $order->sales_type = $request->sales_type;

            $product_ids = json_decode($request->product_ids, true);
            $previous_resale_ids = ProductResalePrice::where('order_id', $id)->pluck('id')->toArray();
            ProductResalePrice::whereIn('id', $previous_resale_ids)->delete();

                foreach($product_ids as $product_id){ 
                    ProductResalePrice::create([
                        'product_id'=> $product_id,
                        'reseller_id'=> Auth::id(),
                        'customer_id'=> $request->customer_id,
                        'order_id'=> $order->id,

                        'main_rate' => $request["product_{$product_id}_rate"],
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
        return helperClass::resourceDataDelete('orders', $request, $id, null, null);
    }
}
