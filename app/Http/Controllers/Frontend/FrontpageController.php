<?php

namespace App\Http\Controllers\Frontend;

use Carbon\Carbon;
use App\Models\Page;
use App\Models\Brand;
use App\Models\Slider;
use App\Models\Product;
use App\Models\Category;
use App\Models\Flashdeal;
use Illuminate\Http\Request;
use App\Models\FlashdealProduct;
use App\Models\HomeProductSection;
use App\Http\Controllers\Controller;
use App\Models\ProductStock;

class FrontpageController extends Controller
{
    public function home()
    {
        $featured_categories = Category::where('featured', 1)->where('status', 1)->latest('id')->limit(20)->get();
        $sliders = Slider::where('status', 1)->latest('id')->limit(8)->get();
        $brands = Brand::where('status', 1)->latest('id')->limit(50)->get();
        $product_sections = HomeProductSection::with(['category'])->where('status', 1)->orderBy('order')->get();
        $time_now = Carbon::now();
        $flash_deal = Flashdeal::with(['items'])->where('start_date', '<=', $time_now)->where('end_date', '>=', $time_now)->where('featured', 1)->where('status', 1)->latest('id')->first();
        return view('frontend.home', compact('featured_categories', 'sliders', 'brands', 'product_sections', 'flash_deal'));
    }

    public function quickView(Request $request)
    {
        $product = Product::findOrFail($request->product_id);
        $first_variant = $product->stocks->first();
        $current_stock = $first_variant->qty - $first_variant->ordered;
        $html = '
        <div class="row g-3">
            <div class="col-md-4">
                <img src="' . asset($product->thumbnail) . '" class="img-fluid" alt="' . $product->name . '">
            </div>
            <div class="col-md-8">
                <h1 class="detail-product-name">' . $product->name . '</h1>
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <div class="product-prices">
                        <div class="product-price d-flex align-items-center gap-2">
                            <div class="current-price">
                                <span>৳ ' . number_format($first_variant->price, 2) . '</span>
                            </div>' .
            ($product->price->regular_price != $first_variant->price ?
                '<div class="old-price text-md text-muted">
                                    <del>৳ ' . number_format($product->price->regular_price, 2) . '</del>
                                </div>' : ''
            )
            . '</div>
                    </div>
                    <div class="product-availability">
                        <label class="control-label">Availability</label>:
                        <span id="product-availability" class="product-available">
                            <span class="in-stock ' . ($current_stock > 0 ? 'd-inline-block' : 'd-none') . '">
                                <i class="far fa-check-square text-sm"></i> In stock
                            </span>
                            <span class="out-of-stock text-danger ' . ($current_stock > 0 ? 'd-none' : 'd-inline-block') . '">
                                Stock Out</span>
                            </span>
                        </div>
                    </div>
                    <div class="short_description">' . $product->short_description . '</div>
                    <form id="option-choice-form">
                        <input type="hidden" name="_token" value="' . csrf_token() . '" />
                        <input type="hidden" name="id" value="' . $product->id . '">
                        <input type="hidden" id="variant_id" name="variant_id" value="' . $first_variant->id . '">';
        if (!is_null($product->choice_options)) {
            $html .= '<div class="product-variants in_border">';
            foreach (json_decode($product->choice_options) as $key => $choice) {
                $html .= '<div class="product-variants-item">
                                        <span
                                            class="text-uppercase fw-500 text-xxs">' . \App\Models\Attribute::find($choice->attribute_id)->name . ':
                                        </span>
                                        <select id="attribute_id_' . $choice->attribute_id . '" class="form-select"
                                            name="attribute_id_' . $choice->attribute_id . '">';
                foreach ($choice->values as $key => $value) {
                    $html .= '<option value="' . $value . '" title="' . $value . '"
                                                    ' . ($key == 0 ? 'selected' : '') . '>' . $value . '</option>';
                }
                $html .= '</select>
                                    </div>';
            }
            $html .= '</div>';
        }
        $html .= '<div class="product-add-to-cart in_border">
                            <span class="control-label">QTY: </span>
                            <div class="product-quantity">
                                <div class="qty">
                                    <div class="input-group">
                                        <input type="number" name="quantity" id="quantity_wanted"
                                            class="input-group form-control quantity_wanted input-number"
                                            placeholder="1" value="' . $product->min_order . '"
                                            min="' . $product->min_order . '"
                                            max="' . ($current_stock < 1 ? 1 : $current_stock) . '">
                                        <span class="input-group-btn-vertical">
                                            <button class="btn btn-touchspin qty-plus" type="button">
                                                <i class="fal fa-plus"></i></button>
                                            <button class="btn btn-touchspin qty-minus bootstrap-touchspin-down"
                                                type="button"><i class="fal fa-minus"></i></button>
                                        </span>
                                    </div>
                                    <div class="avialable-amount text-muted text-xxs text-nowrap">
                                        (<span id="available-quantity">' . $current_stock . '</span> available)
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="product-add-to-cart in_border">
                            <div class="add">
                                <button class="btn btn-primary add-to-cart" ' . ($current_stock < 1 ? 'disabled' : '') . '
                                    type="button">
                                    <i class="shopping-cart"></i>
                                    <span>Add to cart</span>
                                </button>
                            </div>';
        if (auth()->user()) {
            $html .=
                '<button class="btn addToWishlist p-0" data-id="' . $product->id . '" type="button">
                                        <i class="zmdi zmdi-favorite-outline"></i>
                                    </button>';
        }
        $html .= '</div>
                </form></div>
                </div>';
        return response()->json(['status' => 'success', 'html' => $html]);
    }

    public function products($slug = NULL)
    {
        if (!is_null($slug)) {
            $category = Category::where('slug', $slug)->first();
            $products = Product::where('status', 1)->where('category_id', $category->id)->latest('id')->paginate(9);
        } else {
            $category = NULL;
            $products = Product::where('status', 1)->latest('id')->paginate(9);
        }
        $categories = Category::root()->with(['children'])->where('status', 1)->orderBy('name')->get();
        return view('frontend.products', compact('products', 'category', 'categories'));
    }

    public function search(Request $request)
    {
        $search_string = $request->search;
        if (!is_null($request->search_category)) {
            $slug = $request->search_category;
            $category = Category::where('slug', $slug)->first();
            $products = Product::where('status', 1)->where('category_id', $category->id)->where('name', 'LIKE', '%' . $search_string . '%')->orWhere('slug', 'LIKE', '%' . $search_string . '%')->latest('id')->paginate(9);
        } else {
            $category = NULL;
            $products = Product::where('status', 1)->where('name', 'LIKE', '%' . $search_string . '%')->orWhere('slug', 'LIKE', '%' . $search_string . '%')->latest('id')->paginate(9);
        }
        $categories = Category::root()->with(['children'])->where('status', 1)->orderBy('name')->get();
        return view('frontend.search_products', compact('products', 'category', 'categories', 'search_string'));
    }

    public function productFilter(Request $request)
    {
        $collection = $request->attribute;
        $attribute_names = [];
        foreach ($collection as $key => $attribute) {
            $name = 'attribute_' . $attribute;
            if (!is_null($request->$name)) {
                $attribute_names[] = 'attribute_' . $attribute;
            }
        }

        $search_string = $request->search;
        $min_price = $request->min_price;
        $max_price = $request->max_price;
        $slug = $request->search_category;
        if (!is_null($slug)) {
            $category = Category::where('slug', $slug)->first();
        } else {
            $category = NULL;
        }

        $query = ProductStock::query();
        $query->with('product')->whereHas('product', function ($sub_query) use ($search_string) {
            $sub_query->where('name', 'LIKE', '%' . $search_string . '%')->orWhere('name', 'LIKE', '%' . $search_string . '%');
        });
        $query->where('price', '>=', $min_price)->where('price', '<=', $max_price);
        foreach ($attribute_names as $name) {
            foreach ($request->$name as $value) {
                $query->orWhere('variant', 'LIKE', '%' . $value . '%');
            }
        }
        // $stocks = $query->whereColumn('qty', 'ordered')->get(['product_id']);
        $stocks = $query->get(['product_id']);
        $product_id = array_unique($stocks->pluck('product_id')->toArray());


        $query = Product::with('stocks')->where('status', 1)->whereHas('stocks', function ($query) {
            $query->whereColumn('qty', '>', 'ordered');
        });
        $query->where(function ($query) use ($product_id, $category) {
            $query->whereIn('id', $product_id);
            if (!is_null($category)) {
                $query->orWhere('category_id', $category->id);
            }
        });

        $products = $query->latest('id')->paginate(9);
        $categories = Category::root()->with(['children'])->where('status', 1)->orderBy('name')->get();
        return view('frontend.search_products', compact('products', 'category', 'categories', 'search_string', 'min_price', 'max_price'));
    }

    public function brandProducts($slug)
    {
        return view('frontend.products');
    }

    public function singleProduct($slug)
    {
        $product = Product::with(['category', 'price', 'stocks'])->where('slug', $slug)->where('status', 1)->first();
        $related_products = Product::with(['price'])->whereNotIn('id', [$product->id])->where(function ($query) use ($product) {
            $query->where('brand_id', $product->brand_id)
                ->orWhere('category_id', $product->category_id);
        })->where('status', 1)->inRandomOrder()->limit(5)->get();

        // Share Product
        $shareComponent = \Share::page(Route('frontend.single-product', $product->slug), $product->name)
            ->facebook()
            ->twitter()
            ->linkedin()
            ->telegram()
            ->whatsapp();

        return view('frontend.single_product', compact('product', 'related_products', 'shareComponent'));
    }

    public function flashDeal($slug)
    {
    }

    public function singleDealProduct($deal, $slug)
    {
        $flash_deal = Flashdeal::where('slug', $deal)->first();
        $product = Product::where('slug', $slug)->first();
        $flash_deal_product = FlashdealProduct::where('flash_deal_id', $flash_deal->id)->where('product_id', $product->id)->first();

        // Share Product
        $shareComponent = \Share::page(Route('frontend.single-deal-product', ['deal' => $deal, 'slug' => $slug]), $product->name)
            ->facebook()
            ->twitter()
            ->linkedin()
            ->telegram()
            ->whatsapp();
        return view('frontend.single_deal_product', compact('flash_deal', 'product', 'flash_deal_product', 'shareComponent'));
    }

    public function getVariantPrice(Request $request)
    {
        $product = Product::find($request->id);

        $str = '';
        $quantity = 0;
        $max_limit = 0;

        if (json_decode($product->choice_options) != null) {
            foreach (json_decode($product->choice_options) as $key => $choice) {
                if ($key > 0) {
                    $str .= '-';
                }
                $str .= str_replace(' ', '', $request['attribute_id_' . $choice->attribute_id]);
            }
        }

        $product_stock = $product->stocks->where('variant', $str)->first();
        if ($request->has('flash_deal_item_id')) {
            $deal_product = FlashdealProduct::find($request->flash_deal_item_id);
            if ($deal_product->discount_type == 'amount') {
                $price = $product_stock->price - $deal_product->discount;
            } else {
                $discount = ($product_stock->price / 100) * $deal_product->discount;
                $price = $product_stock->price - floor($discount);
            }
        } else {
            $price = $product_stock->price;
        }

        $stock_quantity = $product_stock->qty - $product_stock->ordered;
        $max_limit = $product_stock->qty - $product_stock->ordered;

        if ($stock_quantity >= 1 && $product->min_order <= $stock_quantity) {
            $in_stock = 1;
        } else {
            $in_stock = 0;
        }

        if ($request->quantity > $stock_quantity) {
            if ($stock_quantity == 0) {
                $req_quantity = 1;
            } else {
                $req_quantity = $stock_quantity;
            }
        } else {
            $req_quantity = $request->quantity;
        }

        return array(
            'price' => number_format($price * $req_quantity, 2),
            'quantity' => $stock_quantity,
            'variation' => $str,
            'variant_id' => $product_stock->id,
            'sku' => $product_stock->sku,
            'max_limit' => $max_limit,
            'in_stock' => $in_stock
        );
    }

    public function page($slug)
    {
        $page = Page::where('slug', $slug)->first();
        return view('frontend.page', compact('page'));
    }
}
