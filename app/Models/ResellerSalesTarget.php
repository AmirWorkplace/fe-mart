<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ResellerSalesTarget extends Model
{
    use HasFactory;
    protected $fillable = ['product_ids', 'product_id', 'target_type', 'target_amount', 'discount_amount', 'end_time', 'start_time', 'status'];
}
