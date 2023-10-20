<?php

namespace App\Http\Controllers\Admin;

use App\helperClass;
use App\Models\Slider;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Yajra\DataTables\Facades\DataTables;

class SliderController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        if (request()->ajax()) {
            $model = Slider::latest('id');
            return DataTables::eloquent($model)
                ->addColumn('checkbox', function ($row) {
                    $checkbox = '<div class="custom-control custom-checkbox">
                    <input type="checkbox" class="custom-control-input multi_checkbox" id="' . $row->id . '" name="multi_checkbox[]" value="' . $row->id . '"><label for="' . $row->id . '" class="custom-control-label"></label></div>';
                    return $checkbox;
                })
                ->addColumn('image', function ($row) {
                    return '<img src="' . asset($row->image) . '" height="50" alt="' . $row->name . '">';
                })
                ->addColumn('status', function ($row) {
                    $status =
                        '<div class="form-check form-switch">
                        <input class="form-check-input change-status c-pointer" data-url="' . Route('admin.slider.edit', $row->id) . '" type="checkbox" name="status"';
                    if ($row->status == 1) {
                        $status .= ' checked ';
                    }
                    $status .= '>
                    </div>';
                    return $status;
                })
                ->addColumn('actions', function ($row) {
                    $actionBtn = '<div class="btn-group">
                        <button type="button" class="btn btn-sm btn-warning border-0 px-10px fs-15 link-edit" data-url="' . Route('admin.slider.edit', $row->id) . '"><i class="far fa-pencil-alt"></i></button>
                        <button type="button" class="btn btn-sm btn-danger border-0 px-10px fs-15 link-delete" data-url="' . Route('admin.slider.destroy', $row->id) . '"><i class="far fa-trash-alt"></i></button></div>';
                    return $actionBtn;
                })
                ->rawColumns(['checkbox', 'image', 'status', 'actions'])
                ->make(true);
        }
        return view('admin.slider.index');
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
            'image' => 'required|image',
            'status' => 'required',
        ]);

        $image = $request->file('image');
        if (isset($image)) {
            $response = helperClass::storeImage($image, 1000, 'media/slider/');
            if ($response['status'] == 'success') {
                $path_name =  $response['path_name'];
            } else {
                $path_name = NULL;
            }
        } else {
            $path_name = NULL;
        }

        Slider::create([
            'link' => $request->link,
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
            $data = Slider::findOrFail($id);
            $data->update(['status' => !$data->status]);
            return response()->json(['status' => 'success']);
        }

        if (request()->ajax()) {
            $data = Slider::findOrFail($id);
            $form_link = route('admin.slider.update', $id);
            return response()->json(['status' => 'success', 'data' => $data, 'form_link' => $form_link]);
        }
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $request->validate([
            'image' => 'image',
            'status' => 'required',
        ]);

        $slide = Slider::findOrFail($id);
        $image = $request->file('image');
        if (isset($image)) {
            $response = helperClass::storeImage($image, 1000, 'media/slider/', $slide->image);
            if ($response['status'] == 'success') {
                $path_name =  $response['path_name'];
            } else {
                $path_name = $slide->image;
            }
        } else {
            $path_name = $slide->image;
        }

        $slide->update([
            'link' => $request->link,
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
                $slide = Slider::findOrFail($id);
                if (file_exists($slide->image)) {
                    unlink($slide->image);
                }
                $slide->delete();
            }
            return response()->json(['status' => 'success']);
        }
        $slide = Slider::findOrFail($id);
        if (file_exists($slide->image)) {
            unlink($slide->image);
        }
        $slide->delete();
        return response()->json(['status' => 'success']);
    }
}
