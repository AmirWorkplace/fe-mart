@extends('layouts.admin.app')

@section('content')
    @php 
        $app_data = json_encode([
            "user"=> Auth::user(),
            "resellerRoutes" => [
                "orderStore" => route('admin.order-place.store'),
                "orderView" => route('admin.order-place.index'),
            ],
            "productsList"=> App\AdditionalDataResource::getProductLists(),
            "customerOfReseller"=> App\AdditionalDataResource::getCustomerOfReseller(),
        ]);
    @endphp
    
    <div id="react-app-data" react-app-data="{{ $app_data }}"></div>
    <div id="react-app"></div>
@endsection

<?php

namespace App\Http\Controllers\Reseller;

use App\Helper\UserManagement;
use App\Http\Controllers\Controller;
use App\Http\Middleware\Customer;
use App\Models\CustomerEntry;
use App\Models\Order;
use App\Models\ProductResalePrice;
use App\Models\Reseller;
use App\Models\ResellerProductDiscount;
use App\Models\Withdraw;
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
        $orders = Order::with('reseller_orders')->where('user_id', Auth::id())->where('status', 'Delivered')->latest('created_at')->get();
        $order_data = array();

        $withdraws = Withdraw::where('user_id', Auth::id())->where('status', 'Succeed')->latest('created_at')->get();
        $withdraw_data = array();

        $total_cashback = 0;
        foreach ($orders as $order) {
            $target_value = function() use($order, $total_cashback) {
                $prices = array();
                $products = ProductResalePrice::/* select('id', 'product_id', 'main_rate', 'quantities', 'created_at')-> */where('order_id', $order->id)->get();
                
                foreach ($products as $product) {
                    $prices[] = intval($product->main_rate) * intval($product->quantities);
                }


                foreach($order->reseller_orders as $product) {
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

                $sum = array_sum($prices) + $order->total + $order->shipping_charge;
                return array('sum'=> $sum, 'total_cashback'=> $total_cashback);
            };

            // info();
            $cashback = $target_value()['total_cashback'];

            $resale_value = function() use($order) {
                $products = ProductResalePrice::select('id', 'resale_prices', 'quantities')->where('order_id', $order->id)->get();
                $resale_prices = array_sum($products->pluck('resale_prices')->toArray());
            
                return $resale_prices + $order->shipping_charge;   
            };

            $buyer = Auth::user()->name;
            if($order->customer_id) {
                $customer = CustomerEntry::select('name', 'phone', 'address')->where('id', $order->customer_id)->first();
                if($customer) $buyer = "{$customer->name} at {$customer->address}. Mobile {$customer->phone}";
            }

            $description = "Sell into {$buyer}. Invoice ID is {$order->order_code}, paid by " . strtoupper($order->payment_method) . " on " . ucwords($order->sales_type) . ".";

            $order_data[] = array(
                'id'=> $order->id,
                'target_value'=>$target_value(),
                'resale_value'=>$resale_value(),
                'deposit'=> $resale_value() - $target_value()['sum'],
                'withdraw'=> '0.00',
                'date'=> $order->created_at,
                'description'=> $description,
                'previous_earning'=> '0.00',
            );

            // $order_product_ids = json_decode($order->product_ids);
            // $available_discount = ResellerProductDiscount::whereIn('product_id', $order_product_ids)->where('status', true)->latest()->get();
            // info($available_discount);
        }

        foreach($withdraws as $withdraw){
            $ts_id = $withdraw->transaction_id ? ' of transaction ID are ' . $withdraw->transaction_id : '';
            $description = "Withdraw from " . ucwords($withdraw->withdrawal_method) . " at {$withdraw->account_number}{$ts_id}.";

            $withdraw_data[] = array(
                'id'=> $withdraw->id,
                'deposit'=> '0.00',
                'withdraw'=> $withdraw->withdraw_amount,
                'previous_earning'=> $withdraw->total_earning,
                'date'=> $order->created_at,
                'description'=> $description
            );
        }
        
        $data = array_merge($order_data, $withdraw_data);

        usort($data, function($a, $b) {return strtotime($a['date']) - strtotime($b['date']);});

        return view('reseller.statement.index', compact('data'));
    }

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
        //
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
        //
    }
}
