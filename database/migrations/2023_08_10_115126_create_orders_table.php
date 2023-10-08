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
        Schema::create('orders', function (Blueprint $table) {
            $table->id();
            $table->string('order_code')->unique();
            $table->unsignedBigInteger('user_id');
            $table->string('user_name');
            $table->string('user_phone');
            $table->unsignedBigInteger('shipping_address_id');
            $table->float('shipping_charge');
            $table->float('sub_total');
            $table->float('discount');
            $table->float('total');
            $table->float('paid');
            $table->float('due');
            $table->string('payment_method')->default('cod');
            $table->unsignedBigInteger('coupon_id')->nullable();
            $table->string('status')->default('Pending');
            $table->timestamp('pending_at')->nullable();
            $table->timestamp('confirmed_at')->nullable();
            $table->timestamp('processing_at')->nullable();
            $table->timestamp('delivered_at')->nullable();
            $table->timestamp('successed_at')->nullable();
            $table->timestamp('canceled_at')->nullable();
            $table->timestamp('return_at')->nullable();
            $table->text('order_note')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('orders');
    }
};
