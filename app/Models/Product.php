<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Product extends Model
{
    use HasFactory, SoftDeletes;
    protected $fillable = ['code', 'stock_check', 'product_type', 'category_id', 'brand_id', 'user_id', 'updated_by', 'name', 'slug', 'thumbnail', 'more_images', 'short_description', 'description', 'additional_info', 'meta_title', 'meta_description', 'meta_keyword', 'alert_quantity', 'min_order', 'max_order', 'video', 'video_id', 'status', 'variant_product', 'choice_options', 'attributes'];

    public function category()
    {
        return $this->belongsTo(Category::class, 'category_id');
    }

    public function brand()
    {
        return $this->belongsTo(Brand::class, 'brand_id');
    }

    public function orderProducts()
    {
        return $this->hasMany(OrderProduct::class, 'product_id');
    }

    public function price()
    {
        return $this->belongsTo(ProductPrice::class, 'id', 'product_id');
    }

    public function stocks()
    {
        return $this->hasMany(ProductStock::class, 'product_id');
    } 

    public function reviews()
    {
        return $this->hasMany(Review::class, 'product_id')->with('customer');
    }

    public function getProductsByParentCategoryId(array|string $parent_category_id, string|NULL $product_type = null, array|NULL $select = null)
    {
        if(is_array($parent_category_id)){

            $query = $this->where(function($query) use ($parent_category_id){
                foreach ($parent_category_id as $category_id) {
                    $query->orWhereJsonContains('category_id->main_category_id', $category_id);
                }
            })->with(['price'])->where('status', true);

            if($product_type) $query->where('product_type', $product_type);

            $products = $query->latest('updated_at')->get();

            return $products;
        }

        if($product_type){
            return $this->whereJsonContains('category_id->main_category_id', [$parent_category_id])->with(['price', 'stocks'])->where('status', true)->where('product_type', $product_type)->latest('updated_at')->get();
        }

        if(is_array($select)){
            return $this->whereJsonContains('category_id->main_category_id', [$parent_category_id])->select($select)->where('status', true)->latest('updated_at')->get();
        }
        
        return $this->whereJsonContains('category_id->main_category_id', [$parent_category_id])->with(['price', 'stocks'])->where('status', true)->latest('updated_at')->get();
    }

    public function getProductsByChildCategoryId($child_category_id, string|NULL $product_type = null, array|NULL $select = null)
    {
        if($product_type){
            return $this->whereJsonContains('category_id->child_category_id', [$child_category_id])->with(['price', 'stocks'])->where('status', true)->where('product_type', $product_type)->latest('updated_at')->get();
        }

        if(is_array($select)){
            return $this->whereJsonContains('category_id->child_category_id', [$child_category_id])->select($select)->where('status', true)->latest('updated_at')->get();
        }
        
        return $this->whereJsonContains('category_id->child_category_id', [$child_category_id])->with(['price', 'stocks'])->where('status', true)->latest('updated_at')->get();
    }

    public function getProductsByChildrenCategoryId($children_category_id, string|NULL $product_type = null)
    {
        if($product_type){
            return $this->whereJsonContains('category_id->subchild_category_id', [$children_category_id])->with(['price', 'stocks'])->where('status', true)->where('product_type', $product_type)->latest('updated_at')->get();
        }
        
        return $this->whereJsonContains('category_id->subchild_category_id', [$children_category_id])->with(['price', 'stocks'])->where('status', true)->latest('updated_at')->get();
    }

    /**
     * @uses name::function Name get all the products to match any category with product category_id 's any attributed of element;
     * @param string $category_id
     */
    public function getProductsByCategoryId($id, int|NULL $paginate = null, bool|NULL $is_count = null){
        $category_id = is_string($id) ? $id : strval($id);

        if(!$paginate && $is_count){
            $products = $this->where(function ($query) use ($category_id) {
                $query->orWhereJsonContains('category_id->main_category_id', $category_id)
                      ->orWhereJsonContains('category_id->child_category_id', $category_id)
                      ->orWhereJsonContains('category_id->subchild_category_id', $category_id);
            })
            ->where('status', true)
            ->count();

            return $products;
        }

        if($paginate && !$is_count){
            $products = $this->where(function ($query) use ($category_id) {
                $query->orWhereJsonContains('category_id->main_category_id', $category_id)
                      ->orWhereJsonContains('category_id->child_category_id', $category_id)
                      ->orWhereJsonContains('category_id->subchild_category_id', $category_id);
            })
            ->with(['price', 'stocks'])
            ->where('status', true)
            ->latest('updated_at')
            ->paginate($paginate);

            return $products;
        }

        $products = $this->where(function ($query) use ($category_id) {
            $query->orWhereJsonContains('category_id->main_category_id', $category_id)
                  ->orWhereJsonContains('category_id->child_category_id', $category_id)
                  ->orWhereJsonContains('category_id->subchild_category_id', $category_id);
        })
        ->with(['price', 'stocks'])
        ->where('status', true)
        ->latest('updated_at')
        ->get();

        return $products;
    }
}
