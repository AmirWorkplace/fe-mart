<?php

namespace App\Http\Controllers\Reseller;

use App\Helper\UserManagement;
use App\Http\Controllers\Controller;
use App\Models\Order;
use App\Models\Product;
use App\Models\ProductPrice;
use App\Models\ProductResalePrice;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Yajra\DataTables\Facades\DataTables;

class ResellerCommissionController extends Controller
{
    public string|array $route_path;
    public array $total_data;

    public function __construct(){
        $this->route_path = [
            'view' => 'reseller.reseller-commission',
            'route' => 'admin.reseller-commission',
        ];
    }

    // Display a listing of the resource.
    public function index()
    {
        $auth_id = Auth::id();
        $model = Order::where('user_id', $auth_id)->where('status', 'Delivered')->latest('id');

        if (request()->ajax()) {
            return DataTables::eloquent($model)
                ->filter(function ($query) {
                    if (!empty(request('start_date')) && !empty(request('end_date'))) {
                        $query->where('created_at', '>=', request('start_date'))->where('created_at', '<=', request('end_date'));
                    }
                    if (!empty(request('status'))) {
                        $query->where('status', request('status'));
                    }
                }, true)
                ->addColumn('order_date', function ($row) {
                    return Carbon::parse($row->created_at)->format('d M Y | h:i A');
                })
                ->addColumn('product_details', function($row){
                    $products = Product::select('id', 'name')->whereIn('id', json_decode($row->product_ids, true))->where('status', true)->get();
                    $products_name = $products->pluck('name')->toArray();

                    return implode(", ", $products_name);
                })
                ->addColumn('invoice_value', function($row){
                    $prices = array();
                    $products = ProductResalePrice::select('id', 'main_rate', 'quantities')->where('order_id', $row->id)->get();
                    
                    foreach ($products as $key => $product) {
                        $prices[] = intval($product->main_rate) * intval($product->quantities);
                    }

                    return number_format((array_sum($prices) + $row->shipping_charge + $row->total), 2) . ' Tk.';
                })
                ->addColumn('reseller_value', function($row){
                    $products = ProductResalePrice::select('id', 'resale_prices', 'quantities')->where('order_id', $row->id)->get();
                    $resale_prices = array_sum($products->pluck('resale_prices')->toArray());
                    
                    return number_format(($resale_prices + $row->shipping_charge), 2) . ' Tk.';
                })
                // ->addColumn('cashback', function($row){
                //     $cashback_product_id = array(75,76);
                // })
                ->addColumn('reseller_earning', function($row){
                    $target_value = function() use($row) {
                        $prices = array();
                        $products = ProductResalePrice::select('id', 'main_rate', 'quantities')->where('order_id', $row->id)->get();
                        
                        foreach ($products as $key => $product) {
                            $prices[] = intval($product->main_rate) * intval($product->quantities);
                        }

                        return array_sum($prices) + $row->total + $row->shipping_charge;
                    };

                    $resale_value = function() use($row) {
                        $products = ProductResalePrice::select('id', 'resale_prices', 'quantities')->where('order_id', $row->id)->get();
                        $resale_prices = array_sum($products->pluck('resale_prices')->toArray());
                    
                        return $resale_prices + $row->shipping_charge;   
                    };

                    $earning = number_format($resale_value() - $target_value());
                    return "<p class='text-center'>{$earning} Tk.</p>";
                })
                ->rawColumns(['order_date', 'product_details', 'invoice_value', 'reseller_value', 'reseller_earning'])
                ->make(true);
        }
        
        return view("{$this->route_path['view']}.index");
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
