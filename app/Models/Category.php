<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    use HasFactory;
    protected $fillable = ['parent_id', 'name', 'slug', 'image', 'featured', 'order', 'status'];

    public function scopeRoot($query)
    {
        $query->whereNull('parent_id');
    }

    public function parent()
    {
        return $this->belongsTo(Category::class, 'parent_id', 'id');
    }

    public function children()
    {
        return $this->hasMany(Category::class, 'parent_id')->where('status', 1)->orderBy('name');
    }

    public function limitChildren()
    {
        return $this->hasMany(Category::class, 'parent_id')->where('status', 1)->inRandomOrder();
    }

    public function products()
    {
        return $this->hasMany(Product::class, 'category_id');
    }
}
