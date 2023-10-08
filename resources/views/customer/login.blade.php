@extends('layouts.frontend.app')
@section('content')
    @include('layouts.frontend.partial.breadcrumb', [
        'title' => 'Login',
        'link' => '',
    ])
    <section class="login-section py-5 bg-white">
        <div class="container">
            <div class="block-form-login">
                <div class="account_page_title text-center">Login</div>
                <div class="block-sociallogin text-center mb-4">
                    <div class="title_sociallogin">Login using social network:</div>
                    <a class="btn btn-sociallogin-facebook col">
                        <i class="zmdi zmdi-facebook me-2"></i>
                        Facebook
                    </a>
                </div>
                <p class="text-center title_sociallogin mb-3">Or Insert your account information:</p>
                <form id="login-form" action="{{ Route('customer.login') }}" method="POST">
                    @csrf
                    <div class="input-group email mb-2">
                        <input class="form-control" type="text" id="email_or_phone" name="email_or_phone"
                            placeholder="Email or Phone" value="{{ old('email_or_phone') }}" required>
                    </div>
                    <div class="input-group password">
                        <input class="form-control" type="password" id="password" name="password" placeholder="Password"
                            value="{{ old('password') }}" pattern=".{5,}" required>
                        <span class="input-group-btn">
                            <button class="btn show-password" type="button"
                                data-text-show="<i class='zmdi zmdi-eye-off'></i>"
                                data-text-hide="<i class='zmdi zmdi-eye'></i>">
                                <i class="zmdi zmdi-eye-off"></i>
                            </button>
                        </span>
                    </div>
                    <div class="forgot-password text-center">
                        <i class="zmdi zmdi-email"></i>&nbsp; Forgot your &nbsp;
                        <a href="#" rel="nofollow">
                            <span>Password</span>&nbsp;?
                        </a>
                    </div>
                    <div class="form-footer">
                        <button class="btn btn-primary" type="submit">Login</button>
                    </div>
                </form>
                <div class="no-account">
                    <a class="fw-500" href="{{ Route('customer.register') }}"> No account? Create one here</a>
                </div>
            </div>
        </div>
    </section>
    <!-- End Login Section -->
@endsection

@push('js')
    <script type="text/javascript">
        $(document).ready(function() {
            $(document).on('click', '.show-password', function(e) {
                if ($(this).closest('.password').find('input').attr('type') == 'password') {
                    $(this).closest('.password').find('input').attr('type', 'text');
                    let icon = $(this).data('text-hide');
                    $(this).html(icon)
                } else {
                    $(this).closest('.password').find('input').attr('type', 'password');
                    let icon = $(this).data('text-show');
                    $(this).html(icon)
                }
            });
        });
    </script>
@endpush
