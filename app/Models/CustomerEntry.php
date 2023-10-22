<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CustomerEntry extends Model
{
    use HasFactory;
    protected $fillable = ['reseller_id', 'name', 'phone', 'email', 'address'];

    public function order(){
        $this->belongsTo(Order::class, 'customer_id');
    }
}

