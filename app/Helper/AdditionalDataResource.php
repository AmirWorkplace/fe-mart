<?php
namespace App\Helper;

use App\Models\Category;
use App\Models\Order;
use App\Models\Product;

class AdditionalDataResource {
  public function __construct() {}

  public static function getDashboardData() {
    $orders = Order::latest('updated_at')->get();

    $pending = $orders->where('status', 'Pending')->count();
    $confirmed = $orders->where('status', 'Confirmed')->count();
    $processing = $orders->where('status', 'Processing')->count();
    $delivered = $orders->where('status', 'Delivered')->count();
    $succeed = $orders->where('status', 'Successed')->count();
    $canceled = $orders->where('status', 'Canceled')->count();

    return [
      'total_order' => $orders->count(),
      'new_order' => $pending,
      'on_progress' => $processing + $confirmed,
      'delivered' => $delivered + $succeed,
      'fail' => $canceled,
    ];
  }

  public static function getCategories(){
    $categories = Category::latest('updated_at')->get();

    $parentCategories = [];
    foreach ($categories as $category) {
        if ($category['parent_id'] === null) {
            $parentCategories[] = $category;
        }
    }

    $childCategories = [];
    foreach ($parentCategories as $parentCategory) {
        $parentId = $parentCategory['id'];
        $children = [];
        foreach ($categories as $category) {
            if ($category['parent_id'] === $parentId) {
                $children[] = $category;
            }
        }
        $childCategories[$parentId] = $children;
    }

    $subchildCategories = [];
    foreach ($childCategories as $parentId => $children) {
        foreach ($children as $child) {
            $childId = $child['id'];
            $subchildren = [];
            foreach ($categories as $category) {
                if ($category['parent_id'] === $childId) {
                    $subchildren[] = $category;
                }
            }
            $subchildCategories[$childId] = $subchildren;
        }
    }

    return ['parent_categories' => $parentCategories, 'child_categories'=> $childCategories, 'children_categories'=> $subchildCategories];
  }

  public static function getParentCategories(){
    return AdditionalDataResource::getCategories()['parent_categories'];
  }
  public static function getChildCategoriesByParentId($parent_id){
    $categories = AdditionalDataResource::getCategories()['child_categories'];

    $all_categories = [];

    foreach($parent_id as $id) {
      $all_categories = array_merge($all_categories, $categories[$id]);
    }

    return $all_categories;
  }

  public static function getChildrenCategoriesByParentId($child_parent_id){
    $categories = AdditionalDataResource::getCategories()['children_categories'];
    
    $all_categories = [];

    foreach($child_parent_id as $id) {
      $all_categories = array_merge($all_categories, $categories[$id]);
    }

    return $all_categories;
  }

  public static function getParentCategoryProducts(array|string $parent_category_id, string|NULL $product_type = null){
    $products = new Product();

    return $products->getProductsByParentCategoryId($parent_category_id, $product_type);
  }

  public static function getChildCategoryProducts($child_category_id, string|NULL $product_type = null){
    $products = new Product();

    return $products->getProductsByChildCategoryId($child_category_id, $product_type);
  }

  public static function getChildrenCategoryProducts($children_category_id, string|NULL $product_type = null){
    $products = new Product();

    return $products->getProductsByChildrenCategoryId($children_category_id, $product_type);
  }

  public static function getCategoryProductsCount($category_id){
    $products_instance = new Product();
    return $products_instance->getProductsByCategoryId($category_id, null, true);
  }
}

