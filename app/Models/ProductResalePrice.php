<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductResalePrice extends Model
{
    use HasFactory;
    protected $fillable = ['product_id', 'customer_id', 'reseller_id', 'order_id', 'resale_rate', 'main_rate', 'resale_prices', 'quantities', 'resale_discount_amount', 
        'is_sale_target_cashback'
    ];

    public function product(){
        return $this->belongsTo(Product::class, 'product_id')->with('price');
    }
}
