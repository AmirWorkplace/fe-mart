<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\UserController;
use App\Http\Controllers\Admin\RoleController;
use App\Http\Controllers\Admin\AdminController;
use App\Http\Controllers\Admin\AdminMenuActionController;
use App\Http\Controllers\Admin\AdminMenuController;
use App\Http\Controllers\Admin\AdminSettingController;
use App\Http\Controllers\Admin\AttributeController;
use App\Http\Controllers\Admin\AttributeValueController;
use App\Http\Controllers\Admin\BrandController;
use App\Http\Controllers\Admin\CategoryController;
use App\Http\Controllers\Admin\CustomerController;
use App\Http\Controllers\Admin\FlashdealController;
use App\Http\Controllers\Admin\HomeProductSectionController;
use App\Http\Controllers\Admin\LocationController;
use App\Http\Controllers\Admin\MenuController;
use App\Http\Controllers\Admin\MenuItemController;
use App\Http\Controllers\Admin\OrderController;
use App\Http\Controllers\Admin\PageController;
use App\Http\Controllers\Admin\ProductController;
use App\Http\Controllers\Admin\SettingController;
use App\Http\Controllers\Admin\SliderController;

Route::group(['as' => 'admin.', 'prefix' => 'admin'], function () {
    Route::get('/', [AdminController::class, 'index'])->name('login.index');
    Route::post('/login', [AdminController::class, 'login'])->name('login');
});

Route::group(['as' => 'admin.', 'prefix' => 'admin', 'middleware' => ['admin_permission']], function () {
    Route::get('/dashboard', [AdminController::class, 'dashboard'])->name('dashboard');
    Route::post('/sidebar', [AdminController::class, 'sidebar'])->name('sidebar');
    Route::get('/profile', [AdminController::class, 'edit'])->name('profile.index');
    Route::put('/change-images', [AdminController::class, 'changeImages'])->name('change-images');
    Route::put('/change-password', [AdminController::class, 'changePassword'])->name('change-password');
    Route::put('/profile', [AdminController::class, 'update'])->name('profile.update');
    Route::get('/logout', [AdminController::class, 'logout'])->name('logout');

    // User Management
    Route::resource('/user', UserController::class);
    Route::get('/user/{id}/password', [UserController::class, 'changePassword'])->name('user.password');
    Route::put('/user/password/{id}', [UserController::class, 'passwordUpdate'])->name('user.password-update');

    // Role Management
    Route::resource('/role', RoleController::class);

    // Permission Management
    Route::get('/permission/{id}', [RoleController::class, 'rolePermissionEdit'])->name('rolePermission.edit');
    Route::put('/permission/permissions-update/{id}', [RoleController::class, 'rolePermissionUpdate'])->name('rolePermission.update');

    // Admin Menu Management
    Route::resource('/admin-menu', AdminMenuController::class);

    // Admin Menu Actions Management
    Route::get('/admin-menu-actions/{id}', [AdminMenuActionController::class, 'index'])->name('admin-menuAction.index');
    Route::get('/admin-menu-actions/{id}/create', [AdminMenuActionController::class, 'create'])->name('admin-menuAction.create');
    Route::post('/admin-menu-actions/{id}/store', [AdminMenuActionController::class, 'store'])->name('admin-menuAction.store');
    Route::get('/admin-menu-actions/{id}/edit', [AdminMenuActionController::class, 'edit'])->name('admin-menuAction.edit');
    Route::put('/admin-menu-actions/{id}', [AdminMenuActionController::class, 'update'])->name('admin-menuAction.update');
    Route::delete('/admin-menu-actions/{id}', [AdminMenuActionController::class, 'destroy'])->name('admin-menuAction.destroy');
    Route::get('/admin-menu-actions-status/{id}', [AdminMenuActionController::class, 'status'])->name('admin-menuAction.status');

    // Admin Settings Management
    Route::resource('/admin-settings', AdminSettingController::class);

    // Settings Management
    Route::resource('/settings', SettingController::class);

    // Page Management
    Route::resource('/page', PageController::class);

    // Frontend Menu Management
    Route::resource('/menu', MenuController::class);

    // Menu Item Management
    Route::get('/menu-item/{id}', [MenuItemController::class, 'index'])->name('menu-item.index');
    Route::put('/menu-item/{id}', [MenuItemController::class, 'update'])->name('menu-item.update');
    Route::get('/menu-item-status/{id}', [MenuItemController::class, 'edit'])->name('menu-item.status');
    Route::get('/menu-serialize/{id}', [MenuItemController::class, 'show'])->name('menu-item.serialize');
    Route::delete('/menu-item/{id}', [MenuItemController::class, 'destroy'])->name('menu-item.destroy');

    // Category Management
    Route::resource('/category', CategoryController::class);

    // Brand Management
    Route::resource('/brand', BrandController::class);

    // Attribute Management
    Route::resource('/attribute', AttributeController::class);

    // Attribute Value Management
    Route::get('/attribute-values/{id}', [AttributeValueController::class, 'index'])->name('attribute-value.index');
    Route::post('/attribute-values/{id}', [AttributeValueController::class, 'store'])->name('attribute-value.store');
    Route::get('/attribute-values/{id}/edit', [AttributeValueController::class, 'edit'])->name('attribute-value.edit');
    Route::put('/attribute-values/{id}/update', [AttributeValueController::class, 'update'])->name('attribute-value.update');
    Route::delete('/attribute-values/{id}/delete', [AttributeValueController::class, 'destroy'])->name('attribute-value.destroy');

    // Product Management
    Route::resource('/product', ProductController::class);
    Route::get('product/deleted', [ProductController::class, 'deletedProducts'])->name('product.trashed');
    Route::get('product/recovery/{id}', [ProductController::class, 'productRecovery'])->name('product.recovery');
    Route::post('/product/sku-combination', [ProductController::class, 'sku_combination'])->name('product.sku_combination');
    Route::get('/product/sku-combination/{id}', [ProductController::class, 'sku_combination_edit'])->name('product.sku_combination_edit');
    Route::post('/product/add-more-choice-option', [ProductController::class, 'add_more_choice_option'])->name('product.add-more-choice-option');

    // Product Management
    Route::resource('/slider', SliderController::class);

    // Home Product Section Management
    Route::resource('/home-product-section', HomeProductSectionController::class);

    // Location Management
    Route::resource('/location', LocationController::class);

    // Customers Management
    Route::resource('/customers', CustomerController::class);

    // Order Management
    Route::resource('/order', OrderController::class);

    // Flash Deal Management
    Route::resource('/deal', FlashdealController::class);
});
