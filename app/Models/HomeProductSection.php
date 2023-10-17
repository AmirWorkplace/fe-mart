<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class HomeProductSection extends Model
{
    use HasFactory;
    protected $fillable = ['category_id', 'brand_ids', 'first_row_content', 'second_row_content', 'banner_one', 'banner_one_link', 'banner_two', 'banner_two_link', 'order', 'status'];

    public function category()
    {
        return $this->belongsTo(Category::class, 'category_id')->where('status', 1)->with(['limitChildren', 'children']);
    }
}
