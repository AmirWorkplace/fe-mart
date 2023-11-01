<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ResellerStatement extends Model
{
    use HasFactory;
    protected $fillable = [
        'user_id',
        'order_id',
        'withdraw_id',
        'description',
        'withdraw',
        'deposit',
        'balance',
        'status',
        'created_at',
    ];
}
