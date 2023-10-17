<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FlashdealProduct extends Model
{
    use HasFactory;
    protected $fillable = ['flash_deal_id', 'product_id', 'discount', 'discount_type'];

    public function product()
    {
        return $this->belongsTo(Product::class, 'product_id');
    }
}
