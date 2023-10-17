{{-- <footer class="footer-section">
    <div class="container-fluid">
        <div class="footer-wrapper">
            <div class="footer-top">
                <div class="row g-4">
                    <div class="col-lg-6">
                        <div class="row g-4">
                            @foreach ($menus->where('position', 'footer')->get() as $menu)
                                <div class="col-sm-4 col-6">
                                    <h5 class="h5 footer-title">{{ $menu->name }}</h5>
                                    <ul class="footer-links">
                                        @foreach ($menu->items as $item)
                                            <li><a class="footer-link"
                                                    href="{{ !is_null($item->category_id) ? Route('frontend.products', $item->category->slug) : Route('frontend.page', $item->page->slug) }}">{{ $item->name }}</a>
                                            </li>
                                        @endforeach
                                    </ul>
                                </div>
                            @endforeach
                            <div class="col-6 d-sm-none">
                                <h5 class="h5 footer-title">Opening Hours</h5>
                                @if (!is_null($setting))
                                    <div class="footer-description">{!! $setting->description !!}</div>
                                @endif
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="row g-4">
                            <div class="col-sm-6 d-sm-block d-none">
                                <h5 class="h5 footer-title">Opening Hours</h5>
                                @if (!is_null($setting))
                                    <div class="footer-description">{!! $setting->description !!}</div>
                                @endif
                            </div>
                            <div class="col-sm-6">
                                <h5 class="h5 footer-title">Contact us</h5>
                                <div class="footer-info__list">
                                    <div class="data d-flex"><i class="fa fa-home"></i>
                                        <div class="me-2"><b>Address:</b></div>
                                        <div>{{ !is_null($setting) ? $setting->address : '' }}</div>
                                    </div>
                                    <div class="data d-flex"><i class="fa fa-phone"></i>
                                        <div class="me-2"><b>Hotline:</b></div>
                                        @if (!is_null($setting))
                                            <div>
                                                {{ $setting->primary_mobile }}
                                                @if (!is_null($setting->secondary_mobile))
                                                    <br>
                                                    {{ $setting->secondary_mobile }}
                                                @endif
                                            </div>
                                        @endif
                                    </div>
                                    <div class="data d-flex"><i class="fa fa-envelope"></i>
                                        <div class="me-2"><b>Email:</b></div>
                                        @if (!is_null($setting))
                                            <div>
                                                {{ $setting->primary_email }}
                                                @if (!is_null($setting->secondary_email))
                                                    <br>
                                                    {{ $setting->secondary_email }}
                                                @endif
                                            </div>
                                        @endif
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <div class="footer-middle">
                <div class="row g-3 g-lg-4 align-items-center">
                    <div class="col-lg-4 text-lg-start text-center">
                        <img src="{{ asset('frontend/assets/images/icons/payment.png') }}" alt="Payments">
                    </div>
                    <div class="col-lg-8">
                        <div class="subscribe">
                            <div class="subscribe__info">
                                <h5 class="h5 subscribe__title">sign up for our newsletter</h5>
                                <div class="subscribe__text">Receive email-only deals, special offers & product
                                    exclusives</div>
                            </div>
                            <div class="subscribe__form">
                                <form action="#" method="POST">
                                    <div class="input-group">
                                        <input type="text" class="form-control subscribe__input" id="email"
                                            name="email" placeholder="ENTER YOUR EMAIL...">
                                        <button class="btn subscribe__btn">SUBSCRIBE</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer-bottom">
                <div class="row g-3 align-items-center">
                    <div class="col-sm-6 text-sm-start text-center">
                        <div class="copyright">Copyright © 2019 Vinovathemes. All rights reserved.</div>
                    </div>
                    <div class="col-sm-6 text-sm-end text-center">
                        <img src="{{ asset('frontend/assets/images/icons/Secured-Icon.png') }}" alt="Icon">
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- End Footer Section --> --}}

@include('frontend.my.footer')