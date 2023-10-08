@extends('layouts.frontend.app')
@section('content')
    @include('layouts.frontend.partial.breadcrumb', [
        'title' => 'Checkout',
        'link' => '',
    ])
    <section class="py-md-5 py-4 bg-white">
        <div class="container">
            <div class="row g-4">
                <div class="col-md-8">
                    <form action="{{ Route('customer.checkout') }}" method="POST">
                        @csrf
                        <div class="accordion checkout-accordion" id="accordionExample">
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="headingTwo">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                        data-bs-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
                                        <h3 class="step-title h3">
                                            <span class="step-number">1</span>
                                            <span class="title">Addresses</span>
                                        </h3>
                                        <span class="step-edit"><i class="material-icons edit">mode_edit</i> edit</span>
                                    </button>
                                </h2>
                                <div id="collapseTwo" class="accordion-collapse collapse show" aria-labelledby="headingTwo"
                                    data-bs-parent="#accordionExample">
                                    <div class="accordion-body">
                                        <div class="content">
                                            <div class="d-flex gap-4 mb-3">
                                                <input type="hidden" name="shipping_address_id"
                                                    value="{{ $shipping_address ? $shipping_address->id : '' }}">
                                                <div class="flex-shrink-0 form-check">
                                                    <input class="form-check-input" type="radio" id="home"
                                                        name="address_type"
                                                        {{ ($shipping_address && $shipping_address->address_type == 'home') || is_null($shipping_address) ? 'checked' : '' }}
                                                        value="home">
                                                    <label class="form-check-label" for="home">
                                                        Home
                                                    </label>
                                                </div>
                                                <div class="flex-shrink-0 form-check">
                                                    <input class="form-check-input" type="radio" id="office"
                                                        {{ $shipping_address && $shipping_address->address_type == 'office' ? 'checked' : '' }}
                                                        name="address_type" value="office">
                                                    <label class="form-check-label" for="office">
                                                        Office
                                                    </label>
                                                </div>
                                            </div>
                                            <div class="row g-3 mb-4 address">
                                                <div class="col-12">
                                                    <div class="row g-2 align-items-center">
                                                        <label class="col-md-2 form-control-label required"
                                                            for="name">Full
                                                            Name</label>
                                                        <div class="col-md-8">
                                                            <input type="text" id="name" name="name"
                                                                placeholder="Full Name" class="form-control"
                                                                value="{{ $shipping_address ? $shipping_address->name : old('name') }}"
                                                                required>
                                                        </div>
                                                        <div class="col-md-2 label">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-12">
                                                    <div class="row g-2 align-items-center">
                                                        <label class="col-md-2 form-control-label required"
                                                            for="phone">Phone
                                                            Number</label>
                                                        <div class="col-md-8">
                                                            <input type="number" id="phone" name="phone"
                                                                placeholder="Phone Number" class="form-control"
                                                                value="{{ $shipping_address ? $shipping_address->phone : old('phone') }}"
                                                                required>
                                                        </div>
                                                        <div class="col-md-2 label">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-12">
                                                    <div class="row g-2 align-items-center">
                                                        <label class="col-md-2 form-control-label" for="email">Email
                                                            Address</label>
                                                        <div class="col-md-8">
                                                            <input type="email" id="email" name="email"
                                                                placeholder="Email Address" class="form-control"
                                                                value="{{ $shipping_address ? $shipping_address->email : old('email') }}">
                                                        </div>
                                                        <div class="col-md-2 label">
                                                            Optional
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-12">
                                                    <div class="row g-2 align-items-center">
                                                        <label class="col-md-2 form-control-label required" required
                                                            for="division">Division</label>
                                                        <div class="col-md-8">
                                                            <select name="division" id="division"
                                                                class="form-select select2">
                                                                <option value="">-- Select Division --</option>
                                                                @foreach ($divisions as $division)
                                                                    <option value="{{ $division->id }}"
                                                                        {{ $shipping_address && $shipping_address->division_id == $division->id ? 'selected' : '' }}>
                                                                        {{ $division->name }}</option>
                                                                @endforeach
                                                            </select>
                                                        </div>
                                                        <div class="col-md-2 label">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-12">
                                                    <div class="row g-2 align-items-center">
                                                        <label class="col-md-2 form-control-label required" required
                                                            for="district">District </label>
                                                        <div class="col-md-8">
                                                            <select name="district" id="district"
                                                                class="form-select select2">
                                                                @if ($selected_district)
                                                                    <option value="{{ $selected_district->id }}" selected>
                                                                        {{ $selected_district->name }}</option>
                                                                @else
                                                                    <option value="">-- Select District --</option>
                                                                @endif
                                                            </select>
                                                        </div>
                                                        <div class="col-md-2 label">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-12">
                                                    <div class="row g-2 align-items-center">
                                                        <label class="col-md-2 form-control-label required"
                                                            for="upozila">Upozila </label>
                                                        <div class="col-md-8">
                                                            <select name="upozila" id="upozila" required
                                                                class="form-select select2">
                                                                @if ($selected_upozila)
                                                                    <option value="{{ $selected_upozila->id }}" selected>
                                                                        {{ $selected_upozila->name }}</option>
                                                                @else
                                                                    <option value="">-- Select Upozila --</option>
                                                                @endif
                                                            </select>
                                                        </div>
                                                        <div class="col-md-2 label">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-12">
                                                    <div class="row g-2 align-items-center">
                                                        <label class="col-md-2 form-control-label required"
                                                            for="street">Street </label>
                                                        <div class="col-md-8">
                                                            <textarea name="street" id="street" class="form-control" cols="30" rows="3" required
                                                                placeholder="Street Address">{{ $shipping_address ? $shipping_address->street : '' }}</textarea>
                                                        </div>
                                                        <div class="col-md-2 label">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="accordion-item">
                                <h2 class="accordion-header" id="headingThree">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse"
                                        data-bs-target="#collapseThree" aria-expanded="false"
                                        aria-controls="collapseThree">
                                        <h3 class="step-title h3">
                                            <span class="step-number">2</span>
                                            <span class="title">Payment</span>
                                        </h3>
                                        <span class="step-edit"><i class="material-icons edit">mode_edit</i> edit</span>
                                    </button>
                                </h2>
                                <div id="collapseThree" class="accordion-collapse collapse"
                                    aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                                    <div class="accordion-body">
                                        <div class="content">
                                            <ul class="payment-methods mb-4">
                                                <li>
                                                    <div class="pay-wrapper">
                                                        <input id="cash" type="radio" name="payment_method"
                                                            class="payment_method" value="cash" checked>
                                                        <span>Cash on Delivery</span>
                                                        <label class="pay_label" for="cash"></label>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="pay-wrapper">
                                                        <ul class="d-flex flex-wrap gap-1">
                                                            <li><img src="https://tecnotrendsbd.com/frontend/images/payments/1.png"
                                                                    alt="Icon" height="30">
                                                            </li>
                                                            <li><img src="https://tecnotrendsbd.com/frontend/images/payments/2.png"
                                                                    alt="Icon" height="30">
                                                            </li>
                                                            <li><img src="https://tecnotrendsbd.com/frontend/images/payments/3.png"
                                                                    alt="Icon" height="30">
                                                            </li>
                                                            <li><img src="https://tecnotrendsbd.com/frontend/images/payments/4.png"
                                                                    alt="Icon" height="30">
                                                            </li>
                                                        </ul>
                                                        <input id="card" type="radio" name="payment_method"
                                                            class="payment_method" value="card">
                                                        <label class="pay_label" for="card"></label>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="pay-wrapper">
                                                        <ul class="d-flex flex-wrap gap-1">
                                                            <li><img src="https://tecnotrendsbd.com/frontend/images/payments/bkash.png"
                                                                    height="40" alt="Logo">
                                                            </li>
                                                        </ul>
                                                        <input id="bkash" type="radio" name="payment_method"
                                                            class="payment_method" value="bkash">
                                                        <label class="pay_label" for="bkash"></label>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="pay-wrapper">
                                                        <ul class="d-flex flex-wrap gap-1">
                                                            <li><img src="https://tecnotrendsbd.com/frontend/images/payments/nagad.png"
                                                                    height="40" alt="Logo">
                                                            </li>
                                                        </ul>
                                                        <input id="nagad" type="radio" name="payment_method"
                                                            class="payment_method" value="nagad">
                                                        <label class="pay_label" for="nagad"></label>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="pay-wrapper">
                                                        <ul class="d-flex flex-wrap gap-1">
                                                            <li><img src="https://tecnotrendsbd.com/frontend/images/payments/rocket.png"
                                                                    height="40" alt="Logo">
                                                            </li>
                                                        </ul>
                                                        <input id="rocket" type="radio" name="payment_method"
                                                            class="payment_method" value="rocket">
                                                        <label class="pay_label" for="rocket"></label>
                                                    </div>
                                                </li>
                                            </ul>
                                            <h4 class="h6 text-danger text-uppercase fw-bold mb-3">Please check your order
                                                before payment</h4>
                                            <div class="text-muted fw-bold text-uppercase">Order items</div>
                                            <div class="order-confirmation-table mb-4">
                                                <ul class="cart-items">
                                                    {{ info($cart) }}
                                                    @if (!is_null($cart) && count($cart) > 0)
                                                        @foreach ($cart as $key => $item)
                                                            <li class="cart-item"
                                                                id="page_cart_item_{{ $key }}">
                                                                <div class="product-line-grid row g-2 align-items-center">
                                                                    <div class="product-line-grid-left col-md-10">
                                                                        <div class="row">
                                                                            <div
                                                                                class="col-md-7 d-flex align-items-center">
                                                                                <span class="product-image media-middle">
                                                                                    <img class="img-fluid"
                                                                                        src="{{ asset($item['image']) }}"
                                                                                        alt="{{ $item['name'] }}">
                                                                                </span>
                                                                                <div class="product-line-info ps-3">
                                                                                    <a class="label"
                                                                                        href="{{ Route('frontend.single-product', $item['slug']) }}">{{ $item['name'] }}</a>
                                                                                    <div
                                                                                        class="d-flex gap-2 text-muted align-items-center pt-2">
                                                                                        @foreach ($item['attribute'] as $key => $attribute)
                                                                                            {{ $loop->iteration > 1 ? ' | ' : '' }}
                                                                                            <div
                                                                                                class="product-line-info variant">
                                                                                                <span
                                                                                                    class="label-atrr">{{ $key }}:</span>
                                                                                                <span
                                                                                                    class="value">{{ $attribute }}</span>
                                                                                            </div>
                                                                                        @endforeach
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                            <div
                                                                                class="col-md-5 d-flex align-items-center">
                                                                                <div
                                                                                    class="product-line-info product-price">
                                                                                    <span
                                                                                        class="title_price d-md-none">Price</span>
                                                                                    <span class="value">৳
                                                                                        {{ $item['price'] }}</span>
                                                                                </div>
                                                                                <div class="qty mx-auto">
                                                                                    <div class="text-muted"> x
                                                                                        {{ $item['qty'] }}</div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="col-md-2">
                                                                        <div class="price">
                                                                            <div
                                                                                class="product-price total text-muted text-end">
                                                                                ৳ {{ $item['price'] * $item['qty'] }}</div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </li>
                                                        @endforeach
                                                    @endif
                                                </ul>
                                            </div>
                                            <div class="form-check mb-3">
                                                <input id="terms_conditions" class="form-check-input"
                                                    name="terms_conditions" required type="checkbox" value="1">
                                                <label class="form-check-label" for="terms_conditions"> I agree to the <a
                                                        class="text-primary" href="#">terms of
                                                        service</a> and will adhere to
                                                    them unconditionally.
                                                </label>
                                            </div>
                                            <button type="submit" class="btn btn-dark btn-checkout px-5">Check
                                                out</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-md-4">
                    <div class="cart-summary">
                        <div class="cart-detailed-totals">
                            @php
                                $cart_total_price = 0;
                            @endphp
                            @if (is_null($cart) || count($cart) == 0)
                                <h4 class="mb-4 mt-3 text-uppercase px-4">No products in the cart</h4>
                            @else
                                <div class="cart-summary-products">
                                    <div class="summary-label">There are
                                        {{ !is_null($cart) || count($cart) > 0 ? count($cart) : '0' }} items in your cart
                                    </div>
                                    @foreach ($cart as $key => $item)
                                        @php
                                            $cart_total_price += $item['price'] * $item['qty'];
                                        @endphp
                                        <div class="pt-3" id="cart-summary-product-list">
                                            <ul class="media-list">
                                                <li class="media">
                                                    <div class="media-left d-flex">
                                                        <a href="{{ Route('frontend.single-product', $item['slug']) }}"
                                                            title="{{ $item['name'] }}">
                                                            <img class="media-object" src="{{ asset($item['image']) }}"
                                                                alt="{{ $item['name'] }}">
                                                        </a>
                                                    </div>
                                                    <div class="media-body d-lg-flex justify-content-between">
                                                        <div class="product-name">
                                                            <a
                                                                href="{{ Route('frontend.single-product', $item['slug']) }}">{{ $item['name'] }}</a>
                                                            <div class="pt-1 d-flex gap-1 flex-wrap">
                                                                @foreach ($item['attribute'] as $key => $attribute)
                                                                    @if ($loop->iteration != 1)
                                                                        ,
                                                                    @endif
                                                                    <span>{{ $key }} : </span>
                                                                    <span>{{ $attribute }}</span>
                                                                @endforeach
                                                            </div>
                                                        </div>
                                                        <div>
                                                            <div class="product-price pull-xs-right">{{ $item['price'] }}
                                                            </div>
                                                            <div class="product-quantity">x{{ $item['qty'] }}</div>

                                                        </div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                    @endforeach
                                </div>
                            @endif
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
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection

@push('js')
    <script type="text/javascript">
        $(document).ready(function() {
            $(document).on('change', '#division', function(e) {
                let id = $(this).val();
                let url = "{{ Route('customer.checkout') }}";
                $.ajax({
                    url: url,
                    data: {
                        _method: 'GET',
                        id: id,
                    },
                    success: (response) => {
                        if (response.status == 'success') {
                            var selected_district =
                                "{{ $shipping_address ? $shipping_address->district_id : '' }}";
                            $('#district').html('');
                            $('#upozila').html('');
                            $('#upozila').append(
                                '<option value="" selected>-- Select Upozila --</option>');
                            $('#district').append(
                                '<option value="" selected>-- Select District --</option>');
                            $.each(response.locations, function(key, value) {
                                var option = '<option value="' + value.id + '"';
                                if (selected_district != '' && selected_district ==
                                    value.id) {
                                    option += ' selected';
                                }
                                option += '>' + value.name + '</option>';
                                $('#district').append(option);
                            });
                        }
                    }
                });
            });

            $(document).on('change', '#district', function(e) {
                let id = $(this).val();
                let url = "{{ Route('customer.checkout') }}";
                $.ajax({
                    url: url,
                    data: {
                        _method: 'GET',
                        id: id,
                    },
                    success: (response) => {
                        if (response.status == 'success') {
                            var selected_upozila =
                                "{{ $shipping_address ? $shipping_address->upozila_id : '' }}";
                            $('#upozila').html('');
                            $('#upozila').append(
                                '<option value="" selected>-- Select Upozila --</option>');
                            $.each(response.locations, function(key, value) {
                                var option = '<option value="' + value.id + '"';
                                if (selected_upozila != '' && selected_upozila ==
                                    value.id) {
                                    option += ' selected';
                                }
                                option += '>' + value.name + '</option>';
                                $('#upozila').append(option);
                            });
                        }
                    }
                });
            });
        });
    </script>
@endpush
