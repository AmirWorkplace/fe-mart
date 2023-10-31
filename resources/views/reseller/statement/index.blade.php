
@php 
   $reseller_inquiries = App\Helper\AdditionalDataResource::getResellerEarning();
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
                        <input type="date" id="start_date" name="start_date" value="{{ date('Y-m-d', strtotime($current_month)) }}" required class="form-control">
                        <input type="date" id="end_date" name="end_date" value="{{ date('Y-m-d', strtotime($next_month)) }}" required class="form-control">
                        {{-- <select name="status" id="status" class="form-select">
                            <option value="">Select Status</option>
                            <option value="Pending">Pending</option>
                            <option value="Confirmed">Confirmed</option>
                            <option value="Processing">Processing</option>
                            <option value="Delivered">Delivered</option>
                            <option value="Successed">Succeed</option>
                            <option value="Canceled">Canceled</option>
                        </select> --}}
                        <button type="submit" class="btn btn-sm btn-primary px-4">Filter</button>
                    </form>
                </div>
            </div>
            <div class="card-body">
                <table class="dataTable table align-middle" id="dataTable" style="width:100%">
                    <thead>
                        <tr class="text-nowrap">
                            <th>Date</th>
                            <th>Description</th>
                            <th class="text-center">Withdraw</th>
                            <th class="text-center">Deposit</th>
                            {{-- <th class="text-center">Cashback</th> ($item['previous_earning'] + $item['deposit'])--}}
                            <th class="text-center">Balance</th>
                        </tr>
                    </thead>
                    <tbody id="table-body">
                        @foreach ($data as $item)
                            <tr>
                                <td>{{ Carbon\Carbon::parse($item['date'])->format('Y-m-d | H:i:s A') }}</td>
                                <td style="word-break: break-all; max-width: 300px;">{{ $item['description'] }}</td>
                                <td class="text-center">{{ $item['withdraw'] }} Tk.</td>
                                <td class="text-center">{{ $item['deposit'] }} Tk.</td>
                                {{-- <td class="text-center">{{ $item['cashback'] }} Tk.</td> --}}
                                {{-- <td class="text-center">{{ $item['previous_earning'] }} Tk.</td> --}}
                                {{-- @php 
                                    $balance = App\Helper\AdditionalDataResource::getBalance($item['order_id'], $item['withdraw_id'], $item['date']);
                                @endphp --}}
                                <td class="text-center">{{ ($item['previous_earning'] + $item['deposit']) - $item['withdraw'] }} Tk.</td>
                            </tr>
                        @endforeach
                    </tbody>
                    {{-- <tfoot class="bg-success">
                        <tr class=""> 
                          <th class="text-light">Total</th>
                          <th></th>
                          <th></th>
                          <th class="text-light text-center">{{ number_format($reseller_inquiries['target_value']) }} Tk.</th>
                          <th class="text-light text-center">{{ number_format($reseller_inquiries['resale_value']) }} Tk.</th>
                        </tr>
                    </tfoot> --}}
                </table>
            </div>
        </div>
    </div>
</div>

@endsection

@push('js')
    <script>
        $(document).ready(function(){
            $('#dataTable').DataTable({
                order: false, 
            });

            $('#filter_form').submit(function(event){
                event.preventDefault();

                $.ajax({
                    url: "{{ route('admin.statement.index') }}",
                    type: 'GET',
                    method: 'GET',
                    data: {
                        _method: 'POST',
                        start_date: $('#start_date').val(),
                        end_date: $('#end_date').val()
                    },

                    success: function(response){
                        const date = (prevDate = '') => new Date(prevDate);

                        if(response.status){
                            const html = response.data.map(item => `
                                <tr>
                                    <td>${ date(item.date).toDateString() + ' | ' + date(item.date).toLocaleTimeString() }</td>
                                    <td style="word-break: break-all; max-width: 300px;">${item.description}</td>
                                    <td class="text-center">${item.withdraw} Tk.</td>
                                    <td class="text-center">${item.deposit} Tk.</td>
                                    <td class="text-center">${ (item.previous_earning + item.deposit) - item.withdraw} Tk.</td>
                                </tr>
                            `);

                            $('#table-body').html(html.join(""));
                        }else{
                            console.log(response);
                            $('#dataTable #table-body').html(response.message);
                        }
                    },

                    error: function(error){
                        console.log(error); 
                    }
                })
            });
        });
    </script>
@endpush

{{-- @push('js')
<script type="text/javascript">
  $(document).ready(function() {
    var table = $('.dataTable').dataTable({
        processing: true,
        serverSide: true,
        scrollX: true,
        ajax: {
            url: "{{ Route('admin.statement.index') }}",
            type: "GET",
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
            url: "{{ Route('admin.reseller-commission.edit', '0') }}",
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
// .done(function(response) {
    // !response.status && $('#dataTable #table-body').html(response?.message);
        // console.log(response);
    // Success callback
    // $('#table-body').html(response.message);
// })
        // if(!response.status) return $('#dataTable #table-body').html(response?.message);
        // console.log(response);
        // console.log(response);{ { Carbon\Carbon::parse($item['date'])->format('Y-m-d | H:i:s A') }}
        // $('table-body').html();
        // console.log(response.data); --}}