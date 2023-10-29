@extends('layouts.admin.app')

@section('content') 
<div class="row g-3 mt-1">
    <div class="row">
        <div class="card">
            <div class="card-header px-3 py-2 gap-3 mt-2">
                {{-- <div class="d-flex justify-content-between align-items-center">
                    <h6 class="h6 mb-0 text-uppercase">Balance Inquiries</h6>
                    <b class="text-uppercase">
                        <span class="px-2">Main Balance:</span> $ 
                        <span class="text-success">{{ number_format(App\Helper\AdditionalDataResource::getResellerEarning()['reserve_amount'], 2) }}</span>
                    </b>
                </div>
                <div class="d-flex justify-content-between align-items-center mt-4">
                    <h6 class="h6 mb-0 text-uppercase"></h6>
                    <a href="{{ Route('admin.withdraw.create') }}" class="btn btn-primary btn-sm text-uppercase px-2">
                        Withdraw Request
                    </a>
                </div> --}}
            </div>
            <div class="card-body">
                <table class="dataTable table align-middle" style="width:100%">
                    <thead>
                        <tr class="text-nowrap"> 
                            <th>Date</th>
                            <th>Reseller Name</th>
                            <th class="text-center">Withdrawal Method</th>
                            <th class="text-center">Account Number</th>
                            <th class="text-center">Withdrawal Amount</th>
                            <th class="text-center">Transaction Id</th>
                            <th>Status</th>
                            {{-- <th width="110" class="text-end">Actions</th> --}}
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
                    url: "{{ Route('admin.withdraw.index') }}",
                    type: "GET",
                },
                columns: [ 
                    {
                        data: 'created_at',
                        name: 'created_at'
                    }, 
                    {
                        data: 'reseller_name',
                        name: 'reseller_name'
                    }, 
                    {
                        data: 'withdrawal_method',
                        name: 'withdrawal_method'
                    },
                    {
                        data: 'account_number',
                        name: 'account_number'
                    }, 
                    {
                        data: 'withdraw_amount',
                        name: 'withdraw_amount'
                    }, 
                    {
                        data: 'transaction_id',
                        name: 'transaction_id'
                    },
                    {
                        data: 'status',
                        name: 'status',
                        orderable: false,
                        searchable: false,
                    },
                    // {
                    //     data: 'actions',
                    //     name: 'actions',
                    //     orderable: false,
                    //     searchable: false,
                    //     className: "text-end",
                    // },
                ]
            });

            $(document).on('change', '.withdraw_status', function(event) {
                event.preventDefault();
                let id = $(this).data('id');
                let status = $(this).val();

                $.ajax({
                    url: "{{ Route('admin.withdraw.edit', '0') }}",
                    type: 'POST',
                    data: {
                        _method: 'GET',
                        id: id,
                        status: status,
                        type: 'status'
                    },
                    success: (response) => {
                        console.log(response);
                        if (response.status) {
                            Swal.fire({
                                toast: true,
                                text: response.message,
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
                    },

                    error: (error) => console.log(error),
                });
            });

            $(document).on('change', '.input_transaction_id', function(event) {
                event.preventDefault();
                let id = $(this).data('id');
                let transaction_id = $(this).val();

                $.ajax({
                    url: "{{ Route('admin.withdraw.edit', '0') }}",
                    type: 'POST',
                    data: {
                        _method: 'GET',
                        id,
                        transaction_id,
                        type: 'transaction_id',
                    },
                    success: (response) => {
                        console.log(response);
                        if (response.status) {
                            Swal.fire({
                                toast: true,
                                text: response.message,
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
                    },

                    error: (error) => console.log(error),
                });
            });
        });
</script>
@endpush