<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Artisan;
use App\Http\Controllers\Frontend\FrontpageController;

Route::group(['as' => 'frontend.'], function () {
    route::get('/', [FrontpageController::class, 'home'])->name('home');
    route::get('/quick-view', [FrontpageController::class, 'quickView'])->name('quick-view');
    route::get('/products/{slug?}', [FrontpageController::class, 'products'])->name('products');
    route::get('/search', [FrontpageController::class, 'search'])->name('search');
    route::get('/product-filter', [FrontpageController::class, 'productFilter'])->name('product-filter');
    route::get('/flash-deal/{slug?}', [FrontpageController::class, 'flashDeal'])->name('flash-deal');
    route::get('/flash-deal/{deal}/{slug}', [FrontpageController::class, 'singleDealProduct'])->name('single-deal-product');
    route::get('/brand/{slug}', [FrontpageController::class, 'brandProducts'])->name('brand-products');
    route::get('/product/{slug}', [FrontpageController::class, 'singleProduct'])->name('single-product');
    route::post('/product/get-variant-price', [FrontpageController::class, 'getVariantPrice'])->name('product.variant-price');
    route::get('/page/{slug}', [FrontpageController::class, 'page'])->name('page');
});

// ------------ utility start ----------
Route::get('/clear', function () {
    Artisan::call('cache:clear');
    Artisan::call('config:clear');
    Artisan::call('config:cache');
    Artisan::call('view:clear');
    Artisan::call('route:clear');
    Artisan::call('clear-compiled');
    return redirect()->back()->withSuccessMessage('Cleared Successfully!');
});

Route::get('/storage-link', function () {
    Artisan::call('storage:link');
    return redirect()->back()->withSuccessMessage('Linked Successfully!');
});

Route::get('/toggle-debug', function () {
    $path = base_path('.env');
    $test = file_get_contents($path);

    $prev_status = $_ENV['APP_DEBUG'];
    if ($prev_status == 'true' && file_exists($path)) {
        file_put_contents($path, str_replace('APP_DEBUG=true', 'APP_DEBUG=false', $test));
    }
    if ($prev_status == 'false' && file_exists($path)) {
        file_put_contents($path, str_replace('APP_DEBUG=false', 'APP_DEBUG=true', $test));
    }
    Artisan::call('config:clear');
    return redirect()->back()->withSuccessMessage('changed successfully!');
});