<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ResellerProductDiscount extends Model
{
    use HasFactory;
    protected $fillable = ['product_id', 'discount_percentage', 'discount', 'price', 'end_time', 'start_time', 'status'];
}
