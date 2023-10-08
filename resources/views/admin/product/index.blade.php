@extends('layouts.admin.app')

@section('content')
    <div class="row g-3">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <div class="d-flex gap-2 align-items-center justify-content-between flex-wrap">
                        <div class="flex-grow-1">
                            <h6 class="h6 mb-0 text-uppercase">Product Setup</h6>
                        </div>
                        <div class="flex-shrink-0 d-flex gap-2">
                            <div>
                                <select name="filter" id="filter" class="form-select"
                                    style="width: 150px; padding: 5px 8px;">
                                    <option value="all">All</option>
                                    <option value="trash">Trash</option>
                                </select>
                            </div>
                            <a href="{{ Route('admin.product.create') }}" class="btn btn-sm btn-primary text-nowrap">Add New
                                Product</a>
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
                                <th width="110">Status</th>
                                <th width="110">Actions</th>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                                <th class="text-center" colspan="1">
                                    <div class="custom-control custom-checkbox">
                                        <div id="regular_all_select">
                                            <input type="checkbox" class="custom-control-input" id="selectAll">
                                            <label class="custom-control-label" for="selectAll"></label>
                                        </div>
                                        <div id="trash_all_select" style="display: none;">
                                            <input type="checkbox" class="custom-control-input" id="trash_selectAll">
                                            <label class="custom-control-label" for="trash_selectAll"></label>
                                        </div>
                                    </div>
                                </th>
                                <th colspan="8">
                                    <button type="button" data-url="{{ Route('admin.product.destroy', '0') }}"
                                        id="bulk_delete" class="btn btn btn-xs btn-danger">Delete</button>
                                    <button type="button" data-url="{{ Route('admin.product.destroy', '0') }}"
                                        style="display: none;" id="trash_bulk_delete"
                                        class="btn btn btn-xs btn-danger">Delete</button>
                                </th>
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
        $(document).ready(function() {
            var table = $('.dataTable').dataTable({
                processing: true,
                serverSide: true,
                scrollX: true,
                ajax: {
                    url: "{{ Route('admin.product.index') }}",
                    type: "GET",
                    data: function(data) {
                        data.type = $('#filter').val();
                    }
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
                        data: 'status',
                        name: 'status',
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

            $(document).on('change', '#filter', function(e) {
                e.preventDefault();
                if ($(this).val() == 'trash') {
                    $('#regular_all_select').hide();
                    $('#trash_all_select').show();
                    $('#bulk_delete').hide();
                    $('#trash_bulk_delete').show();
                } else {
                    $('#regular_all_select').show();
                    $('#trash_all_select').hide();
                    $('#bulk_delete').show();
                    $('#trash_bulk_delete').hide();
                }
                table.DataTable().ajax.reload();
            });

            $(document).on('click', '.trash_delete', function(e) {
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
                                _method: 'DELETE',
                                parmanent: 'true',
                            },
                            success: function(response) {
                                if (response.status == 'success') {
                                    Swal.fire({
                                        width: "22rem",
                                        title: "Deleted!",
                                        text: response.status,
                                        icon: "success",
                                        showConfirmButton: false,
                                        timer: 1500
                                    });
                                    $('.dataTable').DataTable().ajax.reload();
                                }
                                if (response.status == 'error') {
                                    Swal.fire({
                                        width: "22rem",
                                        title: "Failed!",
                                        text: "You don't have any Authority to do this action",
                                        icon: "error",
                                        showConfirmButton: false,
                                        timer: 1500
                                    });
                                }
                            }
                        });
                    } else(
                        result.dismiss === Swal.DismissReason.cancel
                    )
                });
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
                        $("." + selectClass + ":checked").each(function() {
                            id.push($(this).val());
                        });
                        if (id.length > 0) {
                            $.ajax({
                                url: url,
                                type: 'POST',
                                data: {
                                    _method: 'DELETE',
                                    id: id,
                                    parmanent: 'true'
                                },
                                success: function(response) {
                                    if (response.status == 'success') {
                                        $('#editForm').hide();
                                        $('#addForm').show();
                                        Swal.fire({
                                            width: "22rem",
                                            title: "Deleted!",
                                            text: response.val,
                                            icon: "success",
                                            showConfirmButton: false,
                                            timer: 1500
                                        });
                                        $('.dataTable').DataTable().ajax.reload();
                                    }
                                    if (response.status == 'error') {
                                        $('#editForm').hide();
                                        $('#addForm').show();
                                        Swal.fire({
                                            width: "22rem",
                                            title: "Failed!",
                                            text: "You don't have any Authority to do this action",
                                            icon: "error",
                                            showConfirmButton: false,
                                            timer: 1500
                                        });
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
                            });
                        }
                    }
                })
            }

            $("#trash_bulk_delete").on("click", function() {
                let url = $(this).data("url");
                let selectClass = "trash_multi_checkbox";
                multiDelCheckbox(url, selectClass);
            });

            $("#trash_selectAll").on("click", function(e) {
                if ($(this).is(":checked")) {
                    $(".trash_multi_checkbox").prop("checked", true);
                } else {
                    $(".trash_multi_checkbox").prop("checked", false);
                }
            });

            $(document).on('click', '.link-recovery', function(e) {
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
                            data: {
                                _method: 'GET',
                            },
                            success: (response) => {
                                if (response.status == 'success') {
                                    Swal.fire({
                                        width: "22rem",
                                        title: "Recovered!",
                                        text: 'Recovered Successfully!',
                                        icon: "success",
                                        showConfirmButton: false,
                                        timer: 1500
                                    });
                                    $('.dataTable').DataTable().ajax.reload();
                                }
                                if (response.status == 'error') {
                                    Swal.fire({
                                        width: "22rem",
                                        title: "Failed!",
                                        text: "You don't have any Authority to do this action",
                                        icon: "error",
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
        });
    </script>
@endpush
