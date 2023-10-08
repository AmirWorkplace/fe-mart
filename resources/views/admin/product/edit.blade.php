@extends('layouts.admin.app')

@section('content')
    <div class="row g-3">
        <div class="col-12">
            <form action="{{ Route('admin.product.update', $product->id) }}" method="POST" enctype="multipart/form-data"
                id="choice_form">
                @csrf
                @method('PUT')
                <div class="card">
                    <div class="card-header">
                        <div class="d-flex align-items-center justify-content-between">
                            <div class="flex-grow-1">
                                <h5 class="h6 mb-0 text-uppercase">Edit Product</h5>
                            </div>
                            <div class="flex-shrink-0">
                                <a href="{{ Route('admin.product.index') }}" class="btn btn-sm btn-primary">Go Back</a>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="row g-4">
                            <div class="col-md-6">
                                <div class="row g-3">
                                    <div class="col-12">
                                        <label for="name" class="form-label"><b>Product Name</b></label>
                                        <input type="text" id="name" class="form-control" name="name" required
                                            placeholder="Product Name." value="{{ $product->name }}">
                                    </div>
                                    <div class="col-12">
                                        <label for="regular_price" class="form-label"><b>Regular Price</b></label>
                                        <input type="number" class="form-control" id="regular_price" name="regular_price"
                                            required placeholder="Only number" value="{{ $product->price->regular_price }}">
                                    </div>
                                    <div class="col-sm-6">
                                        <label for="discount_tk" class="form-label"><b>Discount</b></label>
                                        <div class="input-group">
                                            <div class="input-group-text bg-primary text-white border-primary">৳</div>
                                            <input type="number" class="form-control" id="discount_tk" name="discount_tk"
                                                placeholder="Discount tk." value="{{ $product->price->discount_tk }}">
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <label for="discount" class="form-label"><b>Discount Parcentage</b></label>
                                        <div class="input-group">
                                            <div class="input-group-text bg-primary text-white border-primary">%</div>
                                            <input type="number" class="form-control" id="discount" name="discount"
                                                placeholder="Discount Parcentage" value="{{ $product->price->discount }}">
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <label for="sale_price" class="form-label"><b>Sale Price</b></label>
                                        <input type="number" class="form-control" id="sale_price" name="sale_price"
                                            readonly value="{{ $product->price->sale_price }}">
                                    </div>
                                    <div class="col-sm-6">
                                        <label for="vendor_price" class="form-label"><b>Vendor Price</b></label>
                                        <input type="number" class="form-control" id="vendor_price" name="vendor_price"
                                            required placeholder="Vendor Price" value="{{ $product->price->vendor_price }}">
                                    </div>
                                    <div class="col-sm-6">
                                        <label for="reseller_price" class="form-label"><b>Reseller Price</b></label>
                                        <input type="number" class="form-control" id="reseller_price" name="reseller_price"
                                            required placeholder="Reseller Price"
                                            value="{{ $product->price->reseller_price }}">
                                    </div>
                                    <div class="col-sm-6">
                                        <label for="thumbnail" class="form-label"><b>Product thumbnail <span
                                                    class="text-danger">(600x600)</span></b></label>
                                        <input type="file" name="thumbnail" id="thumbnail" class="form-control"
                                            accept="image/*">
                                        <div id="showThamb-wrapper">
                                            <img class="mt-2" src="{{ asset($product->thumbnail) }}" alt=""
                                                id="showThamb" height="60">
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <label for="more_images" class="form-label"><b>Other Images <span
                                                    class="text-danger">(600x600)</span></b></label>
                                        <input type="file" name="more_images[]" id="more_images" class="form-control"
                                            multiple accept="image/*">
                                        @if ($product->more_images)
                                            @php
                                                $more_images = explode('|', $product->more_images);
                                            @endphp
                                            <div id="preview_image" class="pt-2">
                                                @foreach ($more_images as $key => $image)
                                                    <img class="thumb" src="{{ asset($image) }}" alt=""
                                                        height="60">
                                                @endforeach
                                            </div>
                                        @else
                                            <div id="preview_image" class="pt-2" style="display: none;"></div>
                                        @endif
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="row g-3">
                                    <div class="col-12">
                                        <label class="form-label" for="parent_category"><b>Parent Category</b></label>
                                        <select name="category_id" id="parent_category" class="select form-select"
                                            required data-placeholder="Select Category..">
                                            <option value="" selected disabled></option>
                                            @foreach ($parent_categories as $key => $category)
                                                <option value="{{ $category->id }}"
                                                    {{ $category->id == $parent_id ? 'selected' : '' }}>
                                                    {{ $category->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="col-sm-6">
                                        <label class="form-label" for="child_category"><b>Child Category</b></label>
                                        <select name="category_id" id="child_category" class="select form-select"
                                            data-placeholder="Choose..">
                                            <option value="" selected disabled></option>
                                            @foreach ($child_categories as $key => $category)
                                                <option value="{{ $category->id }}"
                                                    {{ $category->id == $child_id ? 'selected' : '' }}>
                                                    {{ $category->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="col-sm-6">
                                        <label class="form-label" for="subchild_category"><b>Subchild Category</b></label>
                                        <select name="category_id" id="subchild_category" class="select form-select"
                                            data-placeholder="Choose..">
                                            <option value="" selected disabled></option>
                                            @foreach ($subchild_categories as $key => $category)
                                                <option value="{{ $category->id }}"
                                                    {{ $category->id == $subchild_id ? 'selected' : '' }}>
                                                    {{ $category->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="col-sm-6">
                                        <label class="form-label" for="status"><b>Status</b></label>
                                        <select name="status" id="status" class="select form-select"
                                            data-placeholder="Choose..">
                                            <option value="1" {{ $product->status == 1 ? 'selected' : '' }}>Active
                                            </option>
                                            <option value="0" {{ $product->status == 0 ? 'selected' : '' }}>Deactive
                                            </option>
                                        </select>
                                    </div>
                                    <div class="col-sm-6">
                                        <label class="form-label" for="brand_id"><b>Brand</b></label>
                                        <select name="brand_id" id="brand_id" class="select form-select"
                                            data-placeholder="Choose..">
                                            <option value="" disabled selected></option>
                                            @foreach ($brands as $brand)
                                                <option value="{{ $brand->id }}"
                                                    {{ $product->brand_id == $brand->id ? 'selected' : '' }}>
                                                    {{ $brand->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="col-12">
                                        <label for="product_type" class="form-label">Product Type</label>
                                        <select name="product_type" id="product_type" class="select form-select"
                                            data-placeholder="Product Type..">
                                            <option value="new_arrival"
                                                {{ $product->product_type == 'new_arrival' ? 'selected' : '' }}>New Arrival
                                            </option>
                                            <option value="best_seller"
                                                {{ $product->product_type == 'best_seller' ? 'selected' : '' }}>Best Seller
                                            </option>
                                            <option value="featured"
                                                {{ $product->product_type == 'featured' ? 'selected' : '' }}>Featured
                                            </option>
                                        </select>
                                    </div>
                                    <div class="col-sm-6">
                                        <label class="form-label" for="min_order"><b>Min Order</b></label>
                                        <input type="number" id="min_order" name="min_order" class="form-control"
                                            required placeholder="Min Order" value="{{ $product->min_order }}">
                                    </div>
                                    <div class="col-sm-6">
                                        <label class="form-label" for="max_order"><b>Max Single Order Quantity</b></label>
                                        <input type="number" id="max_order" name="max_order" class="form-control"
                                            placeholder="Max Single Order Quantity" value="{{ $product->max_order }}">
                                    </div>
                                    <div class="col-sm-6">
                                        <label class="form-label" for="video_id"><b>Product Video Url</b></label>
                                        <input type="text" id="video_id" name="video_id" class="form-control"
                                            placeholder="Youtube Video ID" value="{{ $product->video_id }}">
                                    </div>
                                    <div class="col-sm-6">
                                        <label class="form-label" for="video"><b>Upload Product Video : <span
                                                    class="text-danger ms-2">{{ $product->video ? ' Has a Video' : '' }}</span>
                                            </b></label>
                                        <input type="file" id="video" name="video" class="form-control"
                                            accept="video/*">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card mt-3">
                    <div class="card-body">
                        <div class="row g-3">
                            <div class="col-12">
                                <div class="form-group row g-3">
                                    <div class="col-md-3">
                                        <input type="text" class="form-control" value="{{ __('Attributes') }}"
                                            disabled>
                                    </div>
                                    <div class="col-md-8">
                                        @php
                                            $attribute_ids = [];
                                        @endphp
                                        @if (!is_null($product->choice_options))
                                            @foreach (json_decode($product->choice_options) as $key => $choice)
                                                @php
                                                    $attribute_ids[] = $choice->attribute_id;
                                                @endphp
                                            @endforeach
                                        @endif
                                        <select name="choice_attributes[]" id="choice_attributes"
                                            class="form-control select" multiple
                                            data-placeholder="{{ __('Choose Attributes') }}">
                                            @foreach (\App\Models\Attribute::all() as $key => $attribute)
                                                <option value="{{ $attribute->id }}"
                                                    {{ in_array($attribute->id, $attribute_ids) ? 'selected' : '' }}>{{ $attribute->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <p class="mb-0 pt-2">
                            {{ __('Choose the attributes of this product and then input values of each attribute') }}
                        </p>
                        <div class="pt-3 customer_choice_options" id="customer_choice_options"
                            style="display: {{ count(json_decode($product->choice_options)) == 0 ? 'none' : 'block' }};">
                            @if (count(json_decode($product->choice_options)) > 0)
                                @foreach (json_decode($product->choice_options) as $key => $choice)
                                    @php
                                        $attribute = \App\Models\Attribute::find($choice->attribute_id);
                                    @endphp
                                    <div
                                        class="mb-3 row g-3 attribute_parent attribute_parent_{{ $choice->attribute_id }}">
                                        <div class="col-md-3">
                                            <input type="hidden" name="choice_no[]"
                                                value="{{ $choice->attribute_id }}">
                                            <input type="text" class="form-control" name="choice[]"
                                                value="{{ $attribute->name }}" placeholder="{{ __('Choice Title') }}"
                                                readonly>
                                        </div>
                                        <div class="col-md-9">
                                            <select class="form-control select attribute_choice"
                                                data-placeholder="Select {{ $attribute->name }}"
                                                name="choice_options_{{ $choice->attribute_id }}[]" multiple>
                                                @foreach ($attribute->values as $key => $value)
                                                    <option value="{{ $value->value }}" title="{{ $value->value }}"
                                                        {{ in_array($value->value, $choice->values) ? 'selected' : '' }}>
                                                        {{ $value->value }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                @endforeach
                            @endif
                        </div>
                    </div>
                </div>
                <div class="card mt-3">
                    <div class="card-body">
                        <div id="show-hide-div"
                            style="display: {{ count(json_decode($product->choice_options)) > 0 ? 'none' : 'block' }};">
                            <div class="form-group row g-3 mb-3">
                                <label class="col-md-3 col-from-label">{{ __('Quantity') }}
                                    <span class="text-danger">*</span></label>
                                <div class="col-md-9">
                                    <input type="number" min="0" value="{{ $product->stocks->first()->qty }}"
                                        step="1" placeholder="{{ __('Quantity') }}" name="current_stock"
                                        class="form-control" required>
                                </div>
                            </div>
                            <div class="form-group row g-3 mb-3">
                                <label class="col-md-3 col-from-label">
                                    {{ __('SKU') }}
                                </label>
                                <div class="col-md-9">
                                    <input type="text" placeholder="{{ __('SKU') }}" name="sku"
                                        value="{{ $product->stocks->first()->sku }}" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="sku_combination" id="sku_combination">
                            @if (count(json_decode($product->choice_options)) > 0)
                                <table class="table table-bordered mb-0 align-middle">
                                    <thead>
                                        <tr>
                                            <td class="text-center">
                                                Variant
                                            </td>
                                            <td class="text-center">
                                                Variant Price
                                            </td>
                                            <td class="text-center">
                                                SKU
                                            </td>
                                            <td class="text-center">
                                                Quantity
                                            </td>
                                            <td class="text-center">
                                                Photo
                                            </td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach ($product->stocks as $stock)
                                            <tr class="variant">
                                                <td>
                                                    <label for=""
                                                        class="control-label">{{ $stock->variant }}</label>
                                                </td>
                                                <td>
                                                    <input type="number" name="price_{{ $stock->variant }}"
                                                        value="{{ $stock->price }}" min="0" step="0.01"
                                                        class="form-control" required="">
                                                </td>
                                                <td>
                                                    <input type="text" name="sku_{{ $stock->variant }}"
                                                        readonly="" value="{{ $stock->sku }}" class="form-control">
                                                </td>
                                                <td>
                                                    <input type="number" name="qty_{{ $stock->variant }}"
                                                        value="{{ $stock->qty }}" min="{{ $stock->ordered }}"
                                                        step="1" {{ $stock->ordered > 0 ? 'readonly' : '' }}
                                                        class="form-control" required="">
                                                </td>
                                                <td>
                                                    <div class="d-flex gap-2">
                                                        <input type="file" name="img_{{ $stock->variant }}"
                                                            class="form-control" accept="image/*">
                                                        @if (file_exists($stock->image))
                                                            <img class="flex-shrink-0" src="{{ asset($stock->image) }}"
                                                                height="40" alt="">
                                                        @endif

                                                    </div>
                                                </td>
                                            </tr>
                                        @endforeach
                                    </tbody>
                                </table>
                            @endif
                        </div>
                    </div>
                </div>
                <div class="card mt-3">
                    <div class="card-body">
                        <div class="row g-3">
                            <div class="col-12">
                                <label for="short_description" class="form-label">Short Description</label>
                                <textarea name="short_description" id="short_description" class="short_description" cols="30" rows="10">{!! $product->short_description !!}</textarea>
                            </div>
                            <div class="col-12">
                                <label for="description" class="form-label">Long Description</label>
                                <textarea name="description" id="description" class="description" cols="30" rows="10">{!! $product->description !!}</textarea>
                            </div>
                            <div class="col-12">
                                <label for="additional_info" class="form-label">Additional Information</label>
                                <textarea name="additional_info" id="additional_info" class="description" cols="30" rows="10">{!! $product->additional_info !!}</textarea>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card mt-3">
                    <div class="card-body">
                        <div class="row g-3">
                            <div class="col-12">
                                <label for="meta_title" class="form-label">SEO Title</label>
                                <input type="text" id="meta_title" name="meta_title" class="form-control"
                                    placeholder="SEO Title" value="{{ $product->meta_title }}">
                            </div>
                            <div class="col-12">
                                <label for="meta_keyword" class="form-label">SEO Keyword</label>
                                <textarea name="meta_keyword" id="meta_keyword" cols="30" rows="4" class="form-control"
                                    placeholder="SEO Keyword">{{ $product->meta_keyword }}</textarea>
                            </div>
                            <div class="col-12">
                                <label for="meta_description" class="form-label">SEO Description</label>
                                <textarea name="meta_description" id="meta_description" cols="30" rows="4" class="form-control"
                                    placeholder="SEO Description">{{ $product->meta_description }}</textarea>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer text-end">
                        <button type="submit" class="btn btn-sm btn-primary">Update Product</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
@endsection

@push('js')
    <script type="text/javascript">
        $(document).ready(function() {
            // Thumbail Image Preview
            function readFile(input) {
                let reader = new FileReader();
                reader.onload = (e) => {
                    $('#showThamb').attr('src', e.target.result);
                    $('#showThamb-wrapper').show();
                }
                reader.readAsDataURL(input.files[0]);
            }
            $(document).on('change', '#thumbnail', function(event) {
                readFile(this);
            });

            // Manage Product Prices
            $('#regular_price').on('wheel keyup change', function(event) {
                var regular_price = $("#regular_price").val();
                var discount = $("#discount").val();

                var sale_price = regular_price - (regular_price * (discount / 100));

                $("#sale_price").val(sale_price);
            });
            $('#discount').on('wheel keyup change', function(event) {
                var regular_price = $("#regular_price").val();
                var discount = $("#discount").val();

                var dis_price = regular_price * (discount / 100);
                var sale_price = regular_price - (regular_price * (discount / 100));

                $("#discount_tk").val(Math.ceil(dis_price));
                $("#sale_price").val(Math.ceil(sale_price));
            });
            $('#discount_tk').on('wheel keyup change', function(event) {
                var regular_price = $("#regular_price").val();
                var discount_tk = $("#discount_tk").val();

                var sale_price = regular_price - discount_tk;
                var discount = (discount_tk * 100) / regular_price;

                $("#discount").val(Math.ceil(discount));
                $("#sale_price").val(sale_price);
            });
            $('#sale_price').on('wheel keyup change', function(event) {
                var regular_price = $("#regular_price").val();
                var sale_price = $("#sale_price").val();
                var discount_tk = $("#discount_tk").val();

                var diff = regular_price - sale_price;
                var discount = (diff / regular_price) * 100;
                if (regular_price == '') {
                    discount = 0;
                    diff = 0;
                    // regular_price = sale_price;
                }
                $("#discount").val(Math.ceil(discount));
                $("#discount_tk").val(diff);
                // $("#regular_price").val(regular_price);
            });

            // More Images Preview
            $(document).on('change', '#more_images', function() {
                $('#preview_image').html('');
                if (window.File && window.FileReader && window.FileList && window.Blob) {
                    var data = $(this)[0].files;
                    $.each(data, function(index, file) {
                        if (/(\.|\/)(gif|jpe?g|png)$/i.test(file.type)) {
                            var fRead = new FileReader();
                            fRead.onload = (function(file) {
                                return function(e) {
                                    var img = $('<img/>').addClass('thumb').attr('src',
                                        e.target.result).height(50);
                                    $('#preview_image').append(img);
                                };
                            })(file);
                            fRead.readAsDataURL(file);
                        }
                    });
                    $('#preview_image').show();
                } else {
                    alert("Your browser doesn't support File API!");
                }
            });

            // Append Child Categories Ajax
            $(document).on('change', '#parent_category', function(event) {
                event.preventDefault();
                let id = $(this).val();
                let url = "{{ Route('admin.product.edit', $product->id) }}";
                $.ajax({
                    url: url,
                    type: "POST",
                    data: {
                        _method: 'GET',
                        getCategories: 'true',
                        id: id
                    },
                    success: (res) => {
                        if (res.status == 'success') {
                            $('#subchild_category').empty();
                            $('#child_category').empty();
                            $('#child_category').append(
                                '<option value="" disabled selected> Choose.. </option>');
                            $.each(res.child_categories, function(key, value) {
                                $('#child_category').append('<option value="' + value
                                    .id + '">' + value.name + '</option>');
                            });
                        }
                    }
                });
            });

            // Append SubChild Categories Ajax
            $(document).on('change', '#child_category', function(event) {
                event.preventDefault();
                let id = $(this).val();
                let url = "{{ Route('admin.product.edit', $product->id) }}";
                $.ajax({
                    url: url,
                    type: "POST",
                    data: {
                        _method: 'GET',
                        getCategories: 'true',
                        id: id
                    },
                    success: (res) => {
                        if (res.status == 'success') {
                            $('#subchild_category').empty();
                            $('#subchild_category').append(
                                '<option value="" disabled selected> Choose.. </option>');
                            $.each(res.child_categories, function(key, value) {
                                $('#subchild_category').append('<option value="' + value
                                    .id + '">' + value.name + '</option>');
                            });
                        }
                    }
                });
            });

            $(document).on('change', '#choice_attributes', function() {
                var elements = '';
                $.each($("#choice_attributes option:selected"), function(j, attribute) {
                    if (j == 0) {
                        elements += '.attribute_parent';
                    }
                    elements += ':not(.attribute_parent_' + $(attribute).val() + ')';
                    flag = false;
                    $('input[name="choice_no[]"]').each(function(i, choice_no) {
                        if ($(attribute).val() == $(choice_no).val()) {
                            flag = true;
                        }
                    });
                    if (!flag) {
                        add_more_customer_choice_option($(attribute).val(), $(attribute).text());
                    }
                });

                if (elements == '') {
                    $('.attribute_parent').remove();
                }
                $(elements).remove();
                update_sku();
            });

            function add_more_customer_choice_option(i, name) {
                $.ajax({
                    type: "POST",
                    url: "{{ route('admin.product.add-more-choice-option') }}",
                    data: {
                        attribute_id: i
                    },
                    success: function(data) {
                        var obj = JSON.parse(data);
                        $('#customer_choice_options').append(
                            '<div class="mb-3 row g-3 attribute_parent attribute_parent_' + i +
                            '">' +
                            '<div class="col-md-3">' +
                            '<input type="hidden" name="choice_no[]" value="' + i + '">' +
                            '<input type="text" class="form-control" name="choice[]" value="' +
                            name +
                            '" placeholder="{{ __('Choice Title') }}" readonly>' +
                            '</div>' +
                            '<div class="col-md-9">' +
                            '<select class="form-control select attribute_choice" data-placeholder="Select ' +
                            name + '" name="choice_options_' +
                            i + '[]" multiple>' + obj + '</select></div></div>');
                        $('#customer_choice_options').show();
                        $('.select').select2();
                    }
                });
            }

            $(document).on("change", ".attribute_choice", function() {
                update_sku();
            });

            function update_sku() {
                $.ajax({
                    type: "GET",
                    url: "{{ route('admin.product.sku_combination_edit', $product->id) }}",
                    data: $('#choice_form').serialize(),
                    success: function(data) {
                        $('#sku_combination').html(data);
                        if (data.length > 1) {
                            $('#show-hide-div').hide();
                        } else {
                            $('#show-hide-div').show();
                        }
                    }
                });
            }
        });
    </script>
@endpush
