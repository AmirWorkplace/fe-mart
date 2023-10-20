@extends('layouts.frontend.app')
@section('content')
    @include('layouts.frontend.partial.breadcrumb', [
        'title' => 'SHOPPING CART',
        'link' => Route('customer.cart'),
    ])
    <section class="cart-section py-md-5 py-4 bg-white">
        <div class="container">
            <div class="row g-4">
                <div class="col-lg-8">
                    <h4 class="section__title">SHOPPING CART</h4>
                    <div class="cart-overview">
                        <div class="group_title mb-4 d-md-block d-none font-secondary fw-500">
                            <div class="row">
                                <div class="col-md-10">
                                    <div class="row">
                                        <div class="col-md-7">
                                            <div class="label label-product">Product</div>
                                        </div>
                                        <div class="col-md-5 d-flex">
                                            <div class="label label-price">Price</div>
                                            <div class="label label-qty ms-auto">Qty</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2">
                                    <div class="label label-total">Total</div>
                                </div>
                            </div>
                        </div>
                        <ul class="cart-items">
                            @php
                                $cart_total_price = 0;
                            @endphp
                            @if (is_null($cart) || count($cart) == 0)
                                <h4 class="my-5 text-uppercase">No products in the cart</h4>
                            @else
                                @foreach ($cart as $key => $item)
                                    @php
                                        $cart_total_price += $item['price'] * $item['qty'];
                                    @endphp
                                    <li class="cart-item" id="page_cart_item_{{ $key }}">
                                        <div class="product-line-grid row g-2">
                                            <div class="product-line-grid-left col-md-10">
                                                <div class="row">
                                                    <div class="col-md-7 d-flex align-items-center">
                                                        <span class="product-image media-middle">
                                                            <img class="img-fluid" src="{{ asset($item['image']) }}"
                                                                alt="{{ $item['name'] }}">
                                                        </span>
                                                        <div class="product-line-info ps-3">
                                                            <a class="label"
                                                                href="{{ Route('frontend.single-product', $item['slug']) }}">{{ $item['name'] }}</a>
                                                            @foreach ($item['attribute'] as $key => $attribute)
                                                                <div class="product-line-info variant pt-2">
                                                                    <span class="label-atrr">{{ $key }}:</span>
                                                                    <span class="value">{{ $attribute }}</span>
                                                                </div>
                                                            @endforeach
                                                        </div>
                                                    </div>
                                                    <div class="col-md-5 d-flex align-items-center">
                                                        <div class="product-line-info product-price">
                                                            <span class="title_price d-md-none">Price</span>
                                                            <span class="value">৳ {{ $item['price'] }}</span>
                                                        </div>
                                                        <div class="qty ms-auto">
                                                            <div class="input-group qty-wrapper">
                                                                <input type="text" name="qty"
                                                                    value="{{ $item['qty'] }}"
                                                                    class="input-group form-control quantity_wanted"
                                                                    min="1">
                                                                <span class="input-group-btn-vertical">
                                                                    <button class="btn btn-touchspin qty-plus"
                                                                        type="button">
                                                                        <i class="fal fa-plus"></i></button>
                                                                    <button
                                                                        class="btn btn-touchspin qty-minus bootstrap-touchspin-down"
                                                                        type="button"><i class="fal fa-minus"></i></button>
                                                                </span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="col-md-2 d-flex align-items-center">
                                                <div class="price">
                                                    <div class="product-price total">
                                                        ৳ {{ $item['price'] * $item['qty'] }}</div>
                                                </div>
                                                <div class="remove ms-auto">
                                                    <div class="cart-line-product-actions ">
                                                        <a class="remove-from-cart cart_item_remove"
                                                            data-id="{{ $key }}" rel="nofollow" href="#">
                                                            <i class="fal fa-trash-alt" aria-hidden="true"></i>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                @endforeach
                            @endif
                        </ul>
                        <div class="mb-3">
                            <a class="label btn continue_shopping" href="{{ Route('frontend.home') }}">
                                Continue shopping
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="cart-summary">
                        <div class="cart-detailed-totals">
                            <div class="cart-summary-products">
                                <div class="summary-label">There are
                                    {{ !is_null($cart) > 0 ? count($cart) : '0' }} items in your cart</div>
                            </div>
                            <div class="group-price">
                                <div class="cart-summary-line" id="cart-subtotal-products">
                                    <span class="label js-subtotal">
                                        Total products:
                                    </span>
                                    <span class="value">৳ <span
                                            class="total_cart_price">{{ number_format($cart_total_price, 2) }}</span></span>
                                </div>
                                <div class="cart-summary-line" id="cart-subtotal-shipping">
                                    <span class="label">
                                        Total Shipping:
                                    </span>
                                    <span class="value">৳ 0.00</span>
                                </div>
                                <div class="cart-summary-line">
                                    <span class="label">Taxes:</span>
                                    <span class="value">৳ 0.00</span>
                                </div>
                            </div>
                            <div class="cart-summary-line cart-total has_border">
                                <div class="d-flex">
                                    <span>
                                        <span class="label">Total</span>
                                        <span class="font-small">(tax excl.)</span>
                                    </span>
                                    <span class="value ms-auto label">৳ {{ number_format($cart_total_price, 2) }}</span>
                                </div>
                            </div>
                        </div>
                        <div class="checkout cart-detailed-actions">
                            <div class="text-xs-center">
                                <a href="{{ Route('customer.checkout') }}" class="btn btn-primary">Checkout</a>
                            </div>
                        </div>
                    </div>
                    <div class="block-reassurance">
                        <div class="block-reassurance-item d-flex align-items-center">
                            <div>
                                <img src="{{ asset('frontend/assets/images/icons/reassurance-1-1.jpg') }}"
                                    alt="Delivery policy - Edit with Customer reassurance module">
                            </div>
                            <div class="text">Delivery policy - Edit with Customer reassurance module</div>
                        </div>
                        <div class="block-reassurance-item d-flex align-items-center">
                            <div>
                                <img src="{{ asset('frontend/assets/images/icons/reassurance-2-1.jpg') }}"
                                    alt="Security Policy - Edit with Customer reassurance module">
                            </div>
                            <div class="text">Security Policy - Edit with Customer reassurance module</div>
                        </div>
                        <div class="block-reassurance-item d-flex align-items-center">
                            <div>
                                <img src="{{ asset('frontend/assets/images/icons/reassurance-3-1.jpg') }}"
                                    alt="Return Policy - Edit with Customer reassurance module">
                            </div>
                            <div class="text">Return Policy - Edit with Customer reassurance module</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Cart Section -->
@endsection
