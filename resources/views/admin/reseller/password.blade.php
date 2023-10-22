@extends('layouts.admin.app')

@section('content')
<div class="row g-3">
    <div class="col-12">
        <form action="{{ Route('admin.reseller.password-update', $id) }}" method="POST">
            @csrf
            @method('PUT')
            <div class="card">
                <div class="card-header p-3">
                    <div class="d-flex justify-content-between align-items-center">
                        <h6 class="h6 mb-0 text-uppercase">Change Password</h6>
                        <a href="{{ Route('admin.reseller.index') }}" class="btn btn-primary btn-sm text-uppercase">Go Back</a>
                    </div>
                </div>
                <div class="card-body p-4">
                    <div class="row g-3">
                        <div class="col-12">
                            <label for="old_password" class="form-label require"><b>Current Password</b></label>
                            <input type="password" class="form-control custom-input" id="old_password" name="old_password" placeholder="@*#$*****" password>
                        </div>

                        <div class="col-12">
                            <label for="password" class="form-label require"><b>New Password</b></label>
                            <input type="password" class="form-control custom-input" id="password" name="password" placeholder="@*#$*****" password>
                        </div>

                        <div class="col-12">
                            <label for="confirm_password" class="form-label require"><b>Confirm New Password</b></label>
                            <input type="password" class="form-control custom-input" id="confirm_password" name="confirm_password" placeholder="@*#$*****" password>
                        </div>

                        <div class="form-check form-switch">
                            <input class="form-check-input" type="checkbox" id="flexSwitchCheckChecked" show-password>
                            <label class="form-check-label px-2 pt-1" for="flexSwitchCheckChecked">Show Password</label>
                        </div>
                    </div>
                </div>
                <div class="card-footer text-end p-3">
                    <button type="submit" class="btn btn-primary btn-sm">Update</button>
                </div>
            </div>
        </form>
    </div>
</div>
@endsection

@push('js')
    <script>
        $('[show-password]').change(function(){
            if($('[show-password]').prop("checked")){
                $('[password]').attr('type', 'text');
            }else{
                $('[password]').attr('type', 'password');
            }
        });
    </script>
@endpush