@extends('layouts.admin.app')

@section('content')
    <div class="row g-3">
        <div class="col-12">
            <form action="{{ Route('admin.product.store') }}" method="POST" enctype="multipart/form-data" id="choice_form">
                @csrf
                <div class="card">
                    <div class="card-header">
                        <div class="d-flex align-items-center justify-content-between">
                            <div class="flex-grow-1">
                                <h5 class="h6 mb-0 text-uppercase">Create Product</h5>
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
                                            placeholder="Product Name.">
                                    </div>
                                    <div class="col-12">
                                        <label for="regular_price" class="form-label"><b>Regular Price</b></label>
                                        <input type="number" class="form-control" id="regular_price" name="regular_price"
                                            required placeholder="Only number" value="0">
                                    </div>
                                    <div class="col-sm-6">
                                        <label for="discount_tk" class="form-label"><b>Discount</b></label>
                                        <div class="input-group">
                                            <div class="input-group-text bg-primary text-white border-primary">৳</div>
                                            <input type="number" class="form-control" id="discount_tk" name="discount_tk"
                                                placeholder="Discount tk." required value="0">
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <label for="discount" class="form-label"><b>Discount Parcentage</b></label>
                                        <div class="input-group">
                                            <div class="input-group-text bg-primary text-white border-primary">%</div>
                                            <input type="number" class="form-control" id="discount" name="discount"
                                                placeholder="Discount Parcentage" required value="0">
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <label for="sale_price" class="form-label"><b>Sale Price</b></label>
                                        <input type="number" class="form-control" id="sale_price" name="sale_price"
                                            readonly required value="0">
                                    </div>
                                    <div class="col-sm-6">
                                        <label for="vendor_price" class="form-label"><b>Vendor Price</b></label>
                                        <input type="number" class="form-control" id="vendor_price" name="vendor_price"
                                            required placeholder="Vendor Price">
                                    </div>
                                    <div class="col-sm-6">
                                        <label for="reseller_price" class="form-label"><b>Reseller Price</b></label>
                                        <input type="number" class="form-control" id="reseller_price" name="reseller_price"
                                            required placeholder="Reseller Price">
                                    </div>
                                    <div class="col-sm-6">
                                        <label for="thumbnail" class="form-label"><b>Product thumbnail <span
                                                    class="text-danger">(600x600)</span></b></label>
                                        <input type="file" name="thumbnail" id="thumbnail" class="form-control" required
                                            accept="image/*">
                                        <div id="showThamb-wrapper" style="display: none;">
                                            <img class="mt-2" src="" alt="" id="showThamb" height="60">
                                        </div>
                                    </div>
                                    <div class="col-sm-6">
                                        <label for="more_images" class="form-label"><b>Other Images <span
                                                    class="text-danger">(600x600)</span></b></label>
                                        <input type="file" name="more_images[]" id="more_images" class="form-control"
                                            multiple accept="image/*">
                                        <div id="preview_image" class="pt-2" style="display: none;"></div>
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
                                            @foreach ($categories as $key => $category)
                                                <option value="{{ $category->id }}">{{ $category->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="col-sm-6">
                                        <label class="form-label" for="child_category"><b>Child Category</b></label>
                                        <select name="category_id" id="child_category" class="select form-select"
                                            data-placeholder="Choose.."></select>
                                    </div>
                                    <div class="col-sm-6">
                                        <label class="form-label" for="subchild_category"><b>Subchild Category</b></label>
                                        <select name="category_id" id="subchild_category" class="select form-select"
                                            data-placeholder="Choose.."></select>
                                    </div>
                                    <div class="col-sm-6">
                                        <label class="form-label" for="status"><b>Status</b></label>
                                        <select name="status" id="status" class="select form-select"
                                            data-placeholder="Choose..">
                                            <option value="1" selected>Active</option>
                                            <option value="0">Deactive</option>
                                        </select>
                                    </div>
                                    <div class="col-sm-6">
                                        <label class="form-label" for="brand_id"><b>Brand</b></label>
                                        <select name="brand_id" id="brand_id" class="select form-select"
                                            data-placeholder="Choose..">
                                            <option value="" disabled selected></option>
                                            @foreach ($brands as $brand)
                                                <option value="{{ $brand->id }}">{{ $brand->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="col-12">
                                        <label for="product_type" class="form-label">Product Type</label>
                                        <select name="product_type" id="product_type" class="select form-select"
                                            data-placeholder="Product Type..">
                                            <option value="new_arrival" selected>New Arrival</option>
                                            <option value="best_seller">Best Seller</option>
                                            <option value="featured">Featured</option>
                                        </select>
                                    </div>
                                    <div class="col-sm-6">
                                        <label class="form-label" for="min_order"><b>Min Order</b></label>
                                        <input type="number" id="min_order" name="min_order" class="form-control"
                                            required placeholder="Min Order" value="1">
                                    </div>
                                    <div class="col-sm-6">
                                        <label class="form-label" for="max_order"><b>Max Single Order Quantity</b></label>
                                        <input type="number" id="max_order" name="max_order" class="form-control"
                                            placeholder="Max Single Order Quantity">
                                    </div>
                                    <div class="col-sm-6">
                                        <label class="form-label" for="video_id"><b>Product Video Url</b></label>
                                        <input type="text" id="video_id" name="video_id" class="form-control"
                                            placeholder="Youtube Video ID">
                                    </div>
                                    <div class="col-sm-6">
                                        <label class="form-label" for="video"><b>Upload Product Video</b></label>
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
                                    <div class="col-md-9">
                                        <select name="choice_attributes[]" id="choice_attributes"
                                            class="form-control select" multiple
                                            data-placeholder="{{ __('Choose Attributes') }}">
                                            @foreach (\App\Models\Attribute::all() as $key => $attribute)
                                                <option value="{{ $attribute->id }}">{{ $attribute->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <p class="mb-0 pt-2">
                            {{ __('Choose the attributes of this product and then input values of each attribute') }}
                        </p>
                        <div class="pt-3 customer_choice_options" id="customer_choice_options" style="display: none;">
                        </div>
                    </div>
                </div>
                <div class="card mt-3">
                    <div class="card-body">
                        <div id="show-hide-div">
                            <div class="form-group row g-3 mb-3">
                                <label class="col-md-3 col-from-label">{{ __('Quantity') }}
                                    <span class="text-danger">*</span></label>
                                <div class="col-md-9">
                                    <input type="number" min="0" value="0" step="1"
                                        placeholder="{{ __('Quantity') }}" name="current_stock" class="form-control"
                                        required>
                                </div>
                            </div>
                            <div class="form-group row g-3 mb-3">
                                <label class="col-md-3 col-from-label">
                                    {{ __('SKU') }}
                                </label>
                                <div class="col-md-9">
                                    <input type="text" placeholder="{{ __('SKU') }}" name="sku"
                                        class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="sku_combination" id="sku_combination">

                        </div>
                    </div>
                </div>

                <div class="card mt-3">
                    <div class="card-body">
                        <div class="row g-3">
                            <div class="col-12">
                                <label for="short_description" class="form-label">Short Description</label>
                                <textarea name="short_description" id="short_description" class="short_description" cols="30" rows="10"></textarea>
                            </div>
                            <div class="col-12">
                                <label for="description" class="form-label">Long Description</label>
                                <textarea name="description" id="description" class="description" cols="30" rows="10"></textarea>
                            </div>
                            <div class="col-12">
                                <label for="additional_info" class="form-label">Additional Information</label>
                                <textarea name="additional_info" id="additional_info" class="description" cols="30" rows="10"></textarea>
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
                                    placeholder="SEO Title">
                            </div>
                            <div class="col-12">
                                <label for="meta_keyword" class="form-label">SEO Keyword</label>
                                <textarea name="meta_keyword" id="meta_keyword" cols="30" rows="4" class="form-control"
                                    placeholder="SEO Keyword"></textarea>
                            </div>
                            <div class="col-12">
                                <label for="meta_description" class="form-label">SEO Description</label>
                                <textarea name="meta_description" id="meta_description" cols="30" rows="4" class="form-control"
                                    placeholder="SEO Description"></textarea>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer text-end">
                        <button type="submit" class="btn btn-sm btn-primary">Upload Product</button>
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
                let url = "{{ Route('admin.product.create') }}";
                $.ajax({
                    url: url,
                    type: "POST",
                    data: {
                        _method: 'GET',
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
                let url = "{{ Route('admin.product.create') }}";
                $.ajax({
                    url: url,
                    type: "POST",
                    data: {
                        _method: 'GET',
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
                        console.log($(attribute).val());
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
                    type: "POST",
                    url: "{{ route('admin.product.sku_combination') }}",
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
