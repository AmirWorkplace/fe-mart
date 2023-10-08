@extends('layouts.frontend.app')
@section('content')
    @include('layouts.frontend.partial.breadcrumb')
    <section class="register-section py-5 bg-white">
        <div class="container">
            <div class="block-form-login">
                <div class="account_page_title text-center">Create an Account</div>
                <div class="block-sociallogin text-center mb-3">
                    <div class="title_sociallogin">Insert your account information:</div>
                </div>
                <div class="d-flex justify-content-center gap-3 mb-3">
                    <label class="radio-inline">
                        <span class="custom-radio">
                            <input name="id_gender" type="radio" value="1">
                            <span></span>
                        </span>
                        Mr.
                    </label>
                    <label class="radio-inline">
                        <span class="custom-radio">
                            <input name="id_gender" type="radio" value="2">
                            <span></span>
                        </span>
                        Mrs.
                    </label>
                </div>
                <form id="login-form" action="{{ route('customer.register') }}" method="post">
                    @csrf
                    @method('POST')
                    <div class="input-group user mb-2">
                        <input class="form-control" name="username" type="text" placeholder="Your Name"
                            required>
                    </div>
                    <div class="input-group user mb-2">
                        <input class="form-control" name="phone" type="text" placeholder="Phone" required>
                    </div>
                    <div class="input-group email mb-2">
                        <input class="form-control" name="email" type="email" placeholder="Email" required>
                    </div> 
                    <div class="input-group password">
                        <input class="form-control" name="password" type="password" placeholder="Password" pattern=".{5,}"
                            required>
                        <span class="input-group-btn">
                            <button class="btn" type="button" data-action="show-password">
                                <i class="zmdi zmdi-eye-off"></i>
                            </button>
                        </span>
                    </div>
                    <div class="my-3 d-flex align-items-center gap-2 text-xxs">
                        <span class="custom-checkbox d-inline-flex">
                            <input name="optin" type="checkbox" id="offer-mail" value="1">
                            <span class="ps-shown-by-js"><i class="material-icons checkbox-checked">check</i></span>
                        </span>
                        <label class="cursor-pointer" for="offer-mail">Receive offers from our partners</label>
                    </div>
                    <div class="my-3 d-flex align-items-center gap-2 text-xxs">
                        <span class="custom-checkbox d-inline-flex">
                            <input name="optin" type="checkbox" id="newsletter" value="1">
                            <span class="ps-shown-by-js"><i class="material-icons checkbox-checked">check</i></span>
                        </span>
                        <label class="cursor-pointer" for="newsletter">Sign up for our newsletter<br><em
                                style="font-size: 11px;">Sign up to Newsletter and receive
                                $20 coupon for first shopping</em></label>
                    </div>
                    <div class="form-footer">
                        <button class="btn btn-primary" type="submit">Register</button>
                    </div>
                </form>
                <div class="no-account">
                    <a class="fw-500" href="./login.html"> Have an account? Login here</a>
                </div>
            </div>
        </div>
    </section>
    <!-- End Register Section -->
@endsection
