<?php

namespace App\Http\Controllers\Admin;

use App\helperClass;
use App\Http\Controllers\Controller;
use App\Models\Brand;
use App\Models\Category;
use App\Models\HomeProductSection;
use Illuminate\Http\Request;
use Yajra\DataTables\Facades\DataTables;

class HomeProductSectionController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        if (request()->ajax()) {
            $model = HomeProductSection::with(['category'])->latest('id');
            return DataTables::eloquent($model)
                ->addColumn('checkbox', function ($row) {
                    $checkbox = '<div class="custom-control custom-checkbox">
                    <input type="checkbox" class="custom-control-input multi_checkbox" id="' . $row->id . '" name="multi_checkbox[]" value="' . $row->id . '"><label for="' . $row->id . '" class="custom-control-label"></label></div>';
                    return $checkbox;
                })
                ->addColumn('brands', function ($row) {
                    $brand_ids = json_decode($row->brand_ids);
                    $brands = Brand::whereIn('id', $brand_ids)->get(['name'])->toArray();
                    return str_replace('","', ', ', json_encode(array_column($brands, 'name')));
                })
                ->addColumn('banner_one', function ($row) {
                    if (file_exists($row->banner_one)) {
                        return '<img src="' . asset($row->banner_one) . '" height="50" style="max-width: 150px;" alt="">';
                    }
                })
                ->addColumn('banner_two', function ($row) {
                    if (file_exists($row->banner_two)) {
                        return '<img src="' . asset($row->banner_two) . '" height="50" style="max-width: 150px;" alt="">';
                    }
                })
                ->addColumn('status', function ($row) {
                    $status =
                        '<div class="form-check form-switch">
                        <input class="form-check-input change-status c-pointer" data-url="' . Route('admin.home-product-section.edit', $row->id) . '" type="checkbox" name="status"';
                    if ($row->status == 1) {
                        $status .= ' checked ';
                    }
                    $status .= '>
                    </div>';
                    return $status;
                })
                ->addColumn('actions', function ($row) {
                    $actionBtn = '<div class="btn-group">
                        <a href="' . Route('admin.home-product-section.edit', $row->id) . '" class="btn btn-sm btn-warning border-0 px-10px fs-15"><i class="far fa-pencil-alt"></i></a>
                        <button type="button" class="btn btn-sm btn-danger border-0 px-10px fs-15 link-delete" data-url="' . Route('admin.home-product-section.destroy', $row->id) . '"><i class="far fa-trash-alt"></i></button></div>';
                    return $actionBtn;
                })
                ->rawColumns(['checkbox', 'brands', 'banner_one', 'banner_two', 'status', 'actions'])
                ->make(true);
        }
        return view('admin.home_product_section.index');
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        $categories = Category::root()->where('status', 1)->orderBy('name')->get();
        $brands = Brand::where('status', 1)->orderBy('name')->get();
        return view('admin.home_product_section.create', compact('categories', 'brands'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'category_id' => 'required',
            'status' => 'required',
        ]);

        $banner_one = $request->file('banner_one');
        if (isset($banner_one)) {
            $response = helperClass::storeImage($banner_one, 1000, 'media/section-banner/');
            if ($response['status'] == 'success') {
                $banner_one_path_name =  $response['path_name'];
            } else {
                $banner_one_path_name = NULL;
            }
        } else {
            $banner_one_path_name = NULL;
        }

        $banner_two = $request->file('banner_two');
        if (isset($banner_two)) {
            $response = helperClass::storeImage($banner_two, 1000, 'media/section-banner/');
            if ($response['status'] == 'success') {
                $banner_two_path_name =  $response['path_name'];
            } else {
                $banner_two_path_name = NULL;
            }
        } else {
            $banner_two_path_name = NULL;
        }

        $order = $request->order;
        if (is_null($order)) {
            $max_sl = HomeProductSection::orderBy('order', 'desc')->select(['order'])->first();
            $order = $max_sl ? $max_sl->order + 1 : 1;
        }

        $brand_ids = json_encode($request->brand_id);
        HomeProductSection::create([
            'category_id' => $request->category_id,
            'brand_ids' => $brand_ids,
            'second_row_content' => $request->second_row_content,
            'banner_one' => $banner_one_path_name,
            'banner_one_link' => $request->banner_one_link,
            'banner_two' => $banner_two_path_name,
            'banner_two_link' => $request->banner_two_link,
            'order' => $order,
            'status' => $request->status,
        ]);

        return redirect()->route('admin.home-product-section.index')->withSuccessMessage('Created Successfully!');
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
            $data = HomeProductSection::findOrFail($id);
            $data->update(['status' => !$data->status]);
            return response()->json(['status' => 'success']);
        }

        $categories = Category::root()->where('status', 1)->orderBy('name')->get();
        $brands = Brand::where('status', 1)->orderBy('name')->get();
        $data = HomeProductSection::findOrFail($id);
        return view('admin.home_product_section.edit', compact('data', 'categories', 'brands'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $request->validate([
            'category_id' => 'required',
            'status' => 'required',
        ]);

        $section = HomeProductSection::findOrFail($id);
        $banner_one = $request->file('banner_one');
        if (isset($banner_one)) {
            $response = helperClass::storeImage($banner_one, 1000, 'media/section-banner/', $section->banner_one);
            if ($response['status'] == 'success') {
                $banner_one_path_name =  $response['path_name'];
            }
        } else {
            $banner_one_path_name = $section->banner_one;
        }

        $banner_two = $request->file('banner_two');
        if (isset($banner_two)) {
            $response = helperClass::storeImage($banner_two, 1000, 'media/section-banner/', $section->banner_two);
            if ($response['status'] == 'success') {
                $banner_two_path_name =  $response['path_name'];
            }
        } else {
            $banner_two_path_name = $section->banner_two;
        }

        $order = $request->order;
        if (is_null($order)) {
            $order = $section->order;
        }

        if ($request->second_row_content == 'blank') {
            if (file_exists($section->banner_one)) {
                unlink($section->banner_one);
            }
            if (file_exists($section->banner_two)) {
                unlink($section->banner_two);
            }
        }

        $brand_ids = json_encode($request->brand_id);
        $section->update([
            'category_id' => $request->category_id,
            'brand_ids' => $brand_ids,
            'second_row_content' => $request->second_row_content,
            'banner_one' => $banner_one_path_name,
            'banner_one_link' => $request->banner_one_link,
            'banner_two' => $banner_two_path_name,
            'banner_two_link' => $request->banner_two_link,
            'order' => $order,
            'status' => $request->status,
        ]);

        return redirect()->route('admin.home-product-section.index')->withSuccessMessage('Updated Successfully!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Request $request, string $id)
    {
        if ($request->id) {
            foreach ($request->id as $id) {
                $section = HomeProductSection::findOrFail($id);
                if (file_exists($section->banner_one)) {
                    unlink($section->banner_one);
                }
                if (file_exists($section->banner_two)) {
                    unlink($section->banner_two);
                }
                $section->delete();
            }
            return response()->json(['status' => 'success']);
        }
        $section = HomeProductSection::findOrFail($id);
        if (file_exists($section->banner_one)) {
            unlink($section->banner_one);
        }
        if (file_exists($section->banner_two)) {
            unlink($section->banner_two);
        }
        $section->delete();
        return response()->json(['status' => 'success']);
    }
}
