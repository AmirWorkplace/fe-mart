<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Flashdeal extends Model
{
    use HasFactory;
    protected $fillable = ['title', 'start_date', 'end_date', 'status', 'featured', 'banner', 'slug'];

    public function items()
    {
        return $this->hasMany(FlashdealProduct::class, 'flash_deal_id');
    }
}
