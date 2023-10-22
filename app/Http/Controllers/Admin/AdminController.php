<?php

namespace App\Http\Controllers\Admin;

use App\Models\User;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Reseller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;

class AdminController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        if (Auth::check()) {
            if (Auth::user()->role == 1) {
                return redirect()->route('admin.dashboard');
            } elseif (Auth::user()->role == 0){
                return redirect()->route('customer.profile');
            } elseif (Auth::user()->role == 2){
                return redirect()->route('admin.dashboard');
            }
        } else {
            if (!session()->has('intended_url')) {
                session(['intended_url' => url()->previous()]);
            }
            return view('admin.auth.login');
        }
    }

    public function login(Request $request)
    {

        // return $input = $request->all();

        // if (auth()->attempt(array('user_name' => $input['user_name'], 'password' => $input['password']))) {
        //     return redirect()->route('admin.dashboard')->with('success', 'Logged in Successfully!');
        // } else {
        //     return redirect()->back()->with('error', 'Invalid Email or Password!');
        // }

        $request->validate([
            'user_name' => 'required',
            'password' => 'required',
        ]);

        $login_id = $request->user_name;
        $password = $request->password;

        if(filter_var($login_id, FILTER_VALIDATE_EMAIL)) {
            $user = User::with('reseller')->where('email', $login_id)->first();
            if($user){
                if(Hash::check($password, $user->password)) {
                    if($user->status){
                        Auth::login($user);

                        return redirect()->route('admin.dashboard')->withSuccessMessage('Login Successfully!');
                    } else {
                        return redirect()->back()->withSuccessMessage('Your Account Approval is pending. Please wait a little bit!');
                    }
                } else {
                    return redirect()->back()->withErrors("Your Password doesn't match with your credentials!");
                }
            } else {
                return redirect()->back()->withErrors("There has no account exists on `{$login_id}` that's email!");
            }
        } else {
           $user = User::with('reseller')->where('user_name', $login_id)->first();

            if($user){
                if(Hash::check($password, $user->password)) {
                    if($user->status){
                        Auth::login($user);

                        return redirect()->route('admin.dashboard')->withSuccessMessage('Login Successfully!');
                    } else {
                        return redirect()->back()->withSuccessMessage('Your Account Approval is pending. Please wait a little bit!');
                    }
                } else {
                    return redirect()->back()->withErrors("Your Password doesn't match with your credentials!");
                }
            } else {
                return redirect()->back()->withErrors("There has no account exists on `{$login_id}` that's username!");
            }
        }
    }

    public function dashboard()
    {
        return view('admin.profile.dashbaord');
    }

    /**
     * Manage Sidebar
     */
    public function sidebar()
    {
        if (!Session::has('sidebar-collapse')) {
            Session()->put('sidebar-collapse', 'active');
        } else {
            Session::forget('sidebar-collapse');
        }
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
    public function edit()
    {
        $profile = User::with('reseller')->findOrFail(Auth::id());
        return view('admin.profile.index', compact('profile'));
    }

    public function changeImages(Request $request)
    {
        $images = User::findOrFail(Auth::user()->id);
        $cover = $request->file('cover_image');
        if (isset($cover)) {
            $path = 'backend/images/avatar/';
            $file_name = 'cover-' . Str::random(40) . '.' . $cover->getClientOriginalExtension();
            $path_file_name = $path . $file_name;
            $cover->move($path, $file_name);
            if (file_exists($images->cover_image)) {
                unlink($images->cover_image);
            }
            $images->cover_image = $path_file_name;
        }

        $profile = $request->file('profile_image');
        if (isset($profile)) {
            $path = 'backend/images/avatar/';
            $file_name = 'profile-' . Str::random(40) . '.' . $profile->getClientOriginalExtension();
            $path_file_name = $path . $file_name;
            $profile->move($path, $file_name);
            if (file_exists($images->image)) {
                unlink($images->image);
            }
            $images->image = $path_file_name;
        }
        $images->save();
        return redirect()->back()->withSuccessMessage('Image Changed Successfully!');
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request)
    {
        $request->validate([
            'email' => 'unique:users,email,' . Auth::user()->id,
            'name' => 'required',
        ]);
        $admin = User::with('reseller')->findOrFail(Auth::id());
        
        $reseller = isset($admin->reseller->id) ? Reseller::findOrFail($admin->reseller->id) : null;

        $admin->name = $request->name;
        $admin->email = $request->email;
        $admin->phone = $request->phone;
        $admin->address = $request->address;
        $admin->save();

        if($reseller){
            $reseller->shop_name = $request->shop_name;
            $reseller->mobile_bank_type = $request->mobile_bank_type;
            $reseller->mobile_bank_number = $request->mobile_bank_number;
            $reseller->bank_name = $request->bank_name;
            $reseller->bank_account = $request->bank_account;
            $reseller->shop_utility = $request->shop_utility;
            $reseller->website_url = $request->website_url;

            $reseller->save();
        }

        return redirect()->back()->withSuccessMessage('Information Updated Successfully!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }

    public function changePassword(Request $request)
    {
        $request->validate([
            'old_password' => 'required',
            'new_password' => 'required|string|min:8|confirmed',
        ]);

        $admin = User::findOrFail(Auth::user()->id);
        if (Hash::check($request->old_password, $admin->password)) {
            $admin->password = bcrypt($request->new_password);
            $admin->save();
            return redirect()->back()->withSuccessMessage('Updated Successfully!');
        } else {
            return redirect()->back()->withErrors('Old Password Does not Matched!');
        }
    }

    public function logout()
    {
        Auth::logout();
        return redirect()->route('admin.login.index');
    }
}
