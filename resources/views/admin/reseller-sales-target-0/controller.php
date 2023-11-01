<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Product;
use App\Models\ResellerSalesTarget;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Yajra\DataTables\Facades\DataTables;

class ResellerSalesTargetController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        if (request()->ajax()) {
            $model = ResellerSalesTarget::query();
            return DataTables::eloquent($model)
                ->addColumn('checkbox', function ($row) {
                    $checkbox = '<div class="custom-control custom-checkbox">
                    <input type="checkbox" class="custom-control-input multi_checkbox" id="' . $row->id . '" name="multi_checkbox[]" value="' . $row->id . '"><label for="' . $row->id . '" class="custom-control-label"></label></div>';
                    return $checkbox;
                })
                ->addColumn('date', function ($row) {
                    return Carbon::parse($row->start_date)->format('m/d/Y | H:s A') . " - " . Carbon::parse($row->start_date)->format('m/d/Y | H:s: A');
                })
                ->addColumn('product_names', function ($row) {

                    $products = Product::select('id', 'name')->WhereIn('id', json_decode($row->product_ids))->where('status', true)->latest('id')->get();
                    $product_names = $products->pluck('name')->toArray();
                    return implode(", ", $product_names);
                })
                ->addColumn('target_price', function ($row) {
                    return "<p class='text-center'> ". number_format($row->target_amount) ." Tk.";
                })
                ->addColumn('discount_value', function ($row) {
                    return "<p class='text-center'> ". number_format($row->discount_amount) ." Tk.";
                })
                ->addColumn('discount_price', function ($row) {
                    return 0;
                })
                ->addColumn('status', function ($row) {
                    $edit = route("admin.reseller-product-discount.edit", $row->id);
                    $is_checked = $row->status == 1 ? "checked" : "";

                    return  "<div class='form-check form-switch'>
                                <input {$is_checked} class='form-check-input change-status c-pointer' data-url='{$edit}' type='checkbox' name='status'>
                            </div>";
                 })
                ->addColumn('actions', function ($row) {
                    $edit = route("admin.reseller-sales-target.edit", $row->id);
                    $delete = route("admin.reseller-sales-target.destroy", $row->id);
 
                    return "<div class='btn-group'>
                                <a href='{$edit}' class='btn btn-sm btn-warning border-0 px-10px fs-15 link-edit'>
                                    <i class='far fa-pencil-alt'></i>
                                </a>
                                <button type='button' class='btn btn-sm btn-danger border-0 px-10px fs-15 link-delete' data-url='{$delete}'>
                                    <i class='far fa-trash-alt'></i>
                                </button>
                            </div>";

                })
                ->rawColumns(['checkbox', 'date', 'product_names', 'target_price', 'discount_value', 'status', 'actions'])
                ->make(true);
        }

        return view('admin.reseller-sales-target.index');
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $discount_reseller_products = ResellerSalesTarget::select('product_ids')->get();
        $existing_product_ids = $discount_reseller_products->pluck('product_ids')->toArray();

        $categories = Category::where('parent_id', NULL)->where('status', true)->get();
        return view('admin.reseller-sales-target.create', compact('existing_product_ids', 'categories'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'select_products'=> 'required',
            'select_main_category'=> 'required',
            'target_amount'=> 'required',
            'discount_amount'=> 'required',
            'start_date'=> 'required',
            'end_date'=> 'required',
        ]);

        ResellerSalesTarget::create([
            'product_ids'=> json_encode($request->select_products),
            'target_amount'=> $request->target_amount,
            'discount_amount'=> $request->discount_amount,
            'start_time'=> $request->start_date,
            'end_time'=> $request->end_date,
            'status'=> true,
        ]);

        return redirect()->route('admin.reseller-sales-target.index')->withSuccessMessage('Product Discount Added Successfully!');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        $data = ResellerSalesTarget::findOrFail($id);

        if (request()->ajax() && request('status')) {
            $data->update(['status' => !$data->status]);
            return response()->json(['status' => 'success']);
        }
        
        $categories = Category::where('parent_id', NULL)->where('status', true)->latest('id')->get();
        $products = Product::select('id', 'name')->whereIn('id', json_decode($data->product_ids))->where('status', true)->get(); 

        return view('admin.reseller-sales-target.edit', compact('data', 'categories', 'products'));

    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $request->validate([
            'select_products'=> 'required',
            'select_main_category'=> 'required',
            'target_amount'=> 'required',
            'discount_amount'=> 'required',
            'start_date'=> 'required',
            'end_date'=> 'required',
        ]);

        ResellerSalesTarget::where('id', $id)->update([
            'product_ids'=> json_encode($request->select_products),
            'target_amount'=> $request->target_amount,
            'discount_amount'=> $request->discount_amount,
            'start_time'=> $request->start_date,
            'end_time'=> $request->end_date,
        ]);

        return redirect()->route('admin.reseller-sales-target.index')->withSuccessMessage('Product Discount Updated Successfully!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
