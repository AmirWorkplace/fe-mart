@extends('layouts.admin.app')

@section('content')
    <div class="row g-3">
        <div class="col-12">
            <form action="{{ Route('admin.home-product-section.store') }}" method="POST" enctype="multipart/form-data">
                @csrf
                <div class="card">
                    <div class="card-header p-3">
                        <div class="d-flex justify-content-between align-items-center">
                            <h6 class="h6 mb-0 text-uppercase">Add New Home Section</h6>
                            <a href="{{ Route('admin.home-product-section.index') }}"
                                class="btn btn-primary btn-sm text-uppercase">Go Back</a>
                        </div>
                    </div>
                    <div class="card-body p-4">
                        <div class="row g-3">
                            <div class="col-md-4 col-sm-6">
                                <label for="category_id" class="form-label"><b>Category</b></label>
                                <select name="category_id" id="category_id" class="select form-select" required
                                    data-placeholder="Select Category..">
                                    <option value="">Category</option>
                                    @foreach ($categories as $category)
                                        <option value="{{ $category->id }}">{{ $category->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="col-md-4 col-sm-6">
                                <label for="second_row_content" class="form-label"><b>Second Row Content</b></label>
                                <select name="second_row_content" id="second_row_content" class="select form-select"
                                    data-placeholder="Select Second Row Content..">
                                    <option value="blank">Blank</option>
                                    <option value="product">Product</option>
                                    <option value="banner">Banner</option>
                                </select>
                            </div>
                            <div class="col-md-4 col-sm-6">
                                <label for="brand_id" class="form-label"><b>Select Brands</b></label>
                                <select name="brand_id[]" id="brand_id" class="form-select"
                                    data-placeholder="Select Brands.." multiple>
                                    <option value="">Brand</option>
                                    @foreach ($brands as $brand)
                                        <option value="{{ $brand->id }}">{{ $brand->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="col-md-4 col-sm-6" id="banner_qty_wrapper" style="display: none;">
                                <label for="banner_qty" class="form-label"><b>Banner Quantity</b></label>
                                <select name="banner_qty" id="banner_qty" class="select form-select"
                                    data-placeholder="Select Second Row Content..">
                                    <option value="1">1 Banner</option>
                                    <option value="2">2 Banner</option>
                                </select>
                            </div>
                            <div class="col-md-4 col-sm-6" id="banner_one_wrapper" style="display: none;">
                                <label for="banner_one" class="form-label"><b>Banner</b></label>
                                <input type="file" class="form-control" id="banner_one" name="banner_one"
                                    accept="image/*">
                            </div>
                            <div class="col-md-4 col-sm-6" id="banner_one_link_wrapper" style="display: none;">
                                <label for="banner_one_link" class="form-label"><b>Banner Link</b></label>
                                <input type="text" name="banner_one_link" id="banner_one_link" class="form-control"
                                    placeholder="Banner Link">
                            </div>
                            <div class="col-md-4 col-sm-6" id="banner_two_wrapper" style="display: none;">
                                <label for="banner_two" class="form-label"><b>Banner</b></label>
                                <input type="file" name="banner_two" id="banner_two" class="form-control"
                                    accept="image/*">
                            </div>
                            <div class="col-md-4 col-sm-6" id="banner_two_link_wrapper" style="display: none;">
                                <label for="banner_two_link" class="form-label"><b>Banner Link</b></label>
                                <input type="text" name="banner_two_link" id="banner_two_link" class="form-control"
                                    placeholder="Banner Link">
                            </div>
                            <div class="col-md-4 col-sm-6">
                                <label for="order" class="form-label"><b>Order</b></label>
                                <input type="number" class="form-control" id="order" name="order" placeholder="Section Serial">
                            </div>
                            <div class="col-md-4 col-sm-6">
                                <label for="status" class="form-label"><b>Status</b></label>
                                <select name="status" id="status" class="select form-select"
                                    data-placeholder="Select Status..">
                                    <option value="1">Active</option>
                                    <option value="0">Deactive</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer text-end p-3">
                        <button type="submit" class="btn btn-primary btn-sm">Save</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
@endsection

@push('js')
    <script type="text/javascript">
        $(document).ready(function() {
            $(document).on('change', '#second_row_content', function(e) {
                let value = $(this).val();
                if (value == 'banner') {
                    $('#banner_qty_wrapper').show();
                    $('#banner_one_wrapper').show();
                    $('#banner_one').attr('required', true);
                    $('#banner_one_link_wrapper').show();
                    $('#banner_one_link').attr('required', true);
                } else {
                    $('#banner_qty_wrapper').hide();
                    $('#banner_one_wrapper').hide();
                    $('#banner_one').attr('required', false);
                    $('#banner_one_link_wrapper').hide();
                    $('#banner_one_link').attr('required', false);
                    $('#banner_two_link_wrapper').hide();
                    $('#banner_two_link').attr('required', false);
                    $('#banner_two_wrapper').hide();
                    $('#banner_two').attr('required', false);
                    $('#banner_qty').val('');
                    var placeholder = $(this).data('placeholder');
                    placeholder = !placeholder ? "choose" : placeholder;
                    $('.select').select2({
                        placeholder: placeholder,
                    });
                }
            });
            $(document).on('change', '#banner_qty', function(e) {
                let value = $(this).val();
                if (value == 2) {
                    $('#banner_two_wrapper').show();
                    $('#banner_two').attr('required', true);
                    $('#banner_two_link_wrapper').show();
                    $('#banner_two_link').attr('required', true);
                } else {
                    $('#banner_two_wrapper').hide();
                    $('#banner_two').attr('required', false);
                    $('#banner_two_link_wrapper').hide();
                    $('#banner_two_link').attr('required', false);
                }
            });

            var placeholder = $(this).data('placeholder');
            placeholder = !placeholder ? "choose" : placeholder;
            $('#brand_id').select2({
                placeholder: placeholder,
                maximumSelectionLength: 6
            });
        });
    </script>
@endpush
