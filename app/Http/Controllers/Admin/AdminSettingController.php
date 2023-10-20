<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\AdminSetting;
use Illuminate\Http\Request;
use Carbon\Carbon;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\File;
use Intervention\Image\Facades\Image;

class AdminSettingController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $settings = AdminSetting::latest('id')->first();
        return view('admin.admin_setting.edit', compact('settings'));
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
        $request->validate([
            'logo' => 'image',
            'favicon' => 'image',
            'title' => 'required',
            'footer_text' => 'required',
        ]);

        $settings = AdminSetting::latest('id')->first();
        if (is_null($settings)) {
            $settings = new AdminSetting();
        }

        $path = public_path('media/admin-setting/');
        if (!File::isDirectory($path)) {
            File::makeDirectory($path, 0777, true, true);
        }
        $logo = $request->file('logo');
        if (isset($logo)) {
            $ext = 'webp';
            $path = 'media/admin-setting/';
            $file_name = Carbon::now()->toDateString() . '-' . Str::random(40) . '.' . $ext;
            $path_file_name = $path . $file_name;

            $file = Image::make($logo);
            $file->resize(300, null, function ($constraint) {
                $constraint->aspectRatio();
                $constraint->upsize();
            })->stream($ext, 100);
            $file->save($path_file_name);
            if ($settings->logo) {
                if (file_exists($settings->logo)) {
                    unlink($settings->logo);
                }
            }
            $settings->logo = $path_file_name;
        }
        $favicon = $request->file('favicon');
        if (isset($favicon)) {
            $ext = 'webp';
            $path = 'media/admin-setting/';
            $file_name = Carbon::now()->toDateString() . '-' . Str::random(40) . '.' . $ext;
            $path_file_name = $path . $file_name;

            $file = Image::make($favicon);
            $file->resize(150, null, function ($constraint) {
                $constraint->aspectRatio();
                $constraint->upsize();
            })->stream($ext, 100);
            $file->save($path_file_name);
            if ($settings->favicon) {
                if (file_exists($settings->favicon)) {
                    unlink($settings->favicon);
                }
            }
            $settings->favicon = $path_file_name;
        }
        $settings->title = $request->title;
        $settings->footer_text = $request->footer_text;
        $settings->primary_color = $request->primary_color;
        $settings->secondary_color = $request->secondary_color;
        $settings->facebook = $request->facebook;
        $settings->twitter = $request->twitter;
        $settings->linkedin = $request->linkedin;
        $settings->whatsapp = $request->whatsapp;
        $settings->google = $request->google;
        $settings->save();

        return redirect()->back()->withSuccessMessage('Updated Successfully!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
