<?php

namespace App\Http\Controllers\Customer;

use App\Http\Controllers\Controller;
use App\Models\Attribute;
use App\Models\FlashdealProduct;
use App\Models\Product;
use App\Models\ProductStock;
use Illuminate\Http\Request;

class CartController extends Controller
{

    public function addToCart(Request $request)
    {
        $variant_product = ProductStock::findOrFail($request->variant_id);
        $stock = $variant_product->qty - $variant_product->ordered;
        if ($stock < 1) {
            return response()->json(['status' => 'error', 'data' => 'Stock Out']);
        }

        $cart = session()->get('cart');
        $flash_deal_id = $request->flash_deal_id;
        $flash_deal_item_id = $request->flash_deal_item_id;
        if (!$cart) {
            $data = $this->sessionData($request->variant_id, $flash_deal_id, $flash_deal_item_id);
            $cart = [
                $request->variant_id => $data
            ];
            session()->put('cart', $cart);

            $variant_product = ProductStock::findOrFail($request->variant_id);
            $category_name = $variant_product->product->category->name;
            $product_url = Route('frontend.single-product', $variant_product->product->slug);

            $data['category_name'] = $category_name;
            $data['product_url'] = $product_url;

            if ($request->ajax()) {
                return response()->json(['status' => 'success', 'data' => $data, 'total_cart_items' => 1, 'total_cart_price' => $data['price']]);
            } else {
                return redirect()->route('customer.checkout')->withSuccessMessage('Product Added Successfully!');
            }
        }

        if (isset($cart[$request->variant_id])) {
            $cart[$request->variant_id]['qty'] += $request->quantity;
            session()->put('cart', $cart);
            $total_cart_price = 0;
            foreach ($cart as $item) {
                $total_cart_price += $item['price'] * $item['qty'];
            }
            if ($request->ajax()) {
                return response()->json(['status' => 'quantity_updated', 'qty' => $cart[$request->variant_id]['qty'], 'variant_id' => $request->variant_id, 'total_cart_price' => number_format($total_cart_price, 2)]);
            } else {
                return redirect()->route('customer.cart')->withSuccessMessage('Product Added Successfully!');
            }
        }

        $data = $this->sessionData($request->variant_id, $flash_deal_id, $flash_deal_item_id);
        $cart[$request->variant_id] = $data;

        $variant_product = ProductStock::findOrFail($request->variant_id);
        $category_name = $variant_product->product->category->name;
        $product_url = Route('frontend.single-product', $variant_product->product->slug);

        $data['category_name'] = $category_name;
        $data['product_url'] = $product_url;

        session()->put('cart', $cart);

        $cart = session()->get('cart');
        $total_items = count($cart);
        $total_cart_price = 0;
        foreach ($cart as $item) {
            $total_cart_price += $item['price'] * $item['qty'];
        }
        if ($request->ajax()) {
            return response()->json(['status' => 'success', 'data' => $data, 'total_cart_items' => $total_items, 'total_cart_price' => number_format($total_cart_price, 2)]);
        } else {
            return redirect()->route('customer.cart')->withSuccessMessage('Product Added Successfully!');
        }
    }

    protected function sessionData($variant_id, $flash_deal_id, $flash_deal_item_id)
    {
        $variant_product = ProductStock::findOrFail($variant_id);
        $str = '';
        $attributes = [];
        foreach (json_decode(Product::find(request()->id)->choice_options) as $key => $choice) {
            $str .= $key != 0 ? '-' : '';
            $str .= str_replace(' ', '', request()['attribute_id_' . $choice->attribute_id]);
            if (request()['attribute_id_' . $choice->attribute_id]) {
                $attribute = Attribute::findOrFail($choice->attribute_id);
                $attributes[$attribute->name] = request()['attribute_id_' . $choice->attribute_id];
            }
        }

        if (is_null($flash_deal_item_id)) {
            $discounted_price = $variant_product->price;
        } else {
            $deal_product = FlashdealProduct::find($flash_deal_item_id);
            if ($deal_product->discount_type == 'amount') {
                $discounted_price = $variant_product->price - $deal_product->discount;
            } else {
                $discount = ($variant_product->price / 100) * $deal_product->discount;
                $discounted_price = $variant_product->price - floor($discount);
            }
        }
        return [
            'flash_deal_id' => $flash_deal_id,
            'flash_deal_item_id' => $flash_deal_item_id,
            'product_type' => $variant_product->product->product_type,
            'variant_id' => $variant_id,
            'attribute' => $attributes,
            'product_variant' => $str,
            'name' => $variant_product->product->name,
            'price' => $variant_product->price,
            'discounted_price' => $discounted_price,
            'slug' => $variant_product->product->slug,
            'category_slug' => $variant_product->product->category->slug,
            'image' => $variant_product->product->thumbnail,
            'qty' => request('quantity'),
        ];
    }

    public function cart()
    {
        return view('customer.cart');
    }

    public function removeFromCart(Request $request)
    {
        $cart = session()->get('cart');
        if (isset($cart[$request->id])) {
            unset($cart[$request->id]);
            session()->put('cart', $cart);
        }
        $cart = session()->get('cart');
        $total_items = count($cart);
        $total_cart_price = 0;
        foreach ($cart as $item) {
            $total_cart_price += $item['price'] * $item['qty'];
        }
        return response()->json(['status' => 'success', 'total_cart_items' => $total_items, 'total_cart_price' => $total_cart_price]);
    }
}
