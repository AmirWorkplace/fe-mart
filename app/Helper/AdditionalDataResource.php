<?php
namespace App\Helper;

use App\Models\Category;
use App\Models\CustomerEntry;
use App\Models\Order;
use App\Models\Product;
use App\Models\ProductResalePrice;
use App\Models\User;
use App\Models\Withdraw;
use Illuminate\Support\Facades\Auth;

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
        if ($category['parent_id'] == null) {
            $parentCategories[] = $category;
        }
    }

    $childCategories = [];
    foreach ($parentCategories as $parentCategory) {
        $parentId = $parentCategory['id'];
        $children = [];
        foreach ($categories as $category) {
            if ($category['parent_id'] == $parentId) {
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
                if ($category['parent_id'] == $childId) {
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
      if(isset($categories[$id])){
        $all_categories = array_merge($all_categories, $categories[$id]);
      }
    }

    return $all_categories;
  }

  public static function getChildrenCategoriesByParentId($child_parent_id){
    $categories = AdditionalDataResource::getCategories()['children_categories'];
    
    $all_categories = [];

    foreach($child_parent_id as $id) {
      if(isset($categories[$id])){
        $all_categories = array_merge($all_categories, $categories[$id]);
      }
    }

    return $all_categories;
  }

  public static function getParentCategoryProducts(array|string $parent_category_id, string|NULL $product_type = null, array|NULL $select = null){
    $products = new Product();

    return $products->getProductsByParentCategoryId($parent_category_id, $product_type, $select);
  }

  public static function getChildCategoryProducts($child_category_id, string|NULL $product_type = null, array|NULL $select = null){
    $products = new Product();

    return $products->getProductsByChildCategoryId($child_category_id, $product_type, $select);
  }

  public static function getChildrenCategoryProducts($children_category_id, string|NULL $product_type = null){
    $products = new Product();

    return $products->getProductsByChildrenCategoryId($children_category_id, $product_type);
  }

  public static function getCategoryProductsCount($category_id){
    $products_instance = new Product();
    return $products_instance->getProductsByCategoryId($category_id, null, true);
  }

  public static function getProductsBySpecialOffer(string $offer_id, int|NULL $showcase = null){
    $ids = json_decode($offer_id, true);

    if($showcase){
      return Product::whereIn('id', $ids)->where('status', true)->latest('updated_at')->paginate($showcase);
    }else{
      return Product::whereIn('id', $ids)->where('status', true)->limit(40)->get();
    }
  }

  /**
     * @uses CustomerEntry::Model to get the authenticate reseller's customer for selecting to order placement.
     * @return array of customer lists.
     */
    public static function getCustomerOfReseller(){
      if(Auth::user()->role == 1){
          return CustomerEntry::latest('id')->get();
      }else{
          return CustomerEntry::where('reseller_id', Auth::id())->latest('id')->get();
      }
  }

  /**
   * @uses Product::Model to get all the the product for selecting all product to order.
   * @return array of product lists.
   */
  public static function getProductLists(){
      return Product::with(['price'])
      ->select('id', 'code', 'name', 'thumbnail', 'max_order', 'min_order', 'category_id')
      ->where('status', true)
      ->latest('id')
      ->limit(20)
      ->get();
  }

  /**
   * @uses findReseller by user id.
   */

  public static function getReseller(){
    return User::with('reseller')->findOrFail(Auth::id()); 
  }

  /**
   * @uses AdditionalDataResources::getResellerEarning to find out the total sale, resale, buy, earning inquiry for the logged in reseller. 
   */
  public static function getResellerEarning(){
    $total_data = array(
        'invoice_value' => array(),
        'reseller_value' => array(),
        'reseller_earning' => array(),
    );

    $withdraws = Withdraw::select('id', 'withdraw_amount')->where('user_id', Auth::id())->where('status', 'Succeed')->get();
    $previous_withdrawal = array_sum($withdraws->pluck('withdraw_amount')->toArray());

    $reseller_added_shipping_charge = array();
    $shipping_charge = array();

    $orders = Order::select('id', 'shipping_charge', 'total')->where('user_id', Auth::id())->where('status', 'Delivered')->latest('id')->get();

    foreach ($orders as $order) {  
        $shipping_charge[] = intval($order->shipping_charge);         
        $reseller_added_shipping_charge[] = intval($order->total);         
        $prices = array();
        $products = ProductResalePrice::select('id', 'main_rate', 'resale_prices', 'quantities')->where('order_id', $order->id)->get();
        $resale_prices = $products->pluck('resale_prices')->toArray();

        foreach ($products as $product) {
            $prices[] = intval($product->main_rate) * intval($product->quantities);
        }

        $sum_prices = array_sum($prices);
        $sum_resale_prices = array_sum($resale_prices);
        $earning = $sum_resale_prices - $sum_prices;

        $total_data['invoice_value'][] = $sum_prices;
        $total_data['reseller_value'][] = $sum_resale_prices;
        $total_data['reseller_earning'][] = $earning;
    }

    $reseller_value = array_sum($total_data['reseller_value']) + array_sum($shipping_charge);
    $invoice_value = array_sum($total_data['invoice_value']) + array_sum($shipping_charge) + array_sum($reseller_added_shipping_charge);
    $earning_amount = $reseller_value - $invoice_value;

    return array(
        'target_value' => $invoice_value,
        'resale_value' => $reseller_value,
        'reseller_earning' => $earning_amount,
        'previous_withdrawal' => $previous_withdrawal,
        'reserve_amount' => $earning_amount - $previous_withdrawal,
    );
  }
}

