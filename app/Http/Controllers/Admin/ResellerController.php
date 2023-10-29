<?php

namespace App\Http\Controllers\Admin;

use App\Helper\UserManagement;
use App\helperClass;
use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Spatie\Permission\Models\Role;
use Yajra\DataTables\Facades\DataTables;

class ResellerController extends Controller
{
    // Display a listing of the resource.
    public function index()
    {
        if (request()->ajax()) {
            $model = User::with('reseller')->where('role', 2)->whereNotIn('id', [Auth::user()->id])->latest('id');
            $model->whereNotIn('user_name', ['admin']);
            return DataTables::eloquent($model)
            ->addColumn('checkbox', function($row){
                $checkbox = '<div class="custom-control custom-checkbox">
                <input type="checkbox" class="custom-control-input multi_checkbox" id="'.$row->id.'" name="multi_checkbox[]" value="'.$row->id.'"><label for="'.$row->id.'" class="custom-control-label"></label></div>';
                    return $checkbox;
            })
            ->addColumn('image', function($row){
                $image = '<img class="lazyload" data-src="';
                if(file_exists($row->image)){
                    $image .= asset($row->image);
                } else {
                    $image .= asset('backend/images/avatar/default/user.jpg');
                }
                $image .= '" height="40" alt="'.$row->name.'">';
                    return $image;
            })
            ->addColumn('name', function($row){ 
                return $row->name;
            }) 
            ->addColumn('email', function($row){
                return $row->email;
            })
            ->addColumn('role', function($row){
                $role = '';
                foreach($row->getRoleNames() as $single){
                    $role .= $single;
                };
                return $role;
            })
            ->addColumn('shop_name', function($row){ 
                return isset($row->reseller->shop_name) ? $row->reseller->shop_name : 'No Shopname';
            })
            ->addColumn('status', function ($row) {
                $status =
                    '<div class="form-check form-switch">
                        <input class="form-check-input change-status c-pointer" data-url="' . Route('admin.reseller.edit', $row->id) . '" type="checkbox" name="status"';
                if ($row->status == 1) {
                    $status .= ' checked ';
                }
                $status .= '>
                    </div>';
                return $status;
            }) 
            ->addColumn('actions', function($row){
                $actionBtn = '<div class="btn-group">';
                    if(!in_array('System Admin',json_decode($row->getRoleNames())) && UserManagement::role('System Admin') || Auth::user()->can('admin.reseller.edit') && !in_array('System Admin',json_decode($row->getRoleNames()))){
                        $actionBtn .= '<a href="'.Route('admin.reseller.edit', $row->id).'" class="btn btn-sm btn-warning border-0 px-10px fs-15 link-edit"><i class="far fa-pencil-alt"></i></a>';
                    }

                    if(!in_array('System Admin',json_decode($row->getRoleNames())) && UserManagement::role('System Admin') || Auth::user()->can('admin.reseller.password') && !in_array('System Admin',json_decode($row->getRoleNames()))){
                        $actionBtn .= '<a href="'.Route('admin.reseller.password', $row->id).'" class="btn btn-sm btn-warning border-0 px-10px fs-15 bg-success"><i class="fal fa-key"></i></a>';
                    }

                    if(!in_array('System Admin',json_decode($row->getRoleNames())) && UserManagement::role('System Admin') || Auth::user()->can('admin.user.destroy') && !in_array('System Admin',json_decode($row->getRoleNames()))){
                        $actionBtn .= '<button type="button" class="btn btn-sm btn-danger border-0 px-10px fs-15 link-delete" data-url="'.Route('admin.user.destroy', $row->id).'"><i class="far fa-trash-alt"></i></button>';
                    }
                    $actionBtn .= '</div>';
                    return $actionBtn;
            })
            ->rawColumns(['checkbox', 'image', 'name', 'role', 'email', 'shop_name', 'status', 'actions'])
            ->make(true);
        }
        return view('admin.reseller.index');
    }

    // Show the form for creating a new resource.
    public function create()
    {
        // $roles = Role::latest('id')->get();
        return view('admin.reseller.create');
    }

    // Password Changes System
    public function changePassword(string $id)
    {
        // $user = User::findOrFail($id);
        return view('admin.reseller.password', compact('id'));
    } // reseller

    public function passwordUpdate(Request $request, string $id)
    {
        $user = User::findOrFail($id);

        $request->validate([
            'old_password' => 'required',
            'password' => 'required|min:8',
            'confirm_password' => 'required|min:8',
        ]);
        
        $password = $request->password;
        $old_password = $request->old_password;
        $confirm_password = $request->confirm_password;

        if($password != $confirm_password){
            return redirect()->back()->withErrors("Your `password` & `confirm password` doesn't match!");
        }

        $new_password = "";
        if(Hash::check($old_password, $user->password)){
            $new_password = Hash::make($password);
        }

        $user->password = $new_password;
        $user->save();
        return redirect()->route('admin.reseller.index')->withSuccessMessage('Password Updated Successfully!');
    }

    // Store a newly created resource in storage.
    public function store(Request $request)
    {
        $request->validate([
            'user_name' => 'required|unique:users,user_name',
            'email' => 'required|unique:users,email',
            'phone' => 'required',
            'password' => 'required|min:8',
            'confirm_password' => 'required|min:8',
            'name' => 'required',
            'shop_name' => 'required',
            'city' => 'required',
        ]);

        if($request->password != $request->confirm_password) return redirect()->back()->withErrors('Your `password` and `confirm password` did not match!');

        $password =  Hash::make($request->password);

        $image = helperClass::saveImage($request->file('image'), 'media/reseller/');
        $cover_image = helperClass::saveImage($request->file('cover_image'), 'media/reseller/');

        $reseller = User::create([
            'role' => 2,
            'name' => $request->name,
            'email' => $request->email,
            'phone' => $request->phone,
            'user_name' => $request->user_name,
            'shop_name' => $request->shop_name,
            'password' => $password,
            'city' => $request->city,
            'address' => $request->address,
            'website_url' => $request->website_url,
            'status' => $request->status,
            'image' => $image,
            'cover_image' => $cover_image,
        ]);

        $role = Role::findByName('Reseller Admin');
        $reseller->syncRoles($role);

        return redirect()->route('admin.reseller.index')->withSuccessMessage('Reseller Account Created Successfully!');
    }

    // Display the specified resource.
    public function show(string $id)
    {
        //
    }

    // Show the form for editing the specified resource.
    public function edit(string $id)
    {
        if (request()->ajax()) {
            $data = User::findOrFail($id);
            $data->update(['status' => !$data->status]);
            return response()->json(['status' => 'success']);
        }

        $data = User::findOrFail($id);
        // return $data;

        return view('admin.reseller.edit', compact('data'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $reseller = User::findOrFail($id);

        if($request->user_name != $request->user_name) {
            $request->validate([
                'user_name' => 'required|unique:users,user_name',
            ]);    
        }

        if($request->email != $request->email) {
            $request->validate([
                'email' => 'required|unique:users,email',
            ]);    
        }
        $request->validate([
            'name' => 'required',
            'city' => 'required',
            'phone' => 'required',
            'shop_name' => 'required',
        ]);

        // if($request->password != $request->confirm_password) return redirect()->back()->withErrors('Your `password` and `confirm password` did not match!');
            // 'password' => 'required|min:8',
            // 'confirm_password' => 'required|min:8',

        // return response()->json([$request, $reseller]);

        // $reseller->update([
        //     'name' => $request->name,
        //     'email' => $request->email,
        //     'phone' => $request->phone,
        //     'user_name' => $request->user_name,
        //     'shop_name' => $request->shop_name,
        //     // 'password' => $password,
        //     'city' => $request->city,
        //     'address' => $request->address,
        //     'website_url' => $request->website_url,
        //     'image' => $image,
        //     'cover_image' => $cover_image,
        // ]);


        // $password =  Hash::make($request->password);

        $old_image = $reseller->image;
        $old_cover_image = $reseller->cover_image;

        $image = helperClass::saveImage($request->file('image'), 'media/reseller/', $old_image);
        $cover_image = helperClass::saveImage($request->file('cover_image'), 'media/reseller/', $old_cover_image);

        $reseller->name = $request->name;
        $reseller->email = $request->email;
        $reseller->phone = $request->phone;
        $reseller->user_name = $request->user_name;
        $reseller->shop_name = $request->shop_name;
        $reseller->city = $request->city;
        $reseller->address = $request->address;
        $reseller->website_url = $request->website_url;
        $reseller->image = $image;
        $reseller->cover_image = $cover_image;
        $reseller->save();
    
        return redirect()->route('admin.reseller.index')->withSuccessMessage('Reseller Account Updated Successfully!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}