<?php

namespace App\Http\Controllers\Admin;

use App\helperClass;
use App\Models\Category;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Yajra\DataTables\Facades\DataTables;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        if (request()->ajax()) {
            $model = Category::with(['parent', 'products'])->latest('id');
            return DataTables::eloquent($model)
                ->addColumn('checkbox', function ($row) {
                    $checkbox = '<div class="custom-control custom-checkbox">
                    <input type="checkbox" class="custom-control-input multi_checkbox" id="' . $row->id . '" name="multi_checkbox[]" value="' . $row->id . '"><label for="' . $row->id . '" class="custom-control-label"></label></div>';
                    return $checkbox;
                })
                ->addColumn('image', function ($row) {
                    if (!is_null($row->image) && file_exists($row->image)) {
                        $image = '<img class="lazyload" data-src="' . asset($row->image) . '" height="40" alt="' . $row->name . '">';
                        return $image;
                    }
                })
                ->addColumn('parent', function ($row) {
                    if (!is_null($row->parent)) {
                        return $row->parent->name;
                    }
                })
                ->addColumn('status', function ($row) {
                    $status =
                        '<div class="form-check form-switch">
                        <input class="form-check-input change-status c-pointer" data-url="' . Route('admin.category.edit', $row->id) . '" type="checkbox" name="status"';
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
                        <button type="button" class="btn btn-sm btn-warning border-0 px-10px fs-15 link-edit" data-url="' . Route('admin.category.edit', $row->id) . '"><i class="far fa-pencil-alt"></i></button>
                        <button type="button" class="btn btn-sm btn-danger border-0 px-10px fs-15 link-delete"';
                    if (count($row->products) > 0) {
                        $actionBtn .= ' disabled ';
                    }
                    $actionBtn .= 'data-url="' . Route('admin.category.destroy', $row->id) . '"><i class="far fa-trash-alt"></i></button></div>';
                    return $actionBtn;
                })
                ->rawColumns(['checkbox', 'image', 'status', 'actions'])
                ->make(true);
        }
        $categories = Category::root()->with(['children'])->orderBy('name')->get();
        return view('admin.category.index', compact('categories'));
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
            'name' => 'required',
            'image' => 'image',
        ]);

        $check_slug = Category::where('slug', Str::slug($request->name))->latest('id')->first();
        if (!is_null($check_slug)) {
            $slug = Str::slug($request->name) . '-' . uniqid();
        } else {
            $slug = Str::slug($request->name);
        }

        if ($request->has('featured')) {
            $featured = 1;
        } else {
            $featured = 0;
        }

        if ($request->has('status')) {
            $status = 1;
        } else {
            $status = 0;
        }

        $image = $request->file('image');
        if (isset($image)) {
            $response = helperClass::storeImage($image, 200, 'media/category/');
            if ($response['status'] == 'success') {
                $path_name =  $response['path_name'];
            } else {
                $path_name = NULL;
            }
        } else {
            $path_name = NULL;
        }

        Category::create([
            'name' => $request->name,
            'parent_id' => $request->parent_id,
            'slug' => $slug,
            'image' => $path_name,
            'featured' => $featured,
            'status' => $status,
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
            $data = Category::findOrFail($id);
            $data->update(['status' => !$data->status]);
            return response()->json(['status' => 'success']);
        }

        if (request()->ajax()) {
            $data = Category::findOrFail($id);
            $form_link = route('admin.category.update', $id);
            $categories = Category::root()->with(['children'])->whereNotIn('id', [$id])->orderBy('name')->get();
            return response()->json(['status' => 'success', 'data' => $data, 'form_link' => $form_link, 'categories' => $categories]);
        }
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $request->validate([
            'name' => 'required',
            'image' => 'image',
        ]);

        $category = Category::findOrFail($id);
        $check_slug = Category::whereNotIn('id', [$id])->where('slug', Str::slug($request->name))->latest('id')->first();
        if (!is_null($check_slug)) {
            $slug = Str::slug($request->name) . '-' . uniqid();
        } else {
            $slug = Str::slug($request->name);
        }

        if ($request->has('featured')) {
            $featured = 1;
        } else {
            $featured = 0;
        }

        if ($request->has('status')) {
            $status = 1;
        } else {
            $status = 0;
        }

        if ($request->parent_id == 'NULL') {
            $parent_id = NULL;
        } else {
            $parent_id = $request->parent_id;
        }

        $image = $request->file('image');
        if (isset($image)) {
            $response = helperClass::storeImage($image, 200, 'media/category/', $category->image);
            if ($response['status'] == 'success') {
                $path_name =  $response['path_name'];
            } else {
                $path_name = $category->image;
            }
        } else {
            $path_name = $category->image;
        }

        $category->update([
            'name' => $request->name,
            'parent_id' => $parent_id,
            'slug' => $slug,
            'image' => $path_name,
            'featured' => $featured,
            'status' => $status,
        ]);

        return redirect()->back()->withSuccessMessage('Updated Successfully!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Request $request, string $id)
    {
        // Delete Multiple Items
        if ($request->id) {
            foreach ($request->id as $id) {
                $category = Category::findOrFail($id);
                if (count($category->products) == 0) {
                    if (file_exists($category->image)) {
                        unlink($category->image);
                    }
                    $category->delete();
                } else {
                    return response()->json(['status' => 'error']);
                }
            }
            return response()->json(['status' => 'success']);
        }

        // Delete Single Item
        $category = Category::findOrFail($id);
        if (count($category->products) == 0) {
            if (file_exists($category->image)) {
                unlink($category->image);
            }
            $category->delete();
        } else {
            return response()->json(['status' => 'error']);
        }
        return response()->json(['status' => 'success']);
    }
}
