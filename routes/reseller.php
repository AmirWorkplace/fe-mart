<?php

use App\Http\Controllers\Reseller\AuthController;
use App\Http\Controllers\Reseller\CustomerEntryController;
use App\Http\Controllers\Reseller\OrderPlaceController;
use Illuminate\Support\Facades\Route;

Route::group(['as'=> 'reseller.', 'prefix'=> 'reseller', 'middleware'=> []], function(){
    Route::match(['POST', 'GET'], '/register', [AuthController::class, 'register'])->name('register');
    Route::match(['POST', 'GET'], '/login', [AuthController::class, 'login'])->name('login');
});

Route::group(['as'=> 'admin.', 'prefix'=> 'reseller', 'middleware'=> ['admin_permission']], function(){
  // customer entry from reseller dashboard
  Route::resource('/customer-entry', CustomerEntryController::class);

  // reseller or admin or others authenticate user will access
  Route::resource('/order-place', OrderPlaceController::class);
  Route::get('/{user_name}/cart', [OrderPlaceController::class, 'resellerCart'])->name('reseller.cart');
  Route::get('/{user_name}/checkout', [OrderPlaceController::class, 'resellerCheckout'])->name('reseller.checkout');
  Route::post('/{user_name}/order-place', [OrderPlaceController::class, 'resellerOrderPlace'])->name('reseller.order-place');
});




// require __DIR__ . 'auth.php';
