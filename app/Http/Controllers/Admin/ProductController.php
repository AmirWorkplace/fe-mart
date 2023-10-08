<?php

namespace App\Http\Controllers\Admin;

use App\helperClass;
use App\Models\Brand;
use App\Models\Product;
use App\Models\Category;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\AttributeValue;
use App\Models\ProductPrice;
use App\Services\ProductStockService;
use Illuminate\Support\Facades\Auth;
use Yajra\DataTables\Facades\DataTables;

class ProductController extends Controller
{
    protected $productStockService;

    public function __construct(ProductStockService $productStockService)
    {
        $this->productStockService = $productStockService;
    }

    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        if (request()->ajax()) {
            $model = Product::with(['orderProducts', 'price'])->latest('id');
            $type = request('type');
            if (!empty($type) && $type == 'trash') {
                $model->onlyTrashed();
            }
            return DataTables::eloquent($model)
                ->addColumn('checkbox', function ($row) {
                    $checkbox = '<div class="custom-control custom-checkbox">
                    <input type="checkbox" class="custom-control-input ';
                    if (!empty(request('type')) && request('type') == "trash") {
                        $checkbox .= 'trash_multi_checkbox';
                    } else {
                        $checkbox .= 'multi_checkbox';
                    }
                    $checkbox .= '" id="' . $row->id . '" name="multi_checkbox[]" value="' . $row->id . '"><label for="' . $row->id . '" class="custom-control-label"></label></div>';
                    return $checkbox;
                })
                ->addColumn('image', function ($row) {
                    return '<img src="' . asset($row->thumbnail) . '" height="50" alt="' . $row->name . '">';
                })
                ->addColumn('regular_price', function ($row) {
                    return $row->price->regular_price . ' TK';
                })
                ->addColumn('sale_price', function ($row) {
                    return $row->price->sale_price . ' TK';
                })
                ->addColumn('discount', function ($row) {
                    return $row->price->discount_tk . ' TK';
                })
                ->addColumn('category', function ($row) {
                    if ($row->category) {
                        return $row->category->name;
                    }
                })
                ->addColumn('status', function ($row) {
                    $status =
                        '<div class="form-check form-switch">
                            <input class="form-check-input change-status c-pointer" data-url="' . Route('admin.product.edit', $row->id) . '" type="checkbox" name="status"';
                    if (count($row->orderProducts) > 0) {
                        $status .= ' disabled ';
                    }
                    if ($row->status == 1) {
                        $status .= ' checked ';
                    }
                    $status .= '>
                        </div>';
                    return $status;
                })
                ->addColumn('actions', function ($row) {
                    $actionBtn = '<div class="btn-group">';
                    $type = request('type');
                    if (!empty($type) && $type == 'trash') {
                        $actionBtn .= '<button type="button" class="btn btn-sm btn-success border-0 px-10px fs-15 link-recovery" data-url="' . Route('admin.product.recovery', $row->id) . '"><i class="fad fa-recycle"></i></button>';
                    } else {
                        $actionBtn .= '<a class="btn btn-sm btn-warning border-0 px-10px fs-15" href="' . Route('admin.product.edit', $row->id) . '"><i class="far fa-pencil-alt"></i></a>';
                    }
                    $actionBtn .= '<button type="button" class="btn btn-sm btn-danger border-0 px-10px fs-15';
                    if (!empty(request('type')) && request('type') == "trash") {
                        $actionBtn .= ' trash_delete"';
                    } else {
                        $actionBtn .= ' link-delete"';
                    }
                    if (count($row->orderProducts) > 0) {
                        $actionBtn .= ' disabled ';
                    }
                    $actionBtn .= 'data-url="' . Route('admin.product.destroy', $row->id) . '"><i class="far fa-trash-alt"></i></button></div>';
                    return $actionBtn;
                })
                ->rawColumns(['checkbox', 'image', 'status', 'actions'])
                ->make(true);
        }
        return view('admin.product.index');
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        if (request()->ajax()) {
            $child_categories = Category::where('parent_id', request('id'))->where('status', 1)->get();
            return response()->json(['status' => 'success', 'child_categories' => $child_categories]);
        }

        $categories =  Category::root()->where('status', 1)->get();
        $brands =  Brand::where('status', 1)->orderBy('name')->get();
        return view('admin.product.store', compact('categories', 'brands'));
    }

    public function sku_combination(Request $request)
    {
        $options = array();

        $unit_price = $request->sale_price;
        $product_name = $request->name;

        if ($request->choice_no) {
            foreach ($request->choice_no as $key => $no) {
                $name = 'choice_options_' . $no;
                $data = array();
                if ($request[$name] != '') {
                    foreach ($request[$name] as $key => $item) {
                        array_push($data, $item);
                    }
                }
                if (count($data) == 0) {
                    continue;
                }
                array_push($options, $data);
            }
        }
        $combinations = $this->makeCombinations($options);
        return view('admin.product.sku_combinations', compact('combinations', 'unit_price', 'product_name'));
    }

    public function sku_combination_edit(Request $request)
    {
        $options = array();

        $unit_price = $request->sale_price;
        $product_name = $request->name;

        if ($request->choice_no) {
            foreach ($request->choice_no as $key => $no) {
                $name = 'choice_options_' . $no;
                $data = array();
                if ($request[$name] != '') {
                    foreach ($request[$name] as $key => $item) {
                        array_push($data, $item);
                    }
                }
                if (count($data) == 0) {
                    continue;
                }
                array_push($options, $data);
            }
        }
        $combinations = $this->makeCombinations($options);
        return view('admin.product.sku_combinations', compact('combinations', 'unit_price', 'product_name'));
    }

    public static function makeCombinations($arrays)
    {
        $result = array(array());
        foreach ($arrays as $property => $property_values) {
            $tmp = array();
            foreach ($result as $result_item) {
                foreach ($property_values as $property_value) {
                    $tmp[] = array_merge($result_item, array($property => $property_value));
                }
            }
            $result = $tmp;
        }
        return $result;
    }

    public function add_more_choice_option(Request $request)
    {
        $all_attribute_values = AttributeValue::with('attribute')->where('attribute_id', $request->attribute_id)->get();
        $html = '';

        foreach ($all_attribute_values as $row) {
            $html .= '<option value="' . $row->value . '">' . $row->value . '</option>';
        }

        echo json_encode($html);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate(
            [
                'name' => 'required',
                'thumbnail' => 'image|required',
                'regular_price' => 'required',
                'category_id' => 'required',
                'video' => 'max:15360',
            ],
            [
                'video.max' => 'Can not Upload video larget than 15MB'
            ]
        );

        $collection = collect($request->all());
        $choice_options = array();
        $attributes = [];

        if (isset($collection['choice_no']) && $collection['choice_no']) {
            $str = '';
            $item = array();
            foreach ($collection['choice_no'] as $key => $no) {
                $str = 'choice_options_' . $no;
                $item['attribute_id'] = $no;
                $attribute_data = array();

                if (isset($collection[$str])) {
                    foreach ($collection[$str] as $key => $eachValue) {
                        array_push($attribute_data, $eachValue);
                    }
                    $attributes[] = $no;
                }
                if (count($attribute_data) == 0) {
                    continue;
                }
                $item['values'] = $attribute_data;
                array_push($choice_options, $item);
            }
        }
        $choice_options = json_encode($choice_options, JSON_UNESCAPED_UNICODE);

        // Product Video
        $video = $request->file('video');
        if (isset($video)) {
            $video_name = 'product-video-' . uniqid() . '.' . $video->getClientOriginalExtension();
            $upload_path = 'media/video/';
            $video_path_name = $upload_path . $video_name;
            $video->move($upload_path, $video_name);
        } else {
            $video_path_name = NULL;
        }

        // Product Thumbnail
        $thumbnail = $request->file('thumbnail');
        if (isset($thumbnail)) {
            $response = helperClass::storeImage($thumbnail, 800, 'media/product/');
            if ($response['status'] == 'success') {
                $thumbnail_path_name =  $response['path_name'];
            } else {
                $thumbnail_path_name = NULL;
            }
        } else {
            $thumbnail_path_name = NULL;
        }

        // Product Other Images
        $more_images = $request->file('more_images');
        if (isset($more_images)) {
            foreach ($more_images as $key => $more_image) {
                $response = helperClass::storeImage($more_image, 800, 'media/product/');
                if ($response['status'] == 'success') {
                    $img_arr[$key] = $response['path_name'];
                }
            }
            $more_images_path_names = trim(implode('|', $img_arr), '|');
        } else {
            $more_images_path_names = NULL;
        }

        $slug = Str::slug($request->name);
        $same_slug_count = Product::withTrashed()->where('slug', 'LIKE', $slug . '%')->count();
        $slug_suffix = $same_slug_count ? '-' . $same_slug_count + 1 : '';
        $slug .= $slug_suffix;

        // Store Product
        $product = Product::create([
            'product_type' => $request->product_type,
            'category_id' => $request->category_id,
            'brand_id' => $request->brand_id,
            'user_id' => Auth::user()->id,
            'name' => $request->name,
            'slug' => $slug,
            'thumbnail' => $thumbnail_path_name,
            'more_images' => $more_images_path_names,
            'short_description' => $request->short_description,
            'description' => $request->description,
            'additional_info' => $request->additional_info,
            'meta_title' => $request->meta_title,
            'meta_description' => $request->meta_description,
            'meta_keyword' => $request->meta_keyword,
            'alert_quantity' => $request->alert_quantity,
            'min_order' => $request->min_order,
            'max_order' => $request->max_order,
            'video' => $video_path_name,
            'video_id' => $request->video_id,
            'choice_options' => $choice_options,
            'attributes' => json_encode($attributes),
            'status' => $request->status,
        ]);

        // Add Product Price
        ProductPrice::create([
            'product_id' => $product->id,
            'regular_price' => $request->regular_price,
            'sale_price' => $request->sale_price,
            'discount' => $request->discount,
            'discount_tk' => $request->discount_tk,
            'vendor_price' => $request->vendor_price,
            'reseller_price' => $request->reseller_price,
        ]);

        //Product Stock
        $this->productStockService->store($request->only(['choice_no', 'sale_price', 'sku', 'current_stock']), $product);

        return redirect()->route('admin.product.index')->withSuccessMessage('Added Successfully!');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        if (request()->ajax() && request()->has('getCategories')) {
            $child_categories = Category::where('parent_id', request('id'))->where('status', 1)->get();
            return response()->json(['status' => 'success', 'child_categories' => $child_categories]);
        }

        if (request()->ajax() && request('status')) {
            $data = Product::findOrFail($id);
            $data->update(['status' => !$data->status]);
            return response()->json(['status' => 'success']);
        }

        $product = Product::findOrFail($id);
        $parent_id = NULL;
        $child_id = NULL;
        $subchild_id = NULL;

        $product_category = $product->category;
        if ($product_category->parent_id) {
            $check_parent = Category::findOrFail($product_category->parent_id);
            if ($check_parent->parent_id) {
                $parent_id = $check_parent->parent_id;
                $child_id = $check_parent->id;
                $subchild_id = $product->category->id;
            } else {
                $parent_id = $check_parent->id;
                $child_id = $product->category->id;
            }
        } else {
            $parent_id = $product->category->id;
        }

        $parent_categories =  Category::root()->where('status', 1)->get();
        $child_categories = Category::where('parent_id', $parent_id)->get();
        $subchild_categories = Category::where('parent_id', $child_id)->get();
        $brands =  Brand::where('status', 1)->latest()->get();
        return view('admin.product.edit', compact('product', 'parent_id', 'child_id', 'subchild_id', 'parent_categories', 'child_categories', 'subchild_categories', 'brands'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $request->validate(
            [
                'name' => 'required',
                'thumbnail' => 'image',
                'regular_price' => 'required',
                'category_id' => 'required',
                'video' => 'max:15360',
            ],
            [
                'video.max' => 'Can not Upload video larget than 15MB'
            ]
        );

        $collection = collect($request->all());
        $choice_options = array();
        $attributes = [];

        if (isset($collection['choice_no']) && $collection['choice_no']) {
            $str = '';
            $item = array();
            foreach ($collection['choice_no'] as $key => $no) {
                $str = 'choice_options_' . $no;
                $item['attribute_id'] = $no;
                $attribute_data = array();

                if (isset($collection[$str])) {
                    foreach ($collection[$str] as $key => $eachValue) {
                        array_push($attribute_data, $eachValue);
                    }
                    $attributes[] = $no;
                }
                if (count($attribute_data) == 0) {
                    continue;
                }
                $item['values'] = $attribute_data;
                array_push($choice_options, $item);
            }
        }
        $choice_options = json_encode($choice_options, JSON_UNESCAPED_UNICODE);

        $product = Product::findOrFail($id);

        // Product Video
        $video = $request->file('video');
        if (isset($video)) {
            $video_name = 'product-video-' . uniqid() . '.' . $video->getClientOriginalExtension();
            $upload_path = 'media/video/';
            $video_path_name = $upload_path . $video_name;
            $video->move($upload_path, $video_name);
            if (file_exists($product->video)) {
                unlink($product->video);
            }
        } else {
            $video_path_name = $product->video;
        }

        // Product Thumbnail
        $thumbnail = $request->file('thumbnail');
        if (isset($thumbnail)) {
            $response = helperClass::storeImage($thumbnail, 800, 'media/product/', $product->thumbnail);
            if ($response['status'] == 'success') {
                $thumbnail_path_name =  $response['path_name'];
            } else {
                $thumbnail_path_name = $product->thumbnail;
            }
        } else {
            $thumbnail_path_name = $product->thumbnail;
        }

        // Product Other Images
        $more_images = $request->file('more_images');
        if (isset($more_images)) {
            foreach ($more_images as $key => $more_image) {
                $response = helperClass::storeImage($more_image, 800, 'media/product/');
                if ($response['status'] == 'success') {
                    $img_arr[$key] = $response['path_name'];
                }
            }
            $more_images_path_names = trim(implode('|', $img_arr), '|');

            $old_more_images = explode('|', $product->more_images);
            foreach ($old_more_images as $key => $image) {
                if (file_exists($image)) {
                    unlink($image);
                }
            }
        } else {
            $more_images_path_names = $product->more_images;
        }

        $slug = Str::slug($request->name);
        $same_slug_count = Product::withTrashed()->where('slug', 'LIKE', $slug . '%')->whereNotIn('id', [$id])->count();
        $slug_suffix = $same_slug_count ? '-' . $same_slug_count + 1 : '';
        $slug .= $slug_suffix;

        // Update Product
        $product->update([
            'product_type' => $request->product_type,
            'category_id' => $request->category_id,
            'brand_id' => $request->brand_id,
            'updated_by' => Auth::user()->id,
            'name' => $request->name,
            'slug' => $slug,
            'thumbnail' => $thumbnail_path_name,
            'more_images' => $more_images_path_names,
            'short_description' => $request->short_description,
            'description' => $request->description,
            'additional_info' => $request->additional_info,
            'meta_title' => $request->meta_title,
            'meta_description' => $request->meta_description,
            'meta_keyword' => $request->meta_keyword,
            'alert_quantity' => $request->alert_quantity,
            'min_order' => $request->min_order,
            'max_order' => $request->max_order,
            'video' => $video_path_name,
            'video_id' => $request->video_id,
            'choice_options' => $choice_options,
            'attributes' => json_encode($attributes),
            'status' => $request->status,
        ]);

        // Add Product Price
        $product_price = ProductPrice::findOrFail($product->price->id);
        $product_price->update([
            'product_id' => $id,
            'regular_price' => $request->regular_price,
            'sale_price' => $request->sale_price,
            'discount' => $request->discount,
            'discount_tk' => $request->discount_tk,
            'vendor_price' => $request->vendor_price,
            'reseller_price' => $request->reseller_price,
        ]);

        //Product Stock
        foreach ($product->stocks as $key => $stock) {
            if (file_exists($stock->image)) {
                unlink($stock->image);
            }
            $stock->delete();
        }

        $this->productStockService->store($request->only(['choice_no', 'sale_price', 'sku', 'current_stock']), $product);

        return redirect()->route('admin.product.index')->withSuccessMessage('Updated Successfully!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        // Delete Multiple Items Permanent
        if (request()->has('id') && request()->has('parmanent') && request('parmanent') == 'true') {
            foreach (request('id') as $id) {
                $product = Product::onlyTrashed()->findOrFail($id);
                if (count($product->orderProducts) == 0) {
                    if (file_exists($product->thumbnail)) {
                        unlink($product->thumbnail);
                    }
                    $old_more_images = explode('|', $product->more_images);
                    foreach ($old_more_images as $key => $image) {
                        if (file_exists($image)) {
                            unlink($image);
                        }
                    }
                    if (file_exists($product->video)) {
                        unlink($product->video);
                    }
                    ProductPrice::where('product_id', $id)->delete();
                    //Product Stock
                    foreach ($product->stocks as $key => $stock) {
                        if (file_exists($stock->image)) {
                            unlink($stock->image);
                        }
                        $stock->delete();
                    }
                    $product->forceDelete();
                } else {
                    return response()->json(['status' => 'error']);
                }
            }
            return response()->json(['status' => 'success']);
        }

        // Delete Single Item Permanent
        if (request()->has('parmanent') && request('parmanent') == 'true') {
            $product = Product::onlyTrashed()->findOrFail($id);
            if (count($product->orderProducts) == 0) {
                if (file_exists($product->thumbnail)) {
                    unlink($product->thumbnail);
                }
                $old_more_images = explode('|', $product->more_images);
                foreach ($old_more_images as $key => $image) {
                    if (file_exists($image)) {
                        unlink($image);
                    }
                }
                if (file_exists($product->video)) {
                    unlink($product->video);
                }
                ProductPrice::where('product_id', $id)->delete();
                //Product Stock
                foreach ($product->stocks as $key => $stock) {
                    if (file_exists($stock->image)) {
                        unlink($stock->image);
                    }
                    $stock->delete();
                }
                $product->forceDelete();
            } else {
                return response()->json(['status' => 'error']);
            }
            return response()->json(['status' => 'success']);
        }

        // Delete Multiple Items
        if (request()->has('id')) {
            foreach (request('id') as $id) {
                $product = Product::findOrFail($id);
                if (count($product->orderProducts) == 0) {
                    $product->delete();
                } else {
                    return response()->json(['status' => 'error']);
                }
            }
            return response()->json(['status' => 'success']);
        }

        // Delete Single Item
        $product = Product::findOrFail($id);
        if (count($product->orderProducts) == 0) {
            $product->delete();
        } else {
            return response()->json(['status' => 'error']);
        }
        return response()->json(['status' => 'success']);
    }

    public function productRecovery($id)
    {
        if (request()->ajax()) {
            Product::onlyTrashed()->findOrFail($id)->restore();
            return response()->json(['status' => 'success']);
        }
    }
}
