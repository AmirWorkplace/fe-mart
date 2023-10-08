@extends('layouts.admin.app')

@section('breadcrumb')
<div class="d-flex gap-3 align-items-center justify-content-between px-sm-4 px-3 py-3 bg-white shadow-sm">
    <h4 class="mb-0 h6 fw-600 text-dark text-uppercase text-truncate-1">All Products</h4>
    <div class="flex-shrink-0">
        <ol class="breadcrumb m-0">
            <li class="breadcrumb-item"><a href="{{ Route('admin.dashboard.index') }}">Dashboard</a></li>
            <li class="breadcrumb-item active">Products</li>
        </ol>
    </div>
</div>
@endsection

@section('content')
<div class="row g-3">
    <div class="col-12">
        <div class="card">
            <div class="card-header">
                <div class="d-flex gap-2 align-items-center justify-content-between flex-wrap">
                    <div class="flex-grow-1">
                        <h6 class="h6 mb-0 py-5px">All Products</h6>
                    </div>
                    <div class="flex-shrink-0 d-flex gap-2">
                        <a href="{{ Route('admin.product.index') }}" class="btn btn-sm btn-primary">All Products</a>
                        <a href="{{ Route('admin.product.create') }}" class="btn btn-sm btn-primary">Add New Product</a>
                    </div>
                </div>
            </div>
            <div class="card-body">
                <table class="dataTable table align-middle" style="width:100%">
                    <thead>
                        <tr class="text-nowrap">
                            <th width="3"></th>
                            <th width="110">Image</th>
                            <th>Product Name</th>
                            <th width="110">Regular Price</th>
                            <th width="110">Sale Price</th>
                            <th width="110">Discount</th>
                            <th width="110">Category</th>
                            <th width="110">Actions</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th class="text-center" rowspan="1" colspan="1">
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="selectAll">
                                    <label class="custom-control-label" for="selectAll"></label>
                                </div>
                            </th>
                            <th rowspan="1" colspan="1">
                                <button type="button" name="bulk_delete" data-url="{{ Route('admin.product.destroy-parmanent.multiple') }}" id="bulk_delete" class="btn btn btn-xs btn-danger">Delete</button>
                            </th>
                            <th rowspan="1" colspan="1"></th>
                            <th rowspan="1" colspan="1"></th>
                            <th rowspan="1" colspan="1"></th>
                            <th rowspan="1" colspan="1"></th>
                            <th rowspan="1" colspan="1"></th>
                            <th class="text-center" rowspan="1" colspan="1"></th>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>
</div>
@endsection

@push('js')
<script type="text/javascript">
    $(document).ready(function () {
        var table = $('.dataTable').dataTable({
            processing: true,
            serverSide: true,
            scrollX: true,
            ajax: {
                url: "{{ Route('admin.product.trashed') }}",
                type: "GET",
            },
            columns: [{
                    data: "checkbox",
                    name: "checkbox",
                    orderable: false,
                    searchable: false,
                    width: '3'
                },
                {
                    data: 'image',
                    name: 'Image',
                    orderable: false,
                    searchable: false,
                    width: '110'
                },
                {
                    data: 'name',
                    name: 'name'
                },
                {
                    data: 'regular_price',
                    name: 'regular_price',
                    orderable: false,
                    searchable: false,
                    width: '110'
                },
                {
                    data: 'sale_price',
                    name: 'sale_price',
                    orderable: false,
                    searchable: false,
                    width: '110'
                },
                {
                    data: 'discount',
                    name: 'discount',
                    orderable: false,
                    searchable: false,
                    width: '110'
                },
                {
                    data: 'category',
                    name: 'category',
                    orderable: false,
                    searchable: false,
                    width: '110'
                },
                {
                    data: 'actions',
                    name: 'actions',
                    orderable: false,
                    searchable: false,
                    className: "text-end",
                    width: '110'
                },
            ]
        });

        $(document).on('click', '.link-restore', function (e) {
            e.preventDefault();
            let url = $(this).data('url');
            Swal.fire({
                title: 'Are you sure?',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Yes, restore it!',
                cancelButtonText: 'No, cancel!',
                reverseButtons: true
            }).then((result) => {
                if (result.isConfirmed) {
                    $.ajax({
                        url: url,
                        type: 'POST',
                        data: {
                            _method: 'GET',
                        },
                        success: function (res) {
                            if (res.status == 'success') {
                                Swal.fire({
                                    width: "22rem",
                                    title: "Deleted!",
                                    text: "Restored Successfully!",
                                    icon: "success",
                                    showConfirmButton: false,
                                    timer: 500
                                });
                                $('.dataTable').DataTable().ajax.reload();
                            }
                        }
                    });
                } else(
                    result.dismiss === Swal.DismissReason.cancel
                )
            });
        });

        $(document).on('click', '.link-delete', function (e) {
            e.preventDefault();
            let url = $(this).data('url');
            Swal.fire({
                title: 'Are you sure?',
                text: "You won't be able to revert this!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Yes, delete it!',
                cancelButtonText: 'No, cancel!',
                reverseButtons: true
            }).then((result) => {
                if (result.isConfirmed) {
                    $.ajax({
                        url: url,
                        type: 'POST',
                        data: {
                            _method: 'DELETE'
                        },
                        success: function (res) {
                            if (res.status == 'success') {
                                Swal.fire({
                                    width: "22rem",
                                    title: "Deleted!",
                                    text: "Deleted Successfully!",
                                    icon: "success",
                                    showConfirmButton: false,
                                    timer: 1500
                                });
                                $('.dataTable').DataTable().ajax.reload();
                            }
                        }
                    });
                } else(
                    result.dismiss === Swal.DismissReason.cancel
                )
            });
        });
        
        $("#selectAll").on("click", function (e) {
            if ($(this).is(":checked")) {
                $(".multi_checkbox").prop("checked", true);
            } else {
                $(".multi_checkbox").prop("checked", false);
            }
        });

        // multi delete row table
        function multiDelCheckbox(url, selectClass) {
            Swal.fire({
                width: "25rem",
                title: "Are you sure?",
                text: "You won't be able to revert this!",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#3085d6",
                cancelButtonColor: "#d33",
                confirmButtonText: "Yes, delete it!",
            }).then((result) => {
                if (result.value) {
                    let id = [];
                    $("." + selectClass + ":checked").each(function () {
                        id.push($(this).val());
                    });
                    if (id.length > 0) {
                        $.ajax({
                            url: url,
                            method: "post",
                            data: {
                                id: id
                            },
                            success: function (response) {
                                if (response.status == 'success') {
                                    Swal.fire({
                                        width: "22rem",
                                        title: "Deleted!",
                                        text: response.val,
                                        icon: "success",
                                        showConfirmButton: false,
                                        timer: 1500
                                    })
                                }
                                $("#selectAll").prop("checked", false);
                                $("input[type=checkbox]").prop("checked", false);
                                $('.dataTable').DataTable().ajax.reload();
                            }
                        });
                    } else {
                        Swal.fire({
                            width: "22rem",
                            title: "Error!",
                            text: "Please select atleast one checkbox",
                            icon: "error",
                            showConfirmButton: false,
                            timer: 1500
                        })
                    }
                }
            })
        }

        $("#bulk_delete").on("click", function () {
            let url = $(this).data("url");
            let selectClass = "multi_checkbox";
            multiDelCheckbox(url, selectClass);
        });


    });

</script>
@endpush
