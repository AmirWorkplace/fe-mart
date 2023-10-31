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
        $current_month = Carbon::parse(date('Y-m-01'));
        $next_month = Carbon::parse(date('Y-m-t'));

                
        if(request()->ajax()){
            $data = $this->getResellerStatementData(start_date: request('start_date'), end_date: request('end_date'));

            if(count($data) <= 0){
                $message = "<tr class='text-center'>
                                <td colspan='5' class='text-danger text-capitalize'>
                                    <b>No records are available in your date range!</b>
                                </td>
                            </tr>";

                return response()->json(['status'=> false, 'message'=> $message]);
            }

            return response()->json(['status'=> true, 'data'=> $data]);
        }

        $data = $this->getResellerStatementData(start_date: $current_month, end_date: $next_month);

        return view('reseller.statement.index', compact('data', 'current_month', 'next_month'));
    }

    protected function getResellerStatementData(string $start_date, string $end_date){
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