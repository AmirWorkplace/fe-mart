<?php 
/* 
    <!-- < ?php

    namespace App\Http\Middleware;

    use Closure;
    use Illuminate\Http\Request;
    use Illuminate\Support\Facades\Auth;
    use Symfony\Component\HttpFoundation\Response;

    class Admin
    {
        /**
         * Handle an incoming request.
         *
         * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
         * /
        public function handle(Request $request, Closure $next): Response
        {
            if(Auth::check() && Auth::user()->role == 1){
                return $next($request);
            } else {
                return redirect()->route('admin.login.index');
            }
        }
    } -->
    */

 
namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Symfony\Component\HttpFoundation\Response;

class Admin
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        $user = Auth::user();

        $status = $user->status ? $user->status : redirect()->back()->withSuccessMessage("Please wait for your account approval. Or contact with us!");

        if(Auth::check()){
            if($user->role == 1){
                return $next($request);
            }else if($user->role == 2 && $status == true){
                return $next($request);
            }else{
                Auth::logout();
                return redirect()->route('frontend.home')->withErrors('Your not allowed for this route!');
            }
        }else{
            return redirect()->route('admin.login.index')->withErrors('Please Login At First!');
        }
    }
}
