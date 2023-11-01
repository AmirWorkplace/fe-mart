@php 

// $category_ids = json_decode($product->category_id); 

@endphp

@extends('layouts.admin.app')

@section('content')
<div class="row g-3">
    <div class="col-12">
        <form action="{{ Route('admin.reseller-sales-target.update', $data->id) }}" method="POST">
            @csrf
            @method('PUT')
            <div class="card">
                <div class="card-header px-3 py-2">
                    <div class="d-flex justify-content-between align-items-center">
                        <h6 class="h6 mb-0 text-uppercase">Edit Reseller Discount Offer's Products</h6>
                        <a href="{{ Route('admin.reseller-sales-target.index') }}" class="btn btn-primary btn-sm text-uppercase">
                            Go Back
                        </a>
                    </div>
                </div>
                <div class="card-body p-4">
                    <div class="row g-3">
                        <div class="col-md-4 col-sm-6">
                            <label for="select_main_category" class="form-label require"><b>Select Category</b></label>
                            <select name="select_main_category" id="select_main_category" class="select form-control" data-placeholder="Select Category" required>
                                <option value=""></option>
                                
                                @foreach ($categories as $category)
                                    <option value="{{ $category->id }}">{{ $category->name }}</option>
                                @endforeach
                                
                            </select>
                        </div> 
                        <div class="col-md-4 col-sm-6">
                            <label for="select_child_category" class="form-label require"><b>Select Child Category</b></label>
                            <div id="child-category">
                                <select name="select_child_category" id="select_child_category" class="select form-control" data-placeholder="Select Child Category">
  
                                    <option value=""></option> 
                                </select>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-6">
                            <label for="select_children_category" class="form-label require"><b>Select Children Category</b></label>
                            <div id="children-category">
                                 <select name="select_children_category" id="select_children_category" class="select form-control" data-placeholder="Select Children Category">
                                    <option value=""></option> 
                                </select>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <label for="select_product" class="form-label require"><b>Select Product</b></label>
                            <select name="select_products[]" id="select_product" class="select form-control" data-placeholder="Select Product" multiple>
                                {{-- <option value="{{ $product->id }}" selected>{{ $product->name }}</option>  --}}
                                @foreach ($products as $product)
                                    <option value="{{ $product->id }}" selected>{{ $product->name }}</option> 
                                @endforeach
                                
                            </select>
                        </div>
                        <div class="col-md-6 col-sm-6">
                            <label for="target_amount" class="form-label require"><b>Sales Target Amount</b></label>
                            <input type="text" value="{{ $data->target_amount }}" class="form-control custom-input" id="target_amount" name="target_amount" required>
                        </div>
                        <div class="col-md-6 col-sm-6">
                            <label for="discount_amount" class="form-label require"><b>Discount Amount</b></label>
                            <input type="text" value="{{ $data->discount_amount }}" class="form-control custom-input" id="discount_amount" name="discount_amount" required>
                        </div>
                        <div class="col-md-6">
                            <label for="start_date" class="form-label require"><b>Offer Start Date</b></label>
                            <input type="date" value="{{ Carbon\Carbon::parse($data->start_time)->format('Y-m-d') }}" id="start_date" name="start_date" required class="form-control datetimepicker">
                        </div>
                        <div class="col-md-6">
                            <label for="end_date" class="form-label require"><b>Offer End Date</b></label>
                            <input type="date" value="{{ Carbon\Carbon::parse($data->end_time)->format('Y-m-d') }}" id="end_date" name="end_date" required class="form-control datetimepicker">
                        </div>
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
        const existing_products = @json($products);

        // update child categories and parent categories product.
        $('#select_main_category').change(initiateChildCategory);
        
        $('#select_child_category').change(function(){
            $.ajax({
                url: "{{ route('admin.children_categories_with_products', 0) }}",
                method: 'GET',
                type: 'GET',
                data: {
                    _method: 'POST',
                    id: $('#select_child_category').val()
                },

                success: function(response){
                    // console.log(response);
                    if(response.status){
                        setOption({ categoryField:'#select_children_category', productsField:'#select_product', response });
                    }
                },

                error: function(error){
                    console.log(error);
                }
            });
        });
        
        function initiateChildCategory(){
            $.ajax({
                url: "{{ route('admin.child_categories_with_products', 0) }}",
                method: 'GET',
                type: 'GET',
                data: {
                    _method: 'POST',
                    id: $('#select_main_category').val()
                },

                success: function(response){
                    // console.log(response);
                    if(response.status){
                        setOption({ categoryField:'#select_child_category', productsField:'#select_product', response });
                    }
                },

                error: function(error){
                    console.log(error);
                }
            });
        }

        function setOption({ categoryField, productsField, response}){
            $(categoryField).html('<option value=""></option>');
            $(productsField).html('<option value=""></option>');

            existing_products.map(product =>
                $(productsField).append(`<option value="${product.id}" selected>${product.name}</option>`)
            );

            response.categories.map(item =>
                $(categoryField).append(`<option value="${item.id}">${item.name}</option>`)
            );

            response.products.map(product =>
                $(productsField).append(`<option value="${product.id}">${product.name}</option>`)
            );
        }

        $('#discount_percentage').on('change keyup click', function(){
            const discountPercentage = Number($('#discount_percentage').val());
            const discount = Number($('#discount').val());

            const value = getIgnorePercentageValue(resellerPrice, discountPercentage);

            $('#price').val(value.remaining);
            $('#discount').val(value.except);
        });
        
        $('#discount').on('change keyup click', function(){
            const discountValue = Number($('#discount').val());
            const value = getIgnoreIntegerValue(resellerPrice, discountValue);

            $('#price').val(value.remaining);
            $('#discount_percentage').val(value.except);
        });

        function getIgnorePercentageValue(value, percentage){
            const remaining = value - ((value * percentage) / 100);
            const except = value - remaining;

            return { remaining: Math.floor(remaining), except: Math.floor(except) };
        }

        function getIgnoreIntegerValue(value, ignoredValue){
            const except = (ignoredValue / value) * 100;
            const remaining = value - ignoredValue;

            return { remaining: Math.floor(remaining), except: Number(except.toFixed(2)) };
        }
    });
</script>
@endpush