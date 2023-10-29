@php
    $user = App\Helper\AdditionalDataResource::getReseller();
    $products = App\Helper\AdditionalDataResource::getProductLists();
    $customers = App\Helper\AdditionalDataResource::getCustomerOfReseller();

    $shop_name = isset($user->reseller->shop_name) ? $user->reseller->shop_name : $user->name;
@endphp


@extends('layouts.admin.app')

@section('content')
    <!-- Custom Styles -->
    <style>
        
    </style>

    <div class="row g-3">
        <div class="col-12">
            <form action="{{ route('admin.order-place.update', $data->id) }}" method="POST" enctype="multipart/form-data" id="order-place">
                @csrf
                <div class="card">
                    <div class="card-header px-3 py-2">
                        <div class="d-flex justify-content-between align-items-center">
                            <h6 class="h6 mb-0 text-uppercase">Order Place</h6>
                            <a href="{{ Route('admin.order-place.index') }}" class="btn btn-primary btn-sm text-uppercase">
                                Go Back
                            </a>
                        </div>
                    </div>
                    <div class="card-body p-4">
                        <div class="row g-3"> 

                             <!-- Customer Selection -->
                            <div class="col-md-4 col-sm-6">
                                <label for="shop_name" class="form-label require">
                                    <b>Seller Shop</b>  
                                </label>
                                <input type="text" value="{{ $shop_name }}" class="form-control custom-input" id="shop_name" name="shop_name" disabled>
                            </div> 

                             <!-- Order Type -->
                            <div class="col-md-4 col-sm-6">
                                <label for="order_type" class="form-label require">
                                    <b>Order Type </b>  
                                </label>
                                <select name="order_type" id="order_type"
                                    class="form-control select" data-placeholder="Order Type">
                                    <option value="self" {{ $data->sales_type == 'self' ? 'selected' : '' }}>Self</option>
                                    <option value="business" {{ $data->sales_type == 'business' ? 'selected' : '' }}>Business</option>
                                </select>
                            </div>

                             <!-- Sales Type -->
                             <div class="col-md-4 col-sm-6">
                                <label for="sales_type" class="form-label require">
                                    <b>Sales Type </b>  
                                </label>
                                <select name="sales_type" id="sales_type"
                                    class="form-control select" data-placeholder="{{ __('Sales Type') }}" required> 
                                    <option value="cod" {{ $data->payment_method == 'cod' ? 'selected' : '' }}>Cash On Delivery</option>
                                        <option value="prepaid" {{ $data->payment_method == 'prepaid' ? 'selected' : '' }}>Prepaid</option>
                                </select>
                            </div>

                            <!-- Customer Selection -->
                            <div class="col-md-4 col-sm-6">
                                <label for="select_customer" class="form-label require">
                                    <b>Customer Name </b> <span class="text-sm px-1 text-danger"> </span>
                                </label>
                                <select name="select_customer" id="select_customer"
                                    class="form-control select" data-placeholder="Customer Name" required>
                                    @foreach ($customers as $customer)
                                        <option value="{{ $customer }}" {{ $data->customer_id == $customer->id ? 'selected' : '' }}>{{ $customer->name }}</option>
                                    @endforeach
                                </select>
                            </div>

                            <!-- Product Selection -->
                            <div class="col-md-4 col-sm-6">
                                <label for="select_product" class="form-label require">
                                    <b>Product Name </b> <span class="text-sm px-1 text-danger"> </span>
                                </label>
                                <select name="select_product" id="select_product"
                                    class="form-control select" data-placeholder="Product Name">
                                    <option value=""></option>
                                    @foreach ($products as $product)
                                        <option value="{{ json_encode([
                                                "thumbnail"=> asset($product->thumbnail),
                                                "name"=> $product->name,
                                                "code"=> $product->code,
                                                "max_order"=> $product->max_order,
                                                "min_order"=> $product->min_order,
                                                "price"=> $product->price
                                            ]) }}">
                                            {{ $product->name }} - <b>#{{ $product->code }}</b>  
                                        </option>
                                    @endforeach
                                </select>
                            </div>

                            <!-- Shipping Address Charge -->
                            <div class="col-md-4 col-sm-6">
                                <label for="shipping_charge" class="form-label require">
                                    <b>Shipping Charge</b>
                                </label>
                                <input type="number" value="{{ $data->shipping_charge }}" class="form-control custom-input" id="shipping_charge" name="shipping_charge">
                            </div>

                            <!-- Product Price DISABLED -->
                            <div class="col-md-3 col-sm-6">
                                <label for="default_price" class="form-label require">
                                    <b>Default Price</b>
                                </label>
                                <input type="number" value="0" class="form-control custom-input" id="default_price" name="default_price" disabled>
                            </div>

                            <!-- Product Price DISABLED -->
                            <div class="col-md-3 col-sm-4">
                                <label for="reseller_price" class="form-label require">
                                    <b>Reseller Price</b>
                                </label>
                                <input type="number" value="0" class="form-control custom-input" id="reseller_price" name="reseller_price" disabled>
                            </div>

                            <!-- Product Price DISABLED -->
                            <div class="col-md-2 col-sm-3">
                                <label for="invoice_rate" class="form-label require">
                                    <b>Invoice Rate</b>
                                </label>
                                <input type="number" value="0" class="form-control custom-input" id="invoice_rate" name="invoice_rate">
                            </div>

                            <!-- Product Total Quantity -->
                            <div class="col-md-2 col-sm-3">
                                <label for="total_quantities" class="form-label require">
                                    <b>Qty</b>
                                </label>
                                <input type="number" value="1" class="form-control custom-input" id="total_quantities" name="total_quantities">
                            </div> 

                            <div class="col-md-2 col-sm-3 d-flex align-items-end justify-content-center">
                                <button class="btn btn-success px-3 form-control" id="listing"> 
                                    <i class="fas fa-level-down"></i>
                                    <span>Listing</span>
                                </button>
                            </div>

                            <input type="hidden" name="discount" id="discount" value="{{ $data->discount }}">
                            <input type="hidden" name="main_total_price" id="main_total_price" value="{{ $data->subtotal }}">
                        </div>

                        <!-- Table for listing -->
                        <div class="mt-3">
                            <table class="table table-bordered align-middle text-center" style="width:100%">
                                <thead class="bg-success p-2">
                                    <tr class="text-nowrap text-white">
                                        <th>Picture</th>
                                        <th>Product Name</th>
                                        <th>Product Code</th>
                                        <th>Rate</th>
                                        <th>Qty</th>
                                        <th>Total Amount</th>
                                        <th width="110">Actions</th>
                                    </tr>
                                </thead>
                                <tbody id="product-listing-tbody"></tbody>
                                <tfoot>
                                    <tr>
                                        <th>Product Items</th>
                                        <th>Subtotal</th>
                                        <th></th>
                                        <th class="hidden" id="subtotal-default-amount">0</th>
                                        <th id="subtotal-quantities">0</th>
                                        <th id="subtotal-amount">0</th>
                                        <th></th>
                                    </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                    <div class="card-footer text-end px-3 py-2">
                        <button type="submit" class="btn btn-primary btn-sm">Save</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

@endsection

@push('js')
    <script>
        $(document).ready(function(){
            let ids = [];
            let debouncingState = true;
            // Initiate total quantity and subtotal amount
            let amount = 0, qty = 0, rate = 0, productRate = 0;
            // Initiate customer and product data object.
            let customerData = {}, productData = {};

            // public path
            const publicPath = window.location.href.split("reseller/")[0];

            // form submission
            $("#order-place").submit(function(event){
                event.preventDefault();

                const customer = JSON.parse($("#select_customer").val());
                const reseller_id = customer.reseller_id;

                let products = [];

                $('.product-list-item').each(function(index){
                    products.push(JSON.parse($($('.product-list-item')[index]).attr('product-list-item-data')));
                });

                const pdtData = products.reduce(function(accumulator, current){
                    accumulator.price_ids = [...accumulator.price_ids, current.price_id];
                    accumulator.product_ids = [...accumulator.product_ids, current.product_id];

                    return accumulator;
                }, { product_ids: [], price_ids: [] });

                const accountingData = { customer_id: customer.id, reseller_id, sub_total: amount, qty, product_ids: JSON.stringify(pdtData.product_ids), price_ids: JSON.stringify(pdtData.price_ids), total:rate /* , order_type: $('#order_type').val(), sales_type: $('#sales_type').val(), shipping_charge: $('#shipping_charge').val() */ };

                const formDataArray = $(this).serializeArray(); 

                const formData = formDataArray.reduce(function(accumulator, current){
                    accumulator[current.name] = current.value;
                    return accumulator
                })

                const data = { ...accountingData, ...formData };


                $.ajax({
                    url: "{{ route('admin.order-place.update', $data->id) }}",
                    method: 'PUT',
                    data,

                    success: function(data){
                        $('[type="submit"]').removeAttr("disabled");

                        if(data.status){
                            window.location.href = "{{ route('admin.order-place.index') }}";
                        }else{
                            console.log(data);
                        }
                    },

                    error: function(error){
                        $('[type="submit"]').removeAttr("disabled");
                        throw new Error(`There are a major error occurred: ${error.message}`);
                    }
                });

                $('[type="submit"]').attr("disabled", debouncingState);
            });

            function productList({id, resale_rate, product_id, image, name, code, quantities, prices, main_rate }) {
                const tagId = `product-list-item--${product_id}`;

                if(ids.includes(tagId)){
                    $(`#${tagId}`).remove();
                }else{
                    ids.push(tagId)
                }

                const pdtItemData = JSON.stringify({product_id, price: prices, qty: quantities, price_id: id });

                return `
                    <tr id=${tagId} class="product-list-item" product-list-item-data=${pdtItemData}>
                        <td> <img src="${image}" alt="${name}" height="40" /></td>
                        <td> ${name} </td>
                        <td> ${code} </td>
                        <td> ${resale_rate} Tk. <span class="hidden total-default-amount"> ${productRate}</span></td>
                        <td> <span class="total-amount-of-quantity">${quantities}</span> Pcs</td>
                        <td> <span class="total-amount-of-money">${prices}</span> Tk.</td>
                        <td>
                            <div class="btn-group">
                                <button type="button" remove-product-id="#${tagId}"
                                    class="btn btn-sm btn-danger border-0 px-10px fs-15 remove-product">
                                    <i class="far fa-trash-alt" remove-product-id="#product-list-item--${id}"></i>
                                </button>
                            </div>

                            <input type="hidden" name="product_main${product_id}_rate" value="${main_rate}"/>
                            <input type="hidden" name="product_resale_${product_id}_rate" value="${resale_rate}"/>
                            <input type="hidden" name="product_${product_id}_rate" value="${productRate}"/>
                            <input type="hidden" name="product_${product_id}_amount" value="${prices}"/>
                            <input type="hidden" class="product-discount" name="product_${product_id}_discount" value="${(productRate * quantities) - prices}"/>
                            <input type="hidden" name="product_${product_id}_quantities" value="${quantities}"/>
                        </td>
                    </tr>
                `;
            }

            // Initiating subtotal amounts
            function calculateSubtotal(){
                let subtotalQuantity = 0, subtotalAmount = 0, subtotalDefaultAmount = 0, totalDiscount = 0;

                $('.total-amount-of-quantity').each(function(index){
                    const value = parseInt($($('.total-amount-of-quantity')[index]).html());
                    subtotalQuantity += value;
                });

                $('.total-amount-of-money').each(function(index){
                    const value = parseInt($($('.total-amount-of-money')[index]).html());
                    subtotalAmount += value;
                });

                $('.total-default-amount').each(function(index){
                    const value = parseInt($($('.total-default-amount')[index]).html());
                    subtotalDefaultAmount += value * parseInt($("#total_quantities").val());
                });

                $('.product-discount').each(function(index){
                    const value = parseInt($($('.product-discount')[index]).val());
                    totalDiscount += value;
                });

                $('#subtotal-default-amount').html(subtotalDefaultAmount + ' Tk.');
                $('#subtotal-quantities').html(subtotalQuantity + ' Pcs');
                $('#subtotal-amount').html(subtotalAmount + ' Tk.');
                $('[name="discount"]').val(totalDiscount);

                amount = subtotalAmount; qty = subtotalQuantity; rate = subtotalDefaultAmount;
            }

            // select a customer and initiate the customer data
            $("#select_customer").change(function (event) {
                const data = JSON.parse($(event.target).val());
                customerData = data;

                $("#customer_email").val(data.email);
                $("#customer_phone").val(data.phone);
                $("#customer_address").val(data.address);

                // console.log(customerData);
            });

            // select a product and initiate the product data
            $("#select_product").change(function(event){
                const data = JSON.parse($(event.target).val());
                productData = { name: data.name, code: data.code, thumbnail: data.thumbnail , max_order: data.max_order , min_order: data.min_order , category_id: data.category_id, ...data.price };

                $("#total_quantities").val(1)
                // $("#price").val(productData.reseller_price);
                $("#reseller_price").val(productData.reseller_price);
                $("#default_price").val(productData.sale_price);
                
                // console.log(productData);
                saleTypeHandler();
            });

            // handle and update the total selected products, items, quantities and prices
            $("#total_quantities, #invoice_rate").on('click change keyup', function(){
                $("#main_total_price").val(Number($("#invoice_rate").val()) * Number($("#total_quantities").val()));
            });

            // create product list table
            $("#listing").click(function(event){
                event.preventDefault();

                const productListTableBody = productList({
                    id: productData.id,
                    image: productData.thumbnail, 
                    name: productData.name, 
                    code: productData.code, 
                    main_rate: productData.reseller_price, 
                    resale_rate: $("#invoice_rate").val(), 
                    quantities: $("#total_quantities").val(), 
                    prices: $("#main_total_price").val(),
                    product_id: productData.product_id,
                });

                // console.log(productListTableBody);
                $("#product-listing-tbody").append(productListTableBody)

                calculateSubtotal();
                console.log(ids)
            });

            // remove a product from our products list
            // Use event delegation to handle clicks on dynamically added elements
            $("#product-listing-tbody").on("click", ".remove-product", function(event) {
                const removeId = $(event.target).attr("remove-product-id");

                $(removeId).remove();
                calculateSubtotal();
            });

            // sales type changing to handle invoice rate
            $("#order_type").change(saleTypeHandler)

            // Initiate sales type changing callback function
            function saleTypeHandler(){
                $("#invoice_rate").attr("min", productData.reseller_price);
                $("#invoice_rate").attr("max", productData.sale_price);
                $("#total_quantities").val(1);

                if($("#order_type").val() === "self"){
                    $("#invoice_rate").val(productData.reseller_price);
                    $("#invoice_rate").attr("disabled", "true");
                    $("#main_total_price").val(productData.reseller_price);
                    productRate = productData.reseller_price;
                }else if($("#order_type").val() === "business"){
                    $("#invoice_rate").val(productData.sale_price);
                    $("#invoice_rate").removeAttr("disabled");
                    $("#main_total_price").val(productData.sale_price);
                    productRate = productData.sale_price;
                }else{
                    $("#invoice_rate").val(productData.reseller_price);
                    $("#invoice_rate").attr("disabled", "true");
                    $("#main_total_price").val(productData.reseller_price);
                    productRate = productData.reseller_price;
                }
            }

            (function(){
                const selectedProducts = @json($selected_products);

                selectedProducts.map(function(product){
                    const productListTableBody = productList({
                        id: product.id,
                        image: publicPath + product.product.thumbnail, 
                        name: product.product.name, 
                        code: product.product.code, 
                        main_rate: productData.main_rate, 
                        resale_rate: product.resale_rate, //hash
                        quantities: product.quantities, 
                        prices: product.resale_prices,
                        product_id: product.product.id,
                    });

                    const tagId = `product-list-item--${product.id}`;

                    if(ids.includes(tagId)){
                        $(`#${tagId}`).remove();
                    }else{
                        ids.push(tagId)
                    }

                    $("#product-listing-tbody").append(productListTableBody)
                    calculateSubtotal();
                });
            }());
        });
    </script>
@endpush 

<!-- ************* END ************* -->