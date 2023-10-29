<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Withdraw extends Model
{
    use HasFactory;
    protected $fillable = ['user_id', 'total_earning', 'withdraw_amount', 'account_number', 'withdrawal_method', 'transaction_id', 'status'];
}
