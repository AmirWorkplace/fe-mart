<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ProductStock extends Model
{
    use HasFactory;
    protected $fillable = ['product_id', 'variant', 'sku', 'price', 'qty', 'ordered', 'image'];

    public function product()
    {
        return $this->belongsTo(Product::class, 'product_id');
    }
}
