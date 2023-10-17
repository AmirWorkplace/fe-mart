<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{ !is_null($setting) ? $setting->title : '' }}</title>
    <link rel="shortcut icon"
        href="{{ !is_null($setting) && file_exists($setting->favicon) ? asset($setting->favicon) : asset('frontend/assets/images/logo/favicon.png') }}"
        type="image/x-icon">

    <!-- Font -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700&display=swap" rel="stylesheet">
    <!-- Font -->

    @include('layouts.frontend.partial.styles')
    <!-- End Css Links -->
    @include('layouts.admin.partial.alert')
</head>

<body class="{{ Route::is('frontend.home') ? 'home' : '' }}">
    <div id="main-site">
        @include('layouts.frontend.partial.header')
        @yield('content')
        @include('layouts.frontend.partial.footer')
        @include('layouts.frontend.partial.quick_view')
    </div>
    @include('layouts.frontend.partial.components')
    @include('layouts.frontend.partial.scripts')
    @include('sweetalert::alert')
    <script type="text/javascript">
        $.ajaxSetup({
            headers: {
                'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
            }
        });
    </script>

    <script type="text/javascript">
        $(document).ready(function() {
            $(document).on('click', '.quick-view', function(e) {
                e.preventDefault();
                let product_id = $(this).data('id');
                console.log(product_id);
                let url = "{{ Route('frontend.quick-view') }}";
                $.ajax({
                    url: url,
                    type: "POST",
                    data: {
                        _method: 'GET',
                        product_id: product_id,
                    },
                    success: (response) => {
                        if (response.status == 'success') {
                            $('#item_wrapper').html(response.html);
                            $('#quickViewModal').modal('show');
                        }
                    }
                });
            });

            $(document).on('click', '.add-to-cart', function(e) {
                e.preventDefault();
                let url = "{{ Route('customer.add-cart') }}";
                $.ajax({
                    url: url,
                    type: "POST",
                    data: $('#option-choice-form').serializeArray(),
                    success: (response) => {
                        if (response.status == 'success') {
                            $('#no_items').remove();
                            var appendItem = '<li class="cart_item" id="cart_item_' + response
                                .data.variant_id + '">' +
                                '<div class="cart_item_media">' +
                                '<div class="cart_item_image">' +
                                '<img src="' + window.location.origin + '/' + response.data
                                .image + '" alt="' + response.data.name + '"' +
                                'title="' + response.data.name + '">' +
                                '<a href="#" class="cart_item_remove remove_item" rel="nofollow"' +
                                'title="remove from cart" data-id="' + response.data
                                .variant_id + '">' +
                                '<i class="far fa-trash-alt"></i>' +
                                '</a>' +
                                '</div>' +
                                '<div class="cart_item_body">' +
                                '<div class="cart_item_name">' +
                                '<a' +
                                'href="' + response.data.product_url + '">' + response.data
                                .name + '</a>' +
                                '</div>' +
                                '<div>' +
                                '<span' +
                                'class="cart_item_price">৳' + response.data.price + '</span>' +
                                '<span class="cart_item_quantity"> x' +
                                '<span id="item_qty_' + response.data.variant_id +
                                '">' + response.data.qty + '</span></span>' +
                                '</div>' +
                                '<div class="d-flex gap-2">' +
                                '<span class="flex-shrink-0 d-flex gap-1">';
                            $.each(response.data.attribute, function(key, value) {
                                appendItem += '<span>' + key + ' : </span>' + '<span>' +
                                    value + '</span>';
                            });
                            appendItem += '</span>' +
                                '</div>'
                            '</div>' +
                            '</div>' +
                            '</li>';
                            $('#cart_items').append(appendItem);
                            $('.cart_count').html(response.total_cart_items);
                            $('.total_cart_price').html(response.total_cart_price);
                            $('#cart-footer-area').show();
                            Swal.fire({
                                width: "22rem",
                                text: 'Product Added into Cart Successfully!',
                                icon: "success",
                                toast: true,
                                position: 'top-end',
                                showConfirmButton: false,
                                timer: 1500
                            });
                        }
                        if (response.status == 'quantity_updated') {
                            $('#item_qty_' + response.variant_id).text(response.qty);
                            $('.total_cart_price').html(response.total_cart_price);
                            Swal.fire({
                                width: "22rem",
                                text: 'Quantity Updated!',
                                icon: "success",
                                toast: true,
                                position: 'top-end',
                                showConfirmButton: false,
                                timer: 1500
                            });
                        }
                        if (response.status == 'error') {
                            Swal.fire({
                                width: "22rem",
                                text: response.data,
                                icon: "error",
                                toast: true,
                                position: 'top-end',
                                showConfirmButton: false,
                                timer: 1500
                            });
                        }
                    }
                });
            });

            $(document).on('click', '.cart_item_remove', function(e) {
                e.preventDefault();
                let id = $(this).data('id');

                let url = "{{ Route('customer.remove-cart') }}";
                $.ajax({
                    url: url,
                    data: {
                        _method: 'GET',
                        id: id,
                    },
                    success: (response) => {
                        if (response.status == 'success') {
                            Swal.fire({
                                width: "22rem",
                                text: 'Removed Successfully!',
                                icon: "success",
                                toast: true,
                                position: 'top-end',
                                showConfirmButton: false,
                                timer: 1500
                            });
                            $('#cart_item_' + id).remove();
                            $('#page_cart_item_' + id).remove();
                            $('.cart_count').text(response.total_cart_items);
                            $('.total_cart_price').html(response.total_cart_price);
                            if (response.total_cart_items == 0) {
                                $('#cart-footer-area').hide();
                                $('#cart_items').html('');
                                $('.cart_count').text('0');
                                $('#cart_items').append(
                                    '<li class="no-items" id="no_items">No products in the cart</li>'
                                );
                            }
                        }
                    }
                });
            });

            $('#option-choice-form input, #option-choice-form select').on('change', function() {
                getVariantPrice();
            });

            function getVariantPrice() {
                if ($('#option-choice-form input[name=quantity]').val() > 0 && checkAddToCartValidity()) {
                    $.ajax({
                        type: "POST",
                        url: "{{ route('frontend.product.variant-price') }}",
                        data: $('#option-choice-form').serializeArray(),
                        success: function(data) {
                            var qty_val = $('#quantity_wanted').val();
                            if (parseInt(qty_val) > parseInt(data.quantity)) {
                                if (parseInt(data.quantity) == 0) {
                                    $('#quantity_wanted').val(1);
                                } else {
                                    $('#quantity_wanted').val(parseInt(data.quantity));
                                }
                            }

                            $('.current-price span').html('৳' + data.price);
                            $('#available-quantity').html(data.quantity);
                            if (data.max_limit == 0) {
                                var max = 1;
                            } else {
                                var max = data.max_limit;
                            }
                            $('.input-number').prop('max', max);
                            if (parseInt(data.in_stock) == 0) {
                                $('.add-to-cart').attr('disabled', true);
                                $('.out-of-stock').removeClass('d-none');
                                $('.in-stock').addClass('d-none');
                            } else {
                                $('.out-of-stock').addClass('d-none');
                                $('.in-stock').removeClass('d-none');
                                $('.add-to-cart').attr('disabled', false);
                            }
                            $('#variant_id').val(data.variant_id);
                            $('#product_sku').html(data.sku);
                        }
                    });
                }
            }

            function checkAddToCartValidity() {
                var names = {};
                $('#option-choice-form select').each(function() {
                    // find unique names
                    names[$(this).attr('name')] = true;
                });

                var count = 0;
                $.each(names, function() {
                    // then count them
                    count++;
                });

                if ($('#option-choice-form select option:selected').length == count) {
                    return true;
                }

                return false;
            }

            $(document).on('click', '.qty-plus', () => {
                var max = $('#quantity_wanted').attr('max');
                let getInput = $('#quantity_wanted').val();
                if (parseInt(getInput) < parseInt(max)) {
                    getInput++;
                    $('#quantity_wanted').val(getInput);
                    getVariantPrice();
                }
            });
            $(document).on('click', '.qty-minus', () => {
                let getInput = $('#quantity_wanted').val();
                getInput--;
                if (getInput == 0) {
                    return;
                }
                $('#quantity_wanted').val(getInput);
                getVariantPrice();
            });

            $(document).on('click', '.addToWishlist', function(e) {
                e.preventDefault();
                let id = $(this).data('id');

                let url = "{{ Route('customer.wishlist') }}";
                $.ajax({
                    url: url,
                    data: {
                        _method: 'GET',
                        id: id,
                    },
                    success: (response) => {
                        if (response.status == 'success') {
                            Swal.fire({
                                width: "22rem",
                                text: 'Added Successfully!',
                                icon: "success",
                                toast: true,
                                position: 'top-end',
                                showConfirmButton: false,
                                timer: 1500
                            });
                        }
                        if (response.status == 'error') {
                            Swal.fire({
                                width: "22rem",
                                text: 'Already Added this Product!',
                                icon: "error",
                                toast: true,
                                position: 'top-end',
                                showConfirmButton: false,
                                timer: 1500
                            });
                        }
                    }
                });
            });

        });
    </script>
    @stack('js')
</body>

</html>
