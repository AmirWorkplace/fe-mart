<?php

namespace App\Http\Controllers\Admin;

use App\helperClass;
use App\Models\Flashdeal;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\FlashdealProduct;
use App\Models\Product;
use Yajra\DataTables\Facades\DataTables;

class FlashdealController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        if (request()->ajax()) {
            $model = Flashdeal::with(['items'])->latest('id');
            return DataTables::eloquent($model)
                ->addColumn('checkbox', function ($row) {
                    $checkbox = '<div class="custom-control custom-checkbox">
                    <input type="checkbox" class="custom-control-input multi_checkbox" id="' . $row->id . '" name="multi_checkbox[]" value="' . $row->id . '"><label for="' . $row->id . '" class="custom-control-label"></label></div>';
                    return $checkbox;
                })
                ->addColumn('banner', function ($row) {
                    if (file_exists($row->banner)) {
                        return '<img src="' . asset($row->banner) . '" height="50" style="max-width: 150px;" alt="">';
                    }
                })
                ->addColumn('total_products', function ($row) {
                    return count($row->items);
                })
                ->addColumn('status', function ($row) {
                    $status =
                        '<div class="form-check form-switch">
                        <input class="form-check-input change-status c-pointer" data-url="' . Route('admin.deal.edit', $row->id) . '" type="checkbox" name="status"';
                    if ($row->status == 1) {
                        $status .= ' checked ';
                    }
                    $status .= '>
                    </div>';
                    return $status;
                })
                ->addColumn('featured', function ($row) {
                    $featured =
                        '<div class="form-check form-switch">
                        <input class="form-check-input change-featured c-pointer" data-url="' . Route('admin.deal.edit', $row->id) . '" type="checkbox" name="featured"';
                    if ($row->featured == 1) {
                        $featured .= ' checked ';
                    }
                    $featured .= '>
                    </div>';
                    return $featured;
                })
                ->addColumn('start_date', function ($row) {
                    return date('d-m-Y H:i:s A', strtotime($row->start_date));
                })
                ->addColumn('end_date', function ($row) {
                    return date('d-m-Y H:i:s A', strtotime($row->end_date));
                })
                ->addColumn('actions', function ($row) {
                    $actionBtn = '<div class="btn-group">
                        <a href="' . Route('admin.deal.edit', $row->id) . '" class="btn btn-sm btn-warning border-0 px-10px fs-15"><i class="far fa-pencil-alt"></i></a>
                        <button type="button" class="btn btn-sm btn-danger border-0 px-10px fs-15 link-delete" data-url="' . Route('admin.deal.destroy', $row->id) . '"><i class="far fa-trash-alt"></i></button></div>';
                    return $actionBtn;
                })
                ->rawColumns(['checkbox', 'banner', 'status', 'featured', 'actions'])
                ->make(true);
        }
        return view('admin.flash_deal.index');
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        if (request()->ajax() && request()->has('category_ids')) {
            $products = Product::with(['price']);
            if (!is_null(request('product_ids'))) {
                $products->whereNotIn('id', request('product_ids'));
            }
            $products = $products->whereIn('category_id', request('category_ids'))->get();
            return response()->json(['status' => 'success', 'products' => $products]);
        }

        if (request()->ajax() && request()->has('product_id')) {
            $product = Product::with(['price'])->where('id', request('product_id'))->first();
            return response()->json(['status' => 'success', 'product' => $product]);
        }

        $categories = Category::where('status', 1)->orderBy('name')->get();
        return view('admin.flash_deal.create', compact('categories'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'title' => 'required',
            'date_range' => 'required',
            'banner' => 'required|image',
            'status' => 'required',
            'featured' => 'required',
            'product_ids' => 'required',
        ]);


        if ($request->featured == 1) {
            Flashdeal::query()->update(['featured' => 0]);
        }

        $slug = Str::slug($request->title);
        $same_slug_count = Flashdeal::where('slug', 'LIKE', $slug . '%')->count();
        $slug_suffix = $same_slug_count ? '-' . $same_slug_count + 1 : '';
        $slug .= $slug_suffix;

        $flash_deal = new Flashdeal();
        $flash_deal->title = $request->title;
        $date_var               = explode(" to ", $request->date_range);
        $flash_deal->start_date = date('Y-m-d H:i:s', strtotime($date_var[0]));
        $flash_deal->end_date   = date('Y-m-d H:i:s', strtotime($date_var[1]));
        $flash_deal->slug = $slug;
        $flash_deal->featured = $request->featured;
        $flash_deal->status = $request->status;
        $banner = $request->banner;
        if (isset($banner)) {
            $response = helperClass::storeImage($banner, 1000, 'media/flash-deal/');
            if ($response['status'] == 'success') {
                $flash_deal->banner = $response['path_name'];
            }
        }
        if ($flash_deal->save()) {
            foreach ($request->product_ids as $key => $product_id) {
                $flash_deal_product = new FlashdealProduct();
                $flash_deal_product->flash_deal_id = $flash_deal->id;
                $flash_deal_product->product_id = $product_id;
                $flash_deal_product->discount_type = $request->discount_type[$key];
                $flash_deal_product->discount = $request->discount[$key];
                $flash_deal_product->save();
            }
        }
        return redirect()->route('admin.deal.index')->withSuccessMessage('Created Successfully!');
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
        if (request()->ajax() && request('status')) {
            $data = Flashdeal::findOrFail($id);
            $data->update(['status' => !$data->status]);
            return response()->json(['status' => 'success']);
        }

        if (request()->ajax() && request('featured')) {
            $data = Flashdeal::findOrFail($id);
            if ($data->featured == 0) {
                Flashdeal::query()->update(['featured' => 0]);
            }
            $data->update(['featured' => !$data->featured]);
            return response()->json(['status' => 'success']);
        }

        if (request()->ajax() && request()->has('category_ids')) {
            $products = Product::with(['price']);
            if (!is_null(request('product_ids'))) {
                $products->whereNotIn('id', request('product_ids'));
            }
            $products = $products->whereIn('category_id', request('category_ids'))->get();
            return response()->json(['status' => 'success', 'products' => $products]);
        }

        if (request()->ajax() && request()->has('product_id')) {
            $product = Product::with(['price'])->where('id', request('product_id'))->first();
            return response()->json(['status' => 'success', 'product' => $product]);
        }

        $data = Flashdeal::findOrFail($id);
        $categories = Category::where('status', 1)->orderBy('name')->get();
        return view('admin.flash_deal.edit', compact('data', 'categories'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $request->validate([
            'title' => 'required',
            'date_range' => 'required',
            'banner' => 'image',
            'status' => 'required',
            'featured' => 'required',
        ]);


        if ($request->featured == 1) {
            Flashdeal::query()->update(['featured' => 0]);
        }

        $slug = Str::slug($request->title);
        $same_slug_count = Flashdeal::where('slug', 'LIKE', $slug . '%')->whereNotIn('id', [$id])->count();
        $slug_suffix = $same_slug_count ? '-' . $same_slug_count + 1 : '';
        $slug .= $slug_suffix;

        $flash_deal = Flashdeal::findOrFail($id);
        $flash_deal->title = $request->title;
        $date_var               = explode(" to ", $request->date_range);
        $flash_deal->start_date = date('Y-m-d H:i:s', strtotime($date_var[0]));
        $flash_deal->end_date   = date('Y-m-d H:i:s', strtotime($date_var[1]));
        $flash_deal->slug = $slug;
        $flash_deal->featured = $request->featured;
        $flash_deal->status = $request->status;
        $banner = $request->banner;
        if (isset($banner)) {
            $response = helperClass::storeImage($banner, 1000, 'media/flash-deal/', $flash_deal->banner);
            if ($response['status'] == 'success') {
                $flash_deal->banner = $response['path_name'];
            }
        }
        if ($flash_deal->save()) {
            foreach ($flash_deal->items as $key => $item) {
                $item->delete();
            }
            foreach ($request->product_ids as $key => $product_id) {
                $flash_deal_product = new FlashdealProduct();
                $flash_deal_product->flash_deal_id = $flash_deal->id;
                $flash_deal_product->product_id = $product_id;
                $flash_deal_product->discount_type = $request->discount_type[$key];
                $flash_deal_product->discount = $request->discount[$key];
                $flash_deal_product->save();
            }
        }
        return redirect()->route('admin.deal.index')->withSuccessMessage('Updated Successfully!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Request $request, string $id)
    {
        if ($request->id) {
            foreach ($request->id as $id) {
                $flash_deal = Flashdeal::findOrFail($id);
                if (file_exists($flash_deal->banner)) {
                    unlink($flash_deal->banner);
                }
                foreach ($flash_deal->items as $key => $item) {
                    $item->delete();
                }
                $flash_deal->delete();
            }
            return response()->json(['status' => 'success']);
        }

        $flash_deal = Flashdeal::findOrFail($id);
        if (file_exists($flash_deal->banner)) {
            unlink($flash_deal->banner);
        }
        foreach ($flash_deal->items as $key => $item) {
            $item->delete();
        }
        $flash_deal->delete();
        return response()->json(['status' => 'success']);
    }
}
