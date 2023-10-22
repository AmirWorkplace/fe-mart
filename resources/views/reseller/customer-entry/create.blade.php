@extends('layouts.admin.app')

@section('content')
<div class="row g-3">
    <div class="col-12">
        <form action="{{ Route('admin.customer-entry.store') }}" method="POST" enctype="multipart/form-data">
            @csrf
            <div class="card">
                <div class="card-header px-3 py-2">
                    <div class="d-flex justify-content-between align-items-center">
                        <h6 class="h6 mb-0 text-uppercase">Customer Entry</h6>
                        <a href="{{ Route('admin.customer-entry.index') }}" class="btn btn-primary btn-sm text-uppercase">
                            Go Back
                        </a>
                    </div>
                </div>
                <div class="card-body p-4">
                    <div class="row g-3">
                        <div class="col-12">
                            <label for="name" class="form-label require"><b>Customer Name</b></label>
                            <input type="text" placeholder="Customer Name" class="form-control custom-input" id="name" name="name" required>
                        </div>
                        <input type="hidden" name="reseller_id" value="{{ Auth::id() }}">
                        <div class="col-12">
                            <label for="phone" class="form-label require"><b>Customer Phone</b></label>
                            <input type="number" placeholder="Customer Phone" class="form-control custom-input" id="phone" name="phone" required>
                        </div>
                        <div class="col-12">
                            <label for="email" class="form-label require"><b>E-mail</b></label>
                            <input type="email" placeholder="email@gmail.com" class="form-control custom-input" id="email" name="email">
                        </div> 
                        <div class="col-12">
                            <label for="address" class="form-label require"><b>Address</b></label>
                            <textarea name="address" id="address" cols="30" rows="10" class="form-control custom-input" placeholder="Address"></textarea>
                        </div> 
                    </div>
                </div>

                <div class="card-footer text-end px-3 py-2">
                    <button type="submit" class="btn btn-primary btn-sm">Save</button>
                </div>
            </div>
        </form>
    </div>
</div>
@endsection