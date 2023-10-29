@php 
    $last_earning = App\Helper\AdditionalDataResource::getResellerEarning()['reserve_amount'];
@endphp

@extends('layouts.admin.app')

@section('content')
<div class="row g-3">
    <div class="col-12">
        <form action="{{ Route('admin.withdraw.update', $data->id) }}" method="POST" enctype="multipart/form-data">
            @csrf
            @method('PUT')
            <div class="card">
                <div class="card-header px-3 py-2 gap-3 mt-2">
                    <div class="d-flex justify-content-between align-items-center">
                        <h6 class="h6 mb-0 text-uppercase">Balance Inquiries</h6>
                        <b class="text-uppercase">
                            <span class="px-2">Main Balance:</span> $ 
                            <span class="text-success">{{ number_format($last_earning, 2) }}</span>
                        </b>
                    </div>
                    <div class="d-flex justify-content-between align-items-center mt-4">
                        <h6 class="h6 mb-0 text-uppercase"></h6>
                        <a href="{{ Route('admin.withdraw.index') }}" class="btn btn-primary btn-sm text-uppercase">
                            Go Back 
                        </a>
                    </div>
                </div>
                <div class="card-body p-4">
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label for="name" class="form-label require"><b>Withdrawal Method</b></label>
                            <select class="select form-control custom-select" id="payment_method" name="payment_method">
                                {{-- <option value="{{ $data->withdrawal_method }}" selected></option> --}}
                                <option value="cash" {{ $data->withdrawal_method == 'cash' ? 'selected' : '' }}>Hand Cash</option>
                                <option value="bkash" {{ $data->withdrawal_method == 'bkash' ? 'selected' : '' }}>Bkash</option>
                                <option value="nagad" {{ $data->withdrawal_method == 'nagad' ? 'selected' : '' }}>Nagad</option>
                                <option value="bank" {{ $data->withdrawal_method == 'bank' ? 'selected' : '' }}>Bank</option>
                                <option value="rocket" {{ $data->withdrawal_method == 'rocket' ? 'selected' : '' }}>Rocket</option>
                                <option value="upay" {{ $data->withdrawal_method == 'upay' ? 'selected' : '' }}>Upay</option>
                            </select>
                        </div>
                        <input type="hidden" name="total_earning" value="{{ $last_earning }}">
                        <div class="show-account col-md-6" id="show_payment_method">{!! $account !!}</div>
                        <div class="col-md-6">
                            <label for="phone" class="form-label require"><b>Withdraw Amount</b></label>
                            <input type="withdraw_amount" placeholder="0.00" class="form-control custom-input" id="withdraw_amount" name="withdraw_amount"
                            value="{{ $data->withdraw_amount }}" required>
                        </div>
                        <div class="col-md-6">
                            <label for="password" class="form-label require"><b>Your Password</b></label>
                            <input type="password" placeholder="password@gmail.com" class="form-control custom-input" id="password" name="password" required>
                        </div> 
                    </div>
                </div>

                <div class="card-footer text-end px-3 py-2">
                    <button type="submit" class="btn btn-primary btn-sm">Update Request</button>
                </div>
            </div>
        </form>
    </div>
</div>
@endsection

@push('js')
    <script>
        $(document).ready(function(){
            $('#payment_method').change(function(){
                $.ajax({
                    url: "{{ route('admin.reseller.show_payment_method') }}",
                    method: 'POST',
                    data: { payment_method: $('#payment_method').val() },

                    success: function(response){
                        if(response.status){
                            $("#show_payment_method").html(response.data)
                        }
                        console.log(response);
                    },

                    error: function(error){
                        console.log(error);
                    }
                })
            })
        });
    </script>
    
@endpush