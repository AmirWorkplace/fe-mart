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
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->string('product_type')->default('new_arrival');
            $table->unsignedBigInteger('category_id');
            $table->unsignedBigInteger('brand_id')->nullable();
            $table->unsignedBigInteger('user_id');
            $table->unsignedBigInteger('updated_by')->nullable();
            $table->string('name');
            $table->string('slug')->unique();
            $table->string('thumbnail');
            $table->text('more_images')->nullable();
            $table->text('short_description');
            $table->longText('description');
            $table->longText('additional_info')->nullable();
            $table->text('meta_title')->nullable();
            $table->text('meta_description')->nullable();
            $table->text('meta_keyword')->nullable();
            $table->bigInteger('alert_quantity')->nullable();
            $table->bigInteger('min_order')->default(1);
            $table->bigInteger('max_order')->nullable();
            $table->string('video')->nullable();
            $table->string('video_id')->nullable();
            $table->tinyInteger('variant_product')->default(0);
            $table->text('attributes')->default('[]');
            $table->text('choice_options')->nullable();
            $table->tinyInteger('status')->default(1);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('products');
    }
};
