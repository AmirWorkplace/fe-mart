<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory;
    protected $fillable = [
        'user_id', 'user_name', 'user_phone', 'order_code', 'shipping_charge', 'shipping_address_id', 'sub_total', 'total', 'discount', 'paid', 'due', 'coupon_id', 'payment_method', 'pending_at', 'confirmed_at', 'processing_at', 'delivered_at', 'successed_at', 'canceled_at', 'return_at', 'order_note', 'status'
    ];

    public function products()
    {
        return $this->hasMany(OrderProduct::class, 'order_id');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function address()
    {
        return $this->belongsTo(ShippingAddress::class, 'shipping_address_id');
    }
}
