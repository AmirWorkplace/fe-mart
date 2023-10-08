@extends('layouts.frontend.app')
@section('content')
    @include('layouts.frontend.partial.breadcrumb', [
        'title' => 'Profile',
        'link' => '',
    ])
    <section class="profile-section py-md-5 py-4 bg-white">
        <div class="container">
            <div class="row g-4">
                @include('layouts.customer.menu')
                <div class="col-lg-9 col-md-8">
                    <div class="dashboard-card">
                        <h5 class="dashboard-title">Your personal information</h5>
                        <form action="{{ Route('customer.profile') }}" method="POST">
                            @csrf
                            <div class="pb-2 font-secondary text-xs">
                                <div class="mb-4 pb-lg-2 row g-2 align-items-center">
                                    <label class="col-md-2 form-label mb-0 required">
                                        Full name
                                    </label>
                                    <div class="col-md-8">
                                        <input class="form-control" name="name" type="text"
                                            value="{{ auth()->user()->name }}" placeholder="First name" required>
                                    </div>
                                </div>
                                <div class="mb-4 pb-lg-2 row g-2 align-items-center">
                                    <label class="col-md-2 form-label mb-0 required">
                                        Email
                                    </label>
                                    <div class="col-md-8">
                                        <input class="form-control" name="email" type="email"
                                            value="{{ auth()->user()->email }}" placeholder="Email Address" required>
                                    </div>
                                </div>
                                <div class="mb-4 pb-lg-2 row g-2 align-items-center">
                                    <label class="col-md-2 form-label mb-0 required">
                                        Phone
                                    </label>
                                    <div class="col-md-8">
                                        <input class="form-control" name="phone" type="number"
                                            value="{{ auth()->user()->phone }}" placeholder="Phone Number" required>
                                    </div>
                                </div>
                                <div class="mb-4 pb-lg-2 row g-2 align-items-center">
                                    <label class="col-md-2 form-label mb-0 required">
                                        Password
                                    </label>
                                    <div class="col-md-8">
                                        <div class="input-group">
                                            <input class="form-control" name="password" type="password"
                                                placeholder="Password" required="" pattern=".{5,}">
                                            <button class="btn input-group-btn show-password" type="button"
                                                data-text-show="<i class='zmdi zmdi-eye-off'></i>"
                                                data-text-hide="<i class='zmdi zmdi-eye'></i>"><i
                                                    class="zmdi zmdi-eye-off"></i></button>
                                        </div>
                                    </div>
                                </div>
                                <div class="mb-4 pb-lg-2 row g-2 align-items-center">
                                    <label class="col-md-2 form-label mb-0">
                                        New password
                                    </label>
                                    <div class="col-md-8">
                                        <div class="input-group">
                                            <input class="form-control" name="new_password" type="password"
                                                placeholder="New Password" pattern=".{5,}">
                                            <button class="btn input-group-btn show-password" type="button"
                                                data-text-show="<i class='zmdi zmdi-eye-off'></i>"
                                                data-text-hide="<i class='zmdi zmdi-eye'></i>"><i
                                                    class="zmdi zmdi-eye-off"></i></button>
                                        </div>
                                    </div>
                                    <label class="col-md-2 text-muted text-xxs">
                                        Optional
                                    </label>
                                </div>
                                <div class="pt-2">
                                    <button type="submit" class="btn btn-primary">SAVE</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Profile Section -->
@endsection

@push('js')
    <script type="text/javascript">
        $(document).ready(function() {
            $(document).on('click', '.show-password', function(e) {
                if ($(this).closest('.input-group').find('input').attr('type') == 'password') {
                    $(this).closest('.input-group').find('input').attr('type', 'text');
                    let icon = $(this).data('text-hide');
                    $(this).html(icon)
                } else {
                    $(this).closest('.input-group').find('input').attr('type', 'password');
                    let icon = $(this).data('text-show');
                    $(this).html(icon)
                }
            });
        });
    </script>
@endpush
