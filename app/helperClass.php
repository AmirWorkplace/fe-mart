<?php

namespace App;

use Carbon\Carbon;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\File;
use Intervention\Image\Facades\Image;

class helperClass
{
    public static function storeImage($file, $size, $path, $oldImage = NULL)
    {
        $create_path = public_path($path);
        if (!File::isDirectory($create_path)) {
            File::makeDirectory($create_path, 0777, true, true);
        }
        $ext = 'webp';
        $file_name = Carbon::now()->toDateString() . '-' . Str::random(40) . '.' . $ext;
        $path_file_name = $path . $file_name;
        $file = Image::make($file);
        $file->resize($size, null, function ($constraint) {
            $constraint->aspectRatio();
            $constraint->upsize();
        })->stream($ext, 100);
        $file->save($path_file_name);
        if(file_exists($oldImage)){
            unlink($oldImage);
        }
        return ['status' => 'success', 'path_name' => $path_file_name];
    }
}
