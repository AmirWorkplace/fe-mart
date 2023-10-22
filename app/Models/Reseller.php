<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Reseller extends Model
{
    use HasFactory;
    protected $fillable = ['user_id', 'shop_name', 'mobile_bank_type', 'mobile_bank_number', 'bank_name', 'bank_account', 'city', 'shop_logo', 'shop_utility', 'website_url', 'status'];
}
