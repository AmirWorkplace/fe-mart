<?php

use App\Http\Controllers\Reseller\AuthController;
use App\Http\Controllers\Reseller\CustomerEntryController;
use App\Http\Controllers\Reseller\OrderPlaceController;
use App\Http\Controllers\Reseller\ResellerCommissionController;
use App\Http\Controllers\Reseller\ResellerStatementController;
use App\Http\Controllers\Reseller\WithdrawController;
use Illuminate\Support\Facades\Route;

Route::group(['as'=> 'reseller.', 'prefix'=> 'reseller', 'middleware'=> []], function(){
    Route::match(['POST', 'GET'], '/register', [AuthController::class, 'register'])->name('register');
    Route::match(['POST', 'GET'], '/login', [AuthController::class, 'login'])->name('login');
});

Route::group(['as'=> 'admin.', 'prefix'=> 'reseller', 'middleware'=> ['admin_permission']], function(){
  // customer entry from reseller dashboard
  Route::resource('/customer-entry', CustomerEntryController::class);

  // reseller commission
  Route::resource('reseller-commission', ResellerCommissionController::class);

  // reseller or admin or others authenticate user will access
  Route::resource('/order-place', OrderPlaceController::class);
  Route::get('/{user_name}/cart', [OrderPlaceController::class, 'resellerCart'])->name('reseller.cart');
  Route::get('/{user_name}/checkout', [OrderPlaceController::class, 'resellerCheckout'])->name('reseller.checkout');
  Route::post('/{user_name}/order-place', [OrderPlaceController::class, 'resellerOrderPlace'])->name('reseller.order-place');

  // Reseller Withdraw Request
  Route::resource('/withdraw', WithdrawController::class);
  Route::post('/withdraw/show-payment-method', [WithdrawController::class, 'showPaymentMethod'])->name('reseller.show_payment_method');

  // Reseller Statement management
  Route::resource('/statement', ResellerStatementController::class);
  Route::get('/reseller-orders-cashback', [ResellerStatementController::class, 'initiateResellerOrdersCashback'])->name('reseller_orders_cashback');
  Route::get('/reseller-sales-target-cashback', [ResellerStatementController::class, 'initiateResellerSalesTargetCashback'])->name('reseller_sales_target_cashback');
});




// require __DIR__ . 'auth.php';
