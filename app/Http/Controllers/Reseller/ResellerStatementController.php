<?php

namespace App\Http\Controllers\Reseller;

use App\Helper\UserManagement;
use App\Http\Controllers\Controller;
use App\Http\Middleware\Customer;
use App\Models\CheckSalesTargetCashback;
use App\Models\CustomerEntry;
use App\Models\Order;
use App\Models\ProductResalePrice;
use App\Models\Reseller;
use App\Models\ResellerProductDiscount;
use App\Models\ResellerSalesTarget;
use App\Models\ResellerStatement;
use App\Models\Withdraw;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Yajra\DataTables\Facades\DataTables;

class ResellerStatementController extends Controller
{
    /**
        // $orders = Order::where('user_id', Auth::id())->where('status', 'Delivered')->latest('id')->get();
     * Display a listing of the resource.
     */
    public function index()
    {
        if(request()->ajax()){
            $query = ResellerStatement::query();
            $query->where("user_id", Auth::id());

            return DataTables::eloquent($query)
                 ->filter(function ($query) {
                    if (!empty(request('start_date')) && !empty(request('end_date'))) {
                        $query->where('created_at', '>=', Carbon::parse(request('start_date')))
                            ->where('created_at', '<=', Carbon::parse(request('end_date')));
                    }
                    if (!empty(request('status'))) {
                        $query->where('status', request('status'));
                    }
                }, true)
                ->addColumn('date', function($row){
                    return Carbon::parse($row->created_at)->format('d/m/Y | h:i:s A');
                })    
                ->addColumn('description', function($row){
                    return $row->description;
                })    
                ->addColumn('deposit', function($row){
                    return "<p class='text-center'>{$row->deposit} Tk.</p>";
                })    
                ->addColumn('withdraw', function($row){
                    return "<p class='text-center'>{$row->withdraw} Tk.</p>";
                })    
                ->addColumn('balance', function($row){
                    return "<p class='text-center'>{$row->balance} Tk.</p>";
                })
                ->rawColumns(['date', 'description', 'deposit', 'withdraw', 'balance'])
                ->make(true);   
        }

        return view('reseller.statement.statement');
    }

    /* protected function getResellerStatementData(string $start_date, string $end_date){
        $orders = Order::select('id', 'customer_id', 'total', 'shipping_charge', 'payment_method', 'order_code', 'sales_type', 'total_earning', 'pending_at')
            ->where('user_id', Auth::id())
            ->where('status', 'Delivered')
            ->where(function ($query) use ($start_date, $end_date) {
                $query->where('created_at', '>=', $start_date)
                    ->where('created_at', '<', $end_date);
            })
            ->latest('created_at')
            ->get();

        $withdraws = Withdraw::where('user_id', Auth::id())
            ->where('status', 'Succeed')
            ->latest('updated_at')
            ->where(function ($query) use ($start_date, $end_date) {
                $query->where('created_at', '>=', $start_date)
                    ->where('created_at', '<', $end_date);
            })
            ->get();
            
            
        $order_data = array();
        $withdraw_data = array();


        foreach ($orders as $order) {
            $products = ProductResalePrice::select('id', 'product_id', 'main_rate', 'resale_prices', 'quantities')->where('order_id', $order->id)->get();

            $total_cashback = 0;
            foreach ($products as $product) {
                $available_discount = ResellerProductDiscount::where('product_id', $product->product_id)
                    ->where('status', true)
                    ->where('start_time', '<=', date('Y-m-d', strtotime($order->pending_at)))
                    ->where('end_time', '>=', date('Y-m-d', strtotime($order->pending_at)))
                    ->first();

                    if($available_discount){
                        $discount = $product->quantities * $available_discount->discount;
                        $total_cashback += $discount;
                    }
            }

            $target_value = function() use($order, $products) {
                $prices = array();
                
                foreach ($products as $product) {
                    $prices[] = intval($product->main_rate) * intval($product->quantities);
                }

                    return array_sum($prices) + $order->total + $order->shipping_charge;
            };

            $resale_value = function() use($order, $products) {
                $resale_prices = array_sum($products->pluck('resale_prices')->toArray());
            
                return $resale_prices + $order->shipping_charge;   
            };

            $buyer = Auth::user()->name;
            if($order->customer_id) {
                $customer = CustomerEntry::select('name', 'phone', 'address')->where('id', $order->customer_id)->first();
                if($customer) $buyer = "{$customer->name} at {$customer->address}. Mobile {$customer->phone}";
            }

            $description = "Sell into {$buyer}. Invoice ID is {$order->order_code}, paid by " . strtoupper($order->payment_method) . " on " . ucwords($order->sales_type) . ".";

            if($total_cashback > 0){
                $description = "Sell into {$buyer}. Invoice ID is {$order->order_code}, paid by " . strtoupper($order->payment_method) . " on " . ucwords($order->sales_type) . ". And got a cashback!";
            }

            $order_data[] = array(
                'withdraw_id'=> 0,
                'order_id'=> $order->id,
                'target_value'=>$target_value(),
                'resale_value'=>$resale_value(),
                'deposit'=> ($resale_value() - $target_value()) + $total_cashback,
                'withdraw'=> 0,
                'date'=> $order->pending_at,
                'description'=> $description,
                'previous_earning'=> $order->total_earning,
                'cashback'=> $total_cashback,
                // 'balance'=> null,
            );
        }

        foreach($withdraws as $withdraw){
            $ts_id = $withdraw->transaction_id ? ' of transaction ID are ' . $withdraw->transaction_id : '';
            $description = "Withdraw from " . ucwords($withdraw->withdrawal_method) . " at {$withdraw->account_number}{$ts_id}.";

            $withdraw_data[] = array(
                'order_id'=> 0,
                'withdraw_id'=> $withdraw->id,
                'deposit'=> 0,
                'withdraw'=> $withdraw->withdraw_amount,
                'previous_earning'=> $withdraw->total_earning,
                'date'=> $order->pending_at,
                'description'=> $description,
                'cashback'=> 0,
                // 'balance'=> null,
            );
        }
        
        $data = array_merge($order_data, $withdraw_data);

        usort($data, function($a, $b) {return strtotime($a['date']) - strtotime($b['date']);});

        return $data;
    } */

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        // return [];
        // $prices = array();
        // $shipping_charge[] = intval($order->shipping_charge);         
        // $reseller_added_shipping_charge[] = intval($order->total);         
        // $resale_prices = $products->pluck('resale_prices')->toArray();
        // $prices[] = intval($product->main_rate) * intval($product->quantities); 
        // $products = ProductResalePrice::select('id', 'product_id', 'main_rate', 'resale_prices', 'quantities')->where('order_id', $order->id)->get();
    }

    // initiate reseller orders cashback, which cashback he got from his/her successful order.
    public function initiateResellerOrdersCashback(){
        $orders = Order::with('reseller_orders')->select('id', 'order_code', 'pending_at')->where('user_id', Auth::id())
            ->where('is_cashback', false)
            ->whereIn('status', ['Delivered', 'Successed', 'Succeed'])
            ->latest('id')
            ->get();

        $user_id = Auth::id();
        $all_cashback = array();
        foreach ($orders as $order) {

            $total_cashback = 0;
            foreach ($order->reseller_orders as $product) {

                $available_discount = ResellerProductDiscount::where('product_id', $product->product_id)
                    ->where('status', true)
                    ->where('start_time', '<=', date('Y-m-d', strtotime($order->pending_at)))
                    ->where('end_time', '>=', date('Y-m-d', strtotime($order->pending_at)))
                    ->first();

                if($available_discount){
                    $discount = $product->quantities * $available_discount->discount;
                    $total_cashback += $discount;
                }
            }

            if($total_cashback > 0){
                $get_last_statement = ResellerStatement::where('user_id', $user_id)->latest('id')->first();
                $last_statement_balance = $get_last_statement->balance ?? 0;
                $balance = $last_statement_balance + $total_cashback;

                $description = "Get Cashback from a order, invoice id at {$order->order_code}.";

                ResellerStatement::create([
                    'user_id'=> $user_id,
                    'order_id'=> $order->id,
                    'withdraw_id'=> NULL,
                    'description'=> $description,
                    'withdraw'=> 0,
                    'deposit'=> $total_cashback,
                    'balance'=> $balance,
                    'status'=> true,
                ]);
            }

            $all_cashback[$order->id] = $total_cashback;
        }

        // update cashback status
        $order_ids = $orders->pluck('id')->toArray();
        Order::whereIn('id', $order_ids)->update(['is_cashback' => true]);

        return response()->json(['status' => true, 'cashback' => $all_cashback]);
    }

    public function initiateResellerSalesTargetCashback(){
        $user_id = Auth::id();
        $sales_target = ResellerSalesTarget::where('status', true)->get();

        $message = array();
        foreach ($sales_target as $sales_product) {
            $is_exist_cashback = CheckSalesTargetCashback::where('user_id', $user_id)->where('offer_id', $sales_product->id)->exists();

            if (!$is_exist_cashback) {
                $start_date = Carbon::parse($sales_product->start_time);
                $end_date = Carbon::parse($sales_product->end_time);

                $orders = Order::with('reseller_orders')
                    ->whereIn('status', ['Delivered', 'Successed', 'Succeed'])
                    ->where('user_id', $user_id)
                    // ->where('is_sale_target_cashback', false)
                    ->whereBetween('pending_at', [$start_date, $end_date])
                    ->get();

                if(count($orders) > 0){
                    $sales_at_target_time = [];
                    foreach($orders as $order){
                        $total_price = $order->shipping_charge + $order->total;

                        foreach ($order->reseller_orders as $key => $reseller_order) {
                            $total_price += $reseller_order->resale_rate * $reseller_order->quantities;
                        }
                        
                        $sales_at_target_time[] = $total_price;
                    }
                    
                    $sales_amount_at_target_time = array_sum($sales_at_target_time);
                    if($sales_amount_at_target_time >= $sales_product->target_amount){
                        $get_last_statement = ResellerStatement::where('user_id', $user_id)->latest('id')->first();
                        $last_statement_balance = $get_last_statement->balance ?? 0;
                        $balance = $last_statement_balance + $sales_product->discount_amount;

                        $description = "Get Cashback to reached a maximum sales amount target. Your target was to sell products worth of {$sales_product->target_amount} Tk, and you sold products worth of {$sales_amount_at_target_time} Tk.";

                        $statement = ResellerStatement::create([
                            'user_id'=> $user_id,
                            'order_id'=> $order->id,
                            'withdraw_id'=> NULL,
                            'description'=> $description,
                            'withdraw'=> 0,
                            'deposit'=> $sales_product->discount_amount,
                            'balance'=> $balance,
                            'status'=> true,
                        ]);

                        if($statement) {
                            CheckSalesTargetCashback::create([
                                'user_id'=> $user_id, 
                                'offer_id' => $sales_product->id, 
                                'statement_id'=> $statement->id, 
                                'is_cashback'=> true
                            ]);
                        }
                    }

                    $message[$sales_product->id] = 'Sales Discount Added!';
                }
            } else {
                $message[$sales_product->id] = 'No Order Available in your sales target!';
            }
        }
        
        return response()->json(['status'=> true, 'messages'=> $message]);
    }
}