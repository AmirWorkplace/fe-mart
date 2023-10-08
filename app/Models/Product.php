<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Product extends Model
{
    use HasFactory, SoftDeletes;
    protected $fillable = ['product_type', 'category_id', 'brand_id', 'user_id', 'updated_by', 'name', 'slug', 'thumbnail', 'more_images', 'short_description', 'description', 'additional_info', 'meta_title', 'meta_description', 'meta_keyword', 'alert_quantity', 'min_order', 'max_order', 'video', 'video_id', 'status', 'variant_product', 'choice_options', 'attributes'];

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
}
