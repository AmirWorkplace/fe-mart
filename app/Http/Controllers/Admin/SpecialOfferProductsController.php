<?php

namespace App\Http\Controllers\Admin;

use App\helperClass;
use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Models\ProductPrice;
use App\Models\SpecialOfferProduct;
use Illuminate\Http\Request;
use Yajra\DataTables\Facades\DataTables;

class SpecialOfferProductsController extends Controller
{
    public $route;
    public $table;

    public function __construct(){
        $this->route = [
            "view"=> "admin.special-offer-products",
            "route"=> "admin.special-offer-products",
        ];

        $this->table = 'special_offer_products';
    }

    // Display a listing of the resource.
    public function index()
    {
        return helperClass::resourceDataView(SpecialOfferProduct::query(), ['name', 'serial'], null, $this->route);
    }

    // Show the form for creating a new resource.
    public function create()
    {
        $products = Product::with(['price'])->select('id', 'name', 'thumbnail')->where('status', true)->latest('id')->get();
        return view($this->route['view'] . '.create', compact('products'));
    }

    // Store a newly created resource in storage.
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'serial' => 'required',
            'selected_products' => 'required',
            'product_ids' => 'required',
        ]);

        $product_ids = json_decode($request->product_ids, true);

        // $data = array();

        foreach ($product_ids as $id) {
            ProductPrice::where('product_id', $id)->update(['offer_price' => $request["offer_price{$id}"]]);
            // $data[$id] = $request["offer_price{$id}"];
        }

        $slug = helperClass::createSlug($this->table, $request->name);

        SpecialOfferProduct::create([
            "product_ids" => $request->product_ids,
            "name" => $request->name,
            "serial" => $request->serial,
            "slug" => $slug,
            "status" => true,
        ]);

        return redirect()->route($this->route["route"] . ".index")->withSuccessMessage("Special Offer Created Successfully!");
    }

    // Display the specified resource.
    public function show(string $id)
    {
    }

    //Show the form for editing the specified resource.
    public function edit(string $id)
    {
        if (request()->ajax() && request('status') == 'true') {
            $data = SpecialOfferProduct::where('id', $id)->first();

            SpecialOfferProduct::where('id', $id)->update(['status' => !$data->status]);
            return response()->json(['status' => 'success']);
        }

        $data = SpecialOfferProduct::findOrFail($id);
        $products = Product::with(['price'])->select('id', 'name', 'thumbnail')->where('status', true)->latest('id')->get();

        return view($this->route['view'] . ".edit", compact('data', 'products'));
    }

    // Update the specified resource in storage.
    public function update(Request $request, string $id)
    {
        $data = SpecialOfferProduct::findOrFail($id);

        $request->validate([
            'name' => 'required',
            'serial' => 'required',
            'selected_products' => 'required',
            'product_ids' => 'required',
        ]);

        $product_ids = json_decode($request->product_ids, true);

        foreach ($product_ids as $id) {
            ProductPrice::where('product_id', $id)->update(['offer_price' => $request["offer_price{$id}"]]);
        }

        $slug = helperClass::createSlug($this->table, $request->name);

        $updated_data = [
            "product_ids" => $request->product_ids,
            "name" => $request->name,
            "serial" => $request->serial,
            "slug" => $slug,
            "status" => true,
        ];

        $data->update($updated_data);

        return redirect()->route($this->route["route"] . ".index")->withSuccessMessage("Special Offer Updated Successfully!");
    }

    // Remove the specified resource from storage.
    public function destroy(Request $request, string $id)
    {
        return helperClass::resourceDataDelete($this->table, $request, $id, null, null);
    }
}
