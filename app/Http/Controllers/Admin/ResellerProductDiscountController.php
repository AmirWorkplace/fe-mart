<?php

namespace App\Http\Controllers\Admin;

use App\Helper\AdditionalDataResource;
use App\helperClass;
use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Product;
use App\Models\ResellerProductDiscount;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Yajra\DataTables\Facades\DataTables;

class ResellerProductDiscountController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {

        if (request()->ajax()) {
            $model = ResellerProductDiscount::query();
            return DataTables::eloquent($model)
                ->addColumn('checkbox', function ($row) {
                    $checkbox = '<div class="custom-control custom-checkbox">
                    <input type="checkbox" class="custom-control-input multi_checkbox" id="' . $row->id . '" name="multi_checkbox[]" value="' . $row->id . '"><label for="' . $row->id . '" class="custom-control-label"></label></div>';
                    return $checkbox;
                })
                ->addColumn('date', function ($row) {
                    return Carbon::parse($row->start_date)->format('m/d/Y | H:s A') . " - " . Carbon::parse($row->start_date)->format('m/d/Y | H:s: A');
                })
                ->addColumn('product_name', function ($row) {
                    $product = Product::select('id', 'name')->findOrFail($row->product_id);
                    return $product->name;
                })
                ->addColumn('reseller_price', function ($row) {
                    $product = Product::select('id')->with('price')->findOrFail($row->product_id);
                    return "<p class='text-center'> {$product->price->reseller_price} Tk.";
                })
                ->addColumn('discount', function ($row) {
                    return "<p class='text-center'> {$row->discount} Tk.";
                })
                ->addColumn('discount_price', function ($row) {
                    return "<p class='text-center'> {$row->price} Tk.";
                })
                ->addColumn('status', function ($row) {
                    $edit = route("admin.reseller-product-discount.edit", $row->id);
                    $is_checked = $row->status == 1 ? "checked" : "";

                    return  "<div class='form-check form-switch'>
                                <input {$is_checked} class='form-check-input change-status c-pointer' data-url='{$edit}' type='checkbox' name='status'>
                            </div>";
                 })
                ->addColumn('actions', function ($row) {
                    $edit = route("admin.reseller-product-discount.edit", $row->id);
                    $delete = route("admin.reseller-product-discount.destroy", $row->id);
 
                    return "<div class='btn-group'>
                                <a href='{$edit}' class='btn btn-sm btn-warning border-0 px-10px fs-15 link-edit'>
                                    <i class='far fa-pencil-alt'></i>
                                </a>
                                <button type='button' class='btn btn-sm btn-danger border-0 px-10px fs-15 link-delete' data-url='{$delete}'>
                                    <i class='far fa-trash-alt'></i>
                                </button>
                            </div>";

                })
                ->rawColumns(['checkbox', 'date', 'product_name', 'reseller_price', 'discount', 'discount_price', 'status', 'actions'])
                ->make(true);
        }

        return view('admin.reseller-product-discount.index');
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $discount_reseller_products = ResellerProductDiscount::select('product_id')->get();
        $existing_product_ids = $discount_reseller_products->pluck('product_id')->toArray();

        $categories = Category::where('parent_id', NULL)->where('status', true)->get();
        return view('admin.reseller-product-discount.create', compact('existing_product_ids', 'categories'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'select_product'=> 'required',
            'select_main_category'=> 'required',
            'discount_percentage'=> 'required',
            'discount'=> 'required',
            'price'=> 'required',
            'start_date'=> 'required',
            'end_date'=> 'required',
        ]);

        ResellerProductDiscount::create([
            'product_id'=> $request->select_product,
            'discount_percentage'=> $request->discount_percentage,
            'discount'=> $request->discount,
            'price'=> $request->price,
            'start_time'=> $request->start_date,
            'end_time'=> $request->end_date,
            'status'=> true,
        ]);

        return redirect()->route('admin.reseller-product-discount.index')->withSuccessMessage('Product Discount Added Successfully!');
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
        $data = ResellerProductDiscount::findOrFail($id);

        if (request()->ajax() && request('status')) {
            $data->update(['status' => !$data->status]);
            return response()->json(['status' => 'success']);
        }
        
        $categories = Category::where('parent_id', NULL)->where('status', true)->latest('id')->get();
        $product = Product::with('price')->findOrFail($data->product_id); 

        return view('admin.reseller-product-discount.edit', compact('data', 'categories', 'product'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $request->validate([
            'select_product'=> 'required',
            'select_main_category'=> 'required',
            'discount_percentage'=> 'required',
            'discount'=> 'required',
            'price'=> 'required',
            'start_date'=> 'required',
            'end_date'=> 'required',
        ]);

        ResellerProductDiscount::where('id', $id)->update([
            'product_id'=> $request->select_product,
            'discount_percentage'=> $request->discount_percentage,
            'discount'=> $request->discount,
            'price'=> $request->price,
            'start_time'=> $request->start_date,
            'end_time'=> $request->end_date,
        ]);

        return redirect()->route('admin.reseller-product-discount.index')->withSuccessMessage('Product Discount Updated Successfully!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Request $request, string $id)
    {
        return helperClass::resourceDataDelete('reseller_product_discounts', $request, $id, null, null);
    }

    // receive parent category id and return all the subcategories and main_category's product.
    public function childCategoriesAndProducts($parent_category_id){
        if(request()->ajax()){
            $id = request('id');
            $child_categories = Category::select('id', 'name', 'parent_id')->where('parent_id', $id)->get();
            $products = AdditionalDataResource::getParentCategoryProducts($id, null, ['id', 'name']);

            return response()->json(['status'=> true, 'products'=> $products, 'categories'=> $child_categories]);
        }

    }

    public function childrenCategoriesAndProducts($child_category_id){
        if(request()->ajax()){
            $id = request('id');
            $children_categories = Category::select('id', 'name', 'parent_id')->where('parent_id', $id)->get();
            $products = AdditionalDataResource::getChildCategoryProducts($id, null, ['id', 'name']);

            return response()->json(['status'=> true, 'products'=> $products, 'categories'=> $children_categories]);
        }
    }

    public function onlySingleProduct($id){
        if(request()->ajax()){
            $product = Product::with('price')->findOrFail(request('id'));
            return response()->json(['status'=> true, 'product'=> $product]);
        }

        $product = Product::with('price')->findOrFail($id);
        return response()->json(['status'=> true, 'product'=> $product]);
    }
}
