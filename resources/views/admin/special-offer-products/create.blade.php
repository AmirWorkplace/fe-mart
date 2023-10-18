
@extends('layouts.admin.app')

@section('content')
    <div class="row g-3" id="vue-offer-product-page">
        <div class="col-12">
            <form action="{{ Route('admin.special-offer-products.store') }}" method="POST" enctype="multipart/form-data" id="choice_form">
                @csrf
                <div class="card">
                    <div class="card-header">
                        <div class="d-flex align-items-center justify-content-between">
                            <div class="flex-grow-1">
                                <h5 class="h6 mb-0 text-uppercase">Create Special Offer</h5>
                            </div>
                            <div class="flex-shrink-0 gap-2">
                                <a href="{{ Route('admin.special-offer-products.index') }}" class="btn btn-sm btn-primary">Go Back</a>
                                <button id="product-save-btn" class="btn btn-sm btn-success">Create Offer</button>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="row g-3">
                            <div class="col-8">
                                    <label for="name" class="form-label"><b>Offer Name</b></label>
                                    <input type="text" id="name" class="form-control" name="name" required
                                        placeholder="Offer Name.">
                            </div>
                            <div class="col-sm-4">
                                    <label for="serial" class="form-label"><b>Priority Serial</b></label>
                                    <input type="number" class="form-control" id="serial" name="serial"
                                        required placeholder="Only number" value="1">
                            </div>
                            <div class="col-12" id="product-select-box">
                                <label for="selected_products" class="form-label"><b>Product Name</b></label>
                                <select name="selected_products" id="selected_products" class="select form-select"
                                    data-placeholder="Product Name.." multiple                                   >
                                    <option value="" disabled>Select Here</option>
                                    
                                    @foreach ($products as $product)
                                        <option value="{{ $product }}">{{ $product->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <input type="hidden" name="product_ids" required>
                        </div>

                        <div class="mt-3">
                            <table class="table table-bordered align-middle text-center" style="width:100%">
                                <thead class="bg-success p-2">
                                    <tr class="text-nowrap text-white">
                                        <th>Picture</th>
                                        <th>Product Name</th>
                                        <th>Current Price</th>
                                        <th>Current Discount</th>
                                        <th>Offer Price</th>
                                    </tr>
                                </thead>
                                <tbody id="product-listing-tbody">
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="mt-3 bg-light">
                    <div class="card-footer text-end bg-light">
                        <button type="submit" class="btn btn-sm btn-success">Create Offer</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    @push('js')
        <script>
            $(document).ready(function(){
                $('#selected_products').change(()=> {
                    let productHtmlList = $('#selected_products').val().map(function(_product) {
                        const product = JSON.parse(_product);
                        return productList({
                            id: product.id,
                            name: product.name,
                            image: product.thumbnail,
                            current_price: product.price.sale_price,
                            current_discount: product.price.discount_tk,
                        })
                    });

                    $("#product-listing-tbody").html(productHtmlList.join(""));

                    let product_ids = [];

                    $('.offer-price').each(function(i){
                        product_ids.push($($('.offer-price')[i]).attr('product-id'));
                    });
                    
                    $('[name="product_ids"]').val(JSON.stringify(product_ids));
                });

                function productList({id, image, name, current_price, current_discount}) {
                    return `
                        <tr id="product-list-item--${id}" class="product-list-item" product-list-item-data="$-{pdtItemData}">
                            <td> <img src="${window.location.origin + '/' + image}" alt="${name}" height="40" /></td>
                            <td> ${name} </td>
                            <td> <span>${current_price}</span> Tk.</td>
                            <td> <span class="total-amount-of-quantity">${current_discount}</span> TK.</td>
                            <td> 
                                <input type="number" class="form-control offer-price" product-id="${id}" name="offer_price${id}" required value=${current_price}> 
                            </td>
                        </tr>
                    `;
                }
            })
        </script>
    @endpush
@endsection
