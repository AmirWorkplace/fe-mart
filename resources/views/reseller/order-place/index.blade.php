@extends('layouts.admin.app')

@section('content')
<div class="row g-3">
    <div class="col-12">
        <div class="card">
            <div class="card-header px-3 py-2">
                <div class="d-flex justify-content-between align-items-center">
                    <h6 class="h6 mb-0 text-uppercase">Order Management</h6>
                    <form action="#" class="flex-shrink-0 d-flex gap-2" method="GET" id="filter_form">
                        <input type="date" id="start_date" name="start_date" required class="form-control">
                        <input type="date" id="end_date" name="end_date" required class="form-control">
                        <select name="status" id="status" class="form-select">
                            <option value="">Select Status</option>
                            <option value="Pending">Pending</option>
                            <option value="Confirmed">Confirmed</option>
                            <option value="Processing">Processing</option>
                            <option value="Delivered">Delivered</option>
                            <option value="Successed">Succeed</option>
                            <option value="Canceled">Canceled</option>
                        </select>
                        <button type="submit" class="btn btn-sm btn-primary px-4">Filter</button>
                    </form>
                </div>
            </div>
            <div class="card-header px-3 py-2">
                <div class="d-flex justify-content-between align-items-center">
                    <h6 class="h6 mb-0 text-uppercase">Manage Customer Entry</h6>
                    <a href="{{ Route('admin.order-place.create') }}" class="btn btn-primary btn-sm text-uppercase">Add
                        New</a>
                </div>
            </div>
            <div class="card-body">
                <table class="dataTable table align-middle" style="width:100%">
                    <thead>
                        <tr class="text-nowrap">
                            <th width="3"></th>
                            <th>Order Code</th>
                            <th>Customer Name</th>
                            <th>Product Name</th>
                            <th>Phone Number</th>
                            <th>Order Amount</th>
                            <th>Status</th>
                            <th width="110" class="text-end">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                    {{-- <tfoot>
                        <tr>
                            <th class="text-center" colspan="1">
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="selectAll">
                                    <label class="custom-control-label" for="selectAll"></label>
                                </div>
                            </th>
                            <th colspan="4">
                                <button type="button" name="bulk_delete"
                                    data-url="{{ Route('admin.order-place.destroy', '0') }}" id="bulk_delete"
                                    class="btn btn btn-xs btn-danger">Delete</button>
                            </th>
                        </tr>
                    </tfoot> --}}
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
                    url: "{{ Route('admin.order-place.index') }}",
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
                        data: 'order_code',
                        name: 'order_code'
                    },  
                    {
                        data: 'user_name',
                        name: 'user_name'
                    },  
                    {
                        data: 'product_names',
                        name: 'product_names'
                    },
                    {
                        data: 'user_phone',
                        name: 'user_phone'
                    }, 
                    // {
                    //     data: 'order_date',
                    //     name: 'order_date'
                    // },
                    {
                        data: 'sub_total',
                        name: 'sub_total'
                    },
                    {
                        data: 'order_status',
                        name: 'order_status',
                        orderable: false,
                        searchable: false,
                    },
                    {
                        data: 'actions',
                        name: 'actions',
                        orderable: false,
                        searchable: false,
                        className: "text-end",
                    },
                ]
            });

            // update order status
            $(document).on('submit', '#filter_form', function(e) {
                e.preventDefault();
                $('.dataTable').DataTable().draw();
            });

            $(document).on('change', '.order_status', function(event) {
                event.preventDefault();
                let id = $(this).data('id');
                let status = $(this).val();
                $.ajax({
                    url: "{{ Route('admin.order-place.edit', '0') }}",
                    type: 'POST',
                    data: {
                        _method: 'GET',
                        id: id,
                        status: status,
                    },
                    success: (response) => {
                        if (response.status == 'success') {
                            Swal.fire({
                                toast: true,
                                text: 'Changed Successfully!',
                                position: 'top-right',
                                icon: 'success',
                                iconColor: 'white',
                                customClass: {
                                    popup: 'success-toast'
                                },
                                showConfirmButton: false,
                                timer: 1500,
                                timerProgressBar: true
                            });
                            $('.dataTable').DataTable().ajax.reload(function() {
                                $('.select2').select2({
                                    minimumResultsForSearch: -1
                                });
                            });
                        }
                    }
                });
            });
        });
</script>
@endpush