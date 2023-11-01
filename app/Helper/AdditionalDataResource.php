<?php
namespace App\Helper;

use App\Models\Category;
use App\Models\CustomerEntry;
use App\Models\Order;
use App\Models\Product;
use App\Models\ProductResalePrice;
use App\Models\Reseller;
use App\Models\ResellerProductDiscount;
use App\Models\ResellerStatement;
use App\Models\User;
use App\Models\Withdraw;
use Carbon\Carbon;
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
    $array_cashback = array();

    $orders = Order::select('id', 'shipping_charge', 'total', 'pending_at')->where('user_id', Auth::id())->where('status', 'Delivered')->latest('id')->get();

    foreach ($orders as $order) {  
        $prices = array();
        $shipping_charge[] = intval($order->shipping_charge);         
        $reseller_added_shipping_charge[] = intval($order->total);         
        $products = ProductResalePrice::select('id', 'product_id', 'main_rate', 'resale_prices', 'quantities')->where('order_id', $order->id)->get();
        $resale_prices = $products->pluck('resale_prices')->toArray();

        $total_cashback = 0;
        foreach ($products as $product) {
            $prices[] = intval($product->main_rate) * intval($product->quantities); 

            $available_discount = ResellerProductDiscount::where('product_id', $product->product_id)
                ->where('status', true)
                ->where('start_time', '<=', date('Y-m-d', strtotime($order->pending_at)))
                ->where('end_time', '>=', date('Y-m-d', strtotime($order->pending_at)))
                ->first();

            if($available_discount){
                $discount = $product->quantities * $available_discount->discount;
                $total_cashback += $discount;
            }
        }

        $array_cashback[] = $total_cashback;
        $sum_prices = array_sum($prices);
        $sum_resale_prices = array_sum($resale_prices);
        $earning = $sum_resale_prices - $sum_prices;

        $total_data['invoice_value'][] = $sum_prices;
        $total_data['reseller_value'][] = $sum_resale_prices;
        $total_data['reseller_earning'][] = $earning;
    }

    $reseller_value = array_sum($total_data['reseller_value']) + array_sum($shipping_charge);
    $invoice_value = array_sum($total_data['invoice_value']) + array_sum($shipping_charge) + array_sum($reseller_added_shipping_charge);
    $earning_value = $reseller_value - $invoice_value;
    $cashback = array_sum($array_cashback);
    $reserve_amount = ($earning_value - $previous_withdrawal) + $cashback;

    /* return array(
        'cashback' => $cashback,
        'target_value' => $invoice_value,
        'resale_value' => $reseller_value,
        'reseller_earning' => $earning_value,
        'previous_withdrawal' => $previous_withdrawal,
        'earning_amount' => $earning_value - $previous_withdrawal,
        'reserve_amount' => $reserve_amount,
    ); */

    
    $get_last_statement = ResellerStatement::where('user_id', Auth::id())->latest('id')->first();
    $last_statement_balance = $get_last_statement->balance ?? 0;

    return array(
      'cashback' => $cashback,
      'target_value' => $invoice_value,
      'resale_value' => $reseller_value,
      'reseller_earning' => $earning_value,
      'previous_withdrawal' => $previous_withdrawal,
      'earning_amount' => $earning_value - $previous_withdrawal,
      'reserve_amount' => $last_statement_balance,
    );
  }

  public static function getBalance(string|int $order_id, string|int $withdraw_id, string $date){}

    public static function initiateResellerStatement(string $id, string|NULL $status = null, string|NULL $type = null){
        $user = Auth::user();

        if($type == 'withdraw' && ($status == 'Successed'|| $status == 'Succeed')){
            $withdraw = Withdraw::findOrFail($id);

            if(!$withdraw->is_withdraw){
                $get_last_statement = ResellerStatement::where('user_id', $user->id)->latest('id')->first();
                $last_statement_balance = $get_last_statement->balance ?? 0;

                $ts_id = $withdraw->transaction_id ? ' of transaction ID are ' . $withdraw->transaction_id : '';
                $description = "Withdraw from " . ucwords($withdraw->withdrawal_method) . " at {$withdraw->account_number}{$ts_id}.";

                $balance = $last_statement_balance - $withdraw->withdraw_amount;

                ResellerStatement::create([
                    'user_id'=> $user->id,
                    'order_id'=> null,
                    'withdraw_id'=> $withdraw->id,
                    'description'=> $description,
                    'withdraw'=> $withdraw->withdraw_amount,
                    'deposit'=> 0,
                    'balance'=> $balance,
                    'status'=> true,
                ]);

                $withdraw->is_withdraw = true;
                $withdraw->save();
                return response()->json(['status'=> true, 'message'=> 'Withdraw statement added successfully!']);
            }
            return response()->json(['status'=> false, 'message'=> 'Withdraw statement has been already added!']);
        }

        // find the order
        $order = Order::with('reseller_orders')->findOrFail($id);

        if(!$order->is_earning){
            if($status == 'Delivered' || $status == 'delivered' || $status == 'Successed' || $status == 'Succeed'){
                $reseller = Reseller::where('user_id', $user->id)->first();
                $account_number = ' and Account number is ' . $reseller[$order->payment_method] ?? '';
                
                $order_type = $type == "adjustment" ? 'Adjustment Order.' : '';
                
                $sales_type = strtoupper($order->sales_type);
                $payment_method = strtoupper($order->payment_method);
                
                $description = "Sell into yourself ({$user->name}), invoice ID is {$order->order_code}. Paid by ";

                if($order->user_id != $order->customer_id){
                    $customer = CustomerEntry::findOrFail($order->customer_id);

                    $description = "Sell into {$customer->name}, Mobile ({$customer->phone}). Invoice ID is {$order->order_code}. Paid by ";
                }

                if(empty($order_type)){
                    $description .= "{$payment_method} of {$sales_type} {$account_number}.";
                } else {
                    $description .= $order_type;
                }

                $set_original_prices = 0;
                $set_resale_prices = 0;

                foreach($order->reseller_orders as $resale_product){
                    $set_original_prices += ($resale_product->main_rate * $resale_product->quantities);
                    $set_resale_prices += ($resale_product->resale_rate * $resale_product->quantities);
                }

                $original_prices = $set_original_prices + $order->shipping_charge + $order->total;
                $resale_prices = $set_resale_prices + $order->shipping_charge;

                info(json_encode([
                    'original_prices' => $original_prices,
                    'resale_prices' => $resale_prices,
                    'osp'=> $order->shipping_charge,
                    'ot'=> $order->total,
                ]));

                $get_last_statement = ResellerStatement::where('user_id', $user->id)->latest('id')->first();
                $last_statement_balance = $get_last_statement->balance ?? 0;

                $deposit = $resale_prices - $original_prices;
                $withdraw = $type == 'adjustment' ? $resale_prices : 0;
                $balance = ($last_statement_balance + $deposit) - $withdraw;

                ResellerStatement::create([
                    'user_id'=> $user->id,
                    'order_id'=> $order->id,
                    'withdraw_id'=> NULL,
                    'description'=> $description,
                    'withdraw'=> $withdraw,
                    'deposit'=> $deposit,
                    'balance'=> $balance,
                    'status'=> true,
                ]);

                $status_time = ['delivered_at'=> Carbon::now()];
                if($status == 'Successed' || $status == 'Succeed') $status_time = ['successed_at'=> Carbon::now()]; 

                $order->update(['status' => $status, 'is_earning'=> true, ...$status_time]);
                return response()->json(['status' => 'success']);
            }

            return response()->json(['status'=> false, 'message'=> 'Earning statement has been already added!']);
        }

        $order->update(['status' => $status]);
        return response()->json(['status' => 'success']);
    }
}

