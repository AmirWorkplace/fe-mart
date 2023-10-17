<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('home_product_sections', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('category_id');
            $table->text('brand_ids')->nullable();
            $table->string('first_row_content')->default('product');
            $table->string('second_row_content')->default('product');
            $table->string('banner_one')->nullable();
            $table->string('banner_one_link')->nullable();
            $table->string('banner_two')->nullable();
            $table->string('banner_two_link')->nullable();
            $table->integer('order');
            $table->tinyInteger('status')->default(1);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('home_product_sections');
    }
};
