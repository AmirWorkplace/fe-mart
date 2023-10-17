<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrderProduct extends Model
{
    use HasFactory;
    protected $fillable = ['order_id', 'product_id', 'flash_deal_id', 'flash_deal_item_id', 'variant_id', 'product_name', 'product_thumbnail', 'discount', 'sale_price', 'regular_price', 'vendor_price', 'reseller_price', 'order_price', 'discount_price', 'quantity'];

    public function variant()
    {
        return $this->belongsTo(ProductStock::class, 'variant_id');
    }

    public function product()
    {
        return $this->belongsTo(Product::class, 'product_id');
    }
}
