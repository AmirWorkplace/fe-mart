<?php

use App\Helper\AdditionalDataResource;
use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Artisan;
use App\Http\Controllers\Frontend\FrontpageController;
use App\Models\Category;
use App\Models\Product;
use App\Models\ProductPrice;
use App\Models\User;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

Route::group(['as' => 'frontend.'], function () {
    Route::get('/', [FrontpageController::class, 'home'])->name('home');
    Route::get('/quick-view', [FrontpageController::class, 'quickView'])->name('quick-view');
    Route::get('/products/{slug?}', [FrontpageController::class, 'products'])->name('products');
    Route::get('/search', [FrontpageController::class, 'search'])->name('search');
    Route::get('/product-filter', [FrontpageController::class, 'productFilter'])->name('product-filter');
    Route::get('/flash-deal/{slug?}', [FrontpageController::class, 'flashDeal'])->name('flash-deal');
    Route::get('/flash-deal/{deal}/{slug}', [FrontpageController::class, 'singleDealProduct'])->name('single-deal-product');
    Route::get('/brand/{slug}', [FrontpageController::class, 'brandProducts'])->name('brand-products');
    Route::get('/product/{slug}', [FrontpageController::class, 'singleProduct'])->name('single-product');
    Route::post('/product/get-variant-price', [FrontpageController::class, 'getVariantPrice'])->name('product.variant-price');
    Route::get('/page/{slug}', [FrontpageController::class, 'page'])->name('page');

    Route::patch('/cart/update', [FrontpageController::class, 'updateCart'])->name('cart.update');
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


/**
 * @uses Test anything Nam
 * @routes {update products id} http://127.0.0.1:8000/experiment/product
 *
 Route::get('/experiment', function(){
    $user = User::findOrFail(1);
    $pass = 'tpbd@admin-1234';
    $password = Hash::make($pass);

    $user->password = $password;
    $user->save();

    return ["password updated"];
});
 */
// mapping to update category Id
Route::get('/experiment/product', function () {
    // return session()->get('cart');
    // return AdditionalDataResource::getCategories();
    // return Category::whereNotIn('id', ["66","18","58"])->get()->pluck('id');
    // $products = Product::get();
    // $product_ids = $products->pluck('id')->toArray();

    // $category_id = '{"main_category_id":["66","18"],"child_category_id":["59","60","61","62","63","65"],"subchild_category_id":[]}';

    // Product::whereIn('id', $product_ids)->update(['category_id'=> $category_id]);

    // return ["message"=> 'Updated Successfully!', 'data'=> Product::get()];
});

/* 
 Route::get('/experiment/product/{id}', function ($id) {
    // $products = Product::select('id', 'category_id', 'name')->latest()->get();
    // $product_ids = $products->pluck('id')->toArray();

    // $productModel = new Product();
    // $products = $productModel->getProductsByChildrenCategoryId($id);

    $pdt = new Product();
    $products = $pdt->getProductsByCategoryId($id, null, true);

    

    // $category_id = '{"main_category_id":["9","18","58"],"child_category_id":["60","61","62","63","65","66"],"subchild_category_id":["67"]}';

    // Product::whereIn('id', $product_ids)->update(['category_id'=> $category_id]);

    function createSlug(string $table_name, string $title){
        $slug = Str::slug($title);

        if(DB::table($table_name)->where('slug', $slug)->exists()){
            $split_slug = str_split($slug);
            $last_char = $split_slug[count($split_slug) - 1];

            $modified_slug = is_int(intval($last_char)) ? $slug . ($last_char + 1) : $slug . '-' . 1;

            if(DB::table($table_name)->where('slug', $modified_slug)->exists()){
                return createSlug($table_name, $title);
            }

            return $modified_slug;
        }

        return $slug;
    }

    return ["message"=> 'Updated Successfully!', 'data'=> $products];
}); */

Route::get('/users/{id}', function ($id) {
    return User::with(['reseller'])->where('id', $id)->first();
});

Route::get('/reseller-price', function(){
    $products = ProductPrice::query();
    $regular_prices = $products->select('id', 'regular_price')->get();
    $ids = $products->pluck('id')->toArray();

    foreach ($regular_prices as $key => $price) {
        ProductPrice::where('id', $price->id)->update(['vendor_price' => $price->regular_price + 100]);
    }

    return ProductPrice::all();
    

});