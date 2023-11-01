<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CheckSalesTargetCashback extends Model
{
    use HasFactory;
    protected $fillable = ['user_id', 'offer_id', 'statement_id', 'is_cashback'];
}
