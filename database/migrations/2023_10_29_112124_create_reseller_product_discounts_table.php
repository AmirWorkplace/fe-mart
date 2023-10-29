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
        Schema::create('reseller_product_discounts', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('product_id');
            $table->bigInteger('discount_percentage');
            $table->bigInteger('discount');
            $table->bigInteger('price');
            $table->dateTime('end_time');
            $table->dateTime('start_time');
            $table->boolean('status')->default(true);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('reseller_product_discounts');
    }
};
