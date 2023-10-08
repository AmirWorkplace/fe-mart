<?php

namespace App\Http\Controllers\Admin;

use App\helperClass;
use App\Models\Brand;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Yajra\DataTables\Facades\DataTables;

class BrandController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        if (request()->ajax()) {
            $model = Brand::with(['products'])->latest('id');
            return DataTables::eloquent($model)
                ->addColumn('checkbox', function ($row) {
                    $checkbox = '<div class="custom-control custom-checkbox">
                    <input type="checkbox" class="custom-control-input multi_checkbox" id="' . $row->id . '" name="multi_checkbox[]" value="' . $row->id . '"><label for="' . $row->id . '" class="custom-control-label"></label></div>';
                    return $checkbox;
                })
                ->addColumn('image', function ($row) {
                    return '<img src="' . asset($row->image) . '" height="40" alt="' . $row->name . '">';
                })
                ->addColumn('status', function ($row) {
                    $status =
                        '<div class="form-check form-switch">
                        <input class="form-check-input change-status c-pointer" data-url="' . Route('admin.brand.edit', $row->id) . '" type="checkbox" name="status"';
                    if (count($row->products) > 0) {
                        $status .= ' disabled ';
                    }

                    if ($row->status == 1) {
                        $status .= ' checked ';
                    }
                    $status .= '>
                    </div>';
                    return $status;
                })
                ->addColumn('actions', function ($row) {
                    $actionBtn = '<div class="btn-group">
                        <button type="button" class="btn btn-sm btn-warning border-0 px-10px fs-15 link-edit" data-url="' . Route('admin.brand.edit', $row->id) . '"><i class="far fa-pencil-alt"></i></button>
                        <button type="button" class="btn btn-sm btn-danger border-0 px-10px fs-15 link-delete"';
                    if (count($row->products) > 0) {
                        $actionBtn .= ' disabled ';
                    }
                    $actionBtn .= 'data-url="' . Route('admin.brand.destroy', $row->id) . '"><i class="far fa-trash-alt"></i></button></div>';
                    return $actionBtn;
                })
                ->rawColumns(['checkbox', 'image', 'status', 'actions'])
                ->make(true);
        }
        return view('admin.brand.index');
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
        $request->validate([
            'name' => 'required|unique:brands,name',
            'image' => 'required|image',
            'status' => 'required',
        ]);

        $check_slug = Brand::where('slug', Str::slug($request->name))->latest('id')->first();
        if (!is_null($check_slug)) {
            $slug = Str::slug($request->name) . '-' . uniqid();
        } else {
            $slug = Str::slug($request->name);
        }

        $image = $request->file('image');
        if (isset($image)) {
            $response = helperClass::storeImage($image, 200, 'media/brand/');
            if ($response['status'] == 'success') {
                $path_name =  $response['path_name'];
            } else {
                $path_name = NULL;
            }
        } else {
            $path_name = NULL;
        }

        Brand::create([
            'name' => $request->name,
            'slug' => $slug,
            'image' => $path_name,
            'status' => $request->status,
        ]);

        return redirect()->back()->withSuccessMessage('Created Successfully!');
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
            $data = Brand::findOrFail($id);
            $data->update(['status' => !$data->status]);
            return response()->json(['status' => 'success']);
        }

        if (request()->ajax()) {
            $data = Brand::findOrFail($id);
            $form_link = route('admin.brand.update', $id);
            return response()->json(['status' => 'success', 'data' => $data, 'form_link' => $form_link]);
        }
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $request->validate([
            'name' => 'required|unique:brands,name,' . $id,
            'image' => 'image',
            'status' => 'required',
        ]);

        $brand = Brand::findOrFail($id);
        $check_slug = Brand::whereNotIn('id', [$id])->where('slug', Str::slug($request->name))->latest('id')->first();
        if (!is_null($check_slug)) {
            $slug = Str::slug($request->name) . '-' . uniqid();
        } else {
            $slug = Str::slug($request->name);
        }

        $image = $request->file('image');
        if (isset($image)) {
            $response = helperClass::storeImage($image, 200, 'media/brand/', $brand->image);
            if ($response['status'] == 'success') {
                $path_name =  $response['path_name'];
            } else {
                $path_name = $brand->image;
            }
        } else {
            $path_name = $brand->image;
        }

        $brand->update([
            'name' => $request->name,
            'slug' => $slug,
            'image' => $path_name,
            'status' => $request->status,
        ]);

        return redirect()->back()->withSuccessMessage('Updated Successfully!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Request $request, string $id)
    {
        if ($request->id) {
            foreach ($request->id as $id) {
                $brand = Brand::findOrFail($id);
                if (count($brand->products) == 0) {
                    if (file_exists($brand->image)) {
                        unlink($brand->image);
                    }
                    $brand->delete();
                }
            }
            return response()->json(['status' => 'success']);
        }
        $brand = Brand::findOrFail($id);
        if (count($brand->products) == 0) {
            if (file_exists($brand->image)) {
                unlink($brand->image);
            }
            $brand->delete();
        }
        return response()->json(['status' => 'success']);
    }
}
