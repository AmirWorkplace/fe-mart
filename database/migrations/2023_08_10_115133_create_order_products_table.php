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
        Schema::create('order_products', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('order_id');
            $table->unsignedBigInteger('product_id');
            $table->unsignedBigInteger('variant_id');
            $table->unsignedBigInteger('flash_deal_id')->nullable();
            $table->unsignedBigInteger('flash_deal_item_id')->nullable();
            $table->string('product_name');
            $table->string('product_thumbnail');
            $table->double('discount')->default(0);
            $table->double('sale_price');
            $table->double('regular_price');
            $table->double('discount_price')->default(0.00);
            $table->double('vendor_price')->default(0.00);
            $table->double('reseller_price')->default(0.00);
            $table->double('order_price')->default(0.00);
            $table->integer('quantity');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('order_products');
    }
};
