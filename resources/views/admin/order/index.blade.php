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
                                <option value="Successed">Successed</option>
                                <option value="Canceled">Canceled</option>
                            </select>
                            <button type="submit" class="btn btn-sm btn-primary px-4">Filter</button>
                        </form>
                    </div>
                </div>
                <div class="card-body">
                    <table class="dataTable table align-middle" style="width:100%">
                        <thead>
                            <tr class="text-nowrap">
                                <th width="3"></th>
                                <th>Order ID</th>
                                <th>Order Date</th>
                                <th>Customer Name</th>
                                <th>Customer Phone</th>
                                <th>Order Amount</th>
                                <th>Payment Method</th>
                                <th>Order Status</th>
                                <th width="110" class="text-end">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
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
                    url: "{{ Route('admin.order.index') }}",
                    type: "GET",
                    data: function(data) {
                        data.start_date = $("#start_date").val();
                        data.end_date = $("#end_date").val();
                        data.status = $("#status").val();
                    }
                },
                columns: [{
                        data: 'DT_RowIndex',
                        name: "SL.",
                        orderable: false,
                        searchable: false,
                        width: '3'
                    },
                    {
                        data: 'order_code',
                        name: 'order_code'
                    },
                    {
                        data: 'order_date',
                        name: 'order_date',
                        orderable: false,
                        searchable: false,
                    },
                    {
                        data: 'user_name',
                        name: 'user_name'
                    },
                    {
                        data: 'user_phone',
                        name: 'user_phone'
                    },
                    {
                        data: 'total',
                        name: 'total'
                    },
                    {
                        data: 'payment_method',
                        name: 'payment_method'
                    },
                    {
                        data: 'order_status',
                        name: 'order_status'
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

            $(document).on('submit', '#filter_form', function(e) {
                e.preventDefault();
                $('.dataTable').DataTable().draw();
            });

            $(document).on('change', '.order_status', function(event) {
                event.preventDefault();
                let id = $(this).data('id');
                let status = $(this).val();
                $.ajax({
                    url: "{{ Route('admin.order.edit', '0') }}",
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
