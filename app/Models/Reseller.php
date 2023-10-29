<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Reseller extends Model
{
    use HasFactory;
    protected $fillable = ['user_id', 'shop_name', 'mobile_bank_type', 'mobile_bank_number', 'bank_name', 'bank_branch_name', 'bank_account', 'city', 'shop_logo', 'shop_utility', 'website_url', 'bkash', 'nagad', 'rocket', 'upay', 'status'];

    public function delivered_orders(){
        return $this->hasMany(Order::class, 'user_id', 'user_id')->where('status', 'Delivered');
    }

    public function success_withdraws(){
        return $this->hasMany(Withdraw::class, 'user_id', 'user_id')->where('status', 'Succeed');
    }

    public function user(){
        return $this->belongsTo(User::class, 'user_id');
    }

    public function resale_price(){
        return $this->hasMany(ProductResalePrice::class, 'reseller_id', 'user_id');
    }
}
