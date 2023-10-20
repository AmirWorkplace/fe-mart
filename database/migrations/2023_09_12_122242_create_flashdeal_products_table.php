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
        Schema::create('flashdeal_products', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('flash_deal_id');
            $table->unsignedBigInteger('product_id');
            $table->double('discount');
            $table->string('discount_type');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('flashdeal_products');
    }
};
