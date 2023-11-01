@php
    $current_month = date('Y-m-01');
    $next_month = date('Y-m-t');
@endphp

@extends('layouts.admin.app')
 
@section('content')
<div class="row g-3">
    <div class="col-12">
        <div class="card">
            <div class="card-header px-3 py-2">
                <div class="d-flex justify-content-between align-items-center">
                    <h6 class="h6 mb-0 text-uppercase">Total Income/Expense of Project </h6>
                    <form action="#" class="flex-shrink-0 d-flex gap-2" method="GET" id="filter_form">
                        <input type="date" id="start_date" name="start_date" value="{{ date('Y-m-01') }}" required class="form-control">
                        <input type="date" id="end_date" name="end_date" value="{{ date('Y-m-t') }}" required class="form-control"> 
                        <button type="submit" class="btn btn-sm btn-primary px-4">Filter</button>
                    </form>
                </div>
                <form id="process-button" class="d-flex mt-3 justify-content-between align-items-center">
                    <h6 class="h6 mb-0 text-uppercase">
                        <!-- TOTAL INCOME/EXPENSE OF PROJECT -->
                    </h6>
                    <button type="submit" class="btn btn-success btn-sm text-uppercase">
                        Process
                    </button>
                </form> 
            </div>
            <div class="card-body">
                <table class="dataTable table align-middle" style="width:100%">
                    <thead>
                        <tr class="text-nowrap">
                             <th>Date</th>
                             <th>Description</th>
                             <th>Withdraw</th>
                             <th>Deposit</th>
                             <th>Balance</th>
                        </tr>
                    </thead>
                    <tbody></tbody> 
                </table>
            </div>
        </div>
    </div>
</div>

@endsection

@push('js')
<script type="text/javascript">
    $(document).ready(function() {

        var table =  $('.dataTable').dataTable({
            processing: true,
            serverSide: true,
            scrollX: true,
            ajax: {
                url: "{{ route('admin.statement.index') }}",
                type: "GET",
                data: function (d) {
                    d._method = 'POST';
                    d.start_date = $('#start_date').val();
                    d.end_date = $('#end_date').val();
                },
            },
            columns: [
                {
                    data: 'date',
                    name: 'date'
                }, 
                {
                    data: 'description',
                    name: 'description'
                }, 
                {
                    data: 'withdraw',
                    name: 'withdraw'
                },
                {
                    data: 'deposit',
                    name: 'deposit'
                },
                {
                    data: 'balance',
                    name: 'balance'
                },
            ]
        });

        $('#filter_form').submit(function (event) {
            event.preventDefault();
            $('.dataTable').DataTable().ajax.reload()
        });

        $('#process-button').submit(function(e){
            e.preventDefault();

            $.ajax({ 
                url: "{{ route('admin.reseller_orders_cashback') }}",
                method: 'GET', 
                type: 'GET', 
                success: function(response) {
                    response.status && window.location.reload();
                },
                error: function(xhr, status, error) {
                    console.error(error);
                }
            }) 
        })
    });
</script>
@endpush

