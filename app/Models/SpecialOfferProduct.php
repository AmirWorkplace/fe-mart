<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SpecialOfferProduct extends Model
{
    use HasFactory;
    protected $fillable = ['product_ids', 'image', 'name', 'status', 'serial', 'slug'];
}
