@extends('layouts.admin.app')

@section('content') 
<div class="row g-3 mt-1">
    <div class="row">
        <div class="card">
            <div class="card-header px-3 py-2 gap-3 mt-2">
                <div class="d-flex justify-content-between align-items-center">
                    <h6 class="h6 mb-0 text-uppercase">Balance Inquiries</h6>
                    <b class="text-uppercase">
                        <span class="px-2">Main Balance:</span> $ 
                        <span class="text-success">{{ number_format(App\Helper\AdditionalDataResource::getResellerEarning()['reserve_amount'], 2) }}</span>
                    </b>
                </div>
                <div class="d-flex justify-content-between align-items-center mt-4">
                    <h6 class="h6 mb-0 text-uppercase"></h6>
                    <a href="{{ Route('admin.withdraw.create') }}" class="btn btn-primary btn-sm text-uppercase px-2">
                        <!-- Request for withdraw -->
                        Withdraw Request
                    </a>
                </div>
            </div>
            <div class="card-body">
                <table class="dataTable table align-middle" style="width:100%">
                    <thead>
                        <tr class="text-nowrap">
                            {{-- <th width="3"></th> --}}
                            <th>Date</th>
                            <th class="text-center">Withdrawal Amount</th>
                            <th class="text-center">Withdrawal Method</th>
                            <th class="text-center">Transaction Id</th>
                            <th class="text-center">Status</th>
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
                                    data-url="{{ Route('admin.withdraw.destroy', '0') }}" id="bulk_delete"
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
                    url: "{{ Route('admin.withdraw.index') }}",
                    type: "GET",
                },
                columns: [
                    // {
                    //     data: "checkbox",
                    //     name: "checkbox",
                    //     orderable: false,
                    //     searchable: false,
                    //     width: '3'
                    // }, 
                    {
                        data: 'created_at',
                        name: 'created_at'
                    }, 
                    {
                        data: 'withdraw_amount',
                        name: 'withdraw_amount'
                    }, 
                    {
                        data: 'withdrawal_method',
                        name: 'withdrawal_method'
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
                    {
                        data: 'actions',
                        name: 'actions',
                        orderable: false,
                        searchable: false,
                        className: "text-end",
                    },
                ]
            });
        });
</script>
@endpush