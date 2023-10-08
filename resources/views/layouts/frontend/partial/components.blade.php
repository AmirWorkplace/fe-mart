<div class="verticalmenu-overlay"></div>
<div class="verticalmenu-content show d-lg-none">
    <div class="verticalmenu-wrapper">
        <nav class="verticalmenu">
            <ul class="verticalmenu-list">
                @isset($menus)
                @foreach ($menus->where('position', 'sidebar')->first()->rootItems as $rootItem)
                    <li class="verticalmenu-item has-sub">
                        
                        @isset($rootItem->category->slug)
                            <a class="verticalmenu-link" href="{{ Route('frontend.products', $rootItem->category->slug) }}"
                                title="{{ $rootItem->category->name }}">
                                <i class="hasicon nov-icon"
                                    style="background:url({{ asset($rootItem->category->image) }}) no-repeat scroll center center;"></i>
                                {{ $rootItem->category->name }}
                            </a>
                        @endisset
                        
                        @if (count($rootItem->children) > 0)
                            <span class="show-sub fa-active-sub"></span>
                            <div class="dropdown-submenu">
                                <ul class="dropdown-submenu__list">
                                    @foreach ($rootItem->children as $child)
                                        <li class="dropdown-submenu__item">
                                            
                                            @isset($child->category->slug)
                                                <a class="dropdown-submenu__link"
                                                    href="{{ Route('frontend.products', $child->category->slug) }}"
                                                    title="{{ $child->category->name }}">
                                                    {{ $child->category->name }}
                                                </a>
                                            @endisset

                                            @if (count($child->children) > 0)
                                                <span class="show-sub fa-active-sub"></span>
                                                <div class="dropdown-submenu">
                                                    <ul class="dropdown-submenu__list">
                                                        @foreach ($child->children as $child)
                                                            <li class="dropdown-submenu__item">
                                                                <a class="dropdown-submenu__link"
                                                                    href="{{ Route('frontend.products', $child->category->slug) }}"
                                                                    title="{{ $child->category->name }}">{{ $child->category->name }}</a>
                                                            </li>
                                                        @endforeach
                                                    </ul>
                                                </div>
                                            @endif
                                        </li>
                                    @endforeach
                                </ul>
                            </div>
                        @endif
                    </li>
                @endforeach
                @endisset
                
            </ul>
        </nav>
    </div>
</div>
<!-- End Mobile Category Menu -->

<div class="mobile-main_menu">
    <div class="box-header d-flex justify-content-between align-items-center">
        <div class="title-box">Menu</div>
        <div class="close-box mobile-menu__close">Close</div>
    </div>
    <div class="box-body">
        <nav class="mobile-nav">
            <ul class="mobile-nav__list">
                <li class="mobile-nav__item">
                    <a href="{{ Route('frontend.home') }}" class="main-link" title="Home"><i
                            class="zmdi zmdi-home"></i>Home</a>
                </li>
                <li class="mobile-nav__item">
                    <a href="#" class="main-link" title="About Us">
                        <i class="zmdi zmdi-file-text"></i>About Us</a>
                </li>
                <li class="mobile-nav__item">
                    <a href="#" class="main-link" title="Product Category">
                        <i class="zmdi zmdi-assignment"></i>Product Category</a>
                </li>
                <li class="mobile-nav__item">
                    <a href="#" class="main-link" title="Daily deals">
                        <i class="zmdi zmdi-tag"></i>Daily deals</a>
                </li>
                <li class="mobile-nav__item">
                    <a href="#" class="main-link" title="Blog">
                        <i class="zmdi zmdi-library"></i>Blog</a>
                </li>
                <li class="mobile-nav__item">
                    <a href="#" class="main-link" title="Contact Us">
                        <i class="fas fa-envelope-open text-xxs"></i>Contact Us</a>
                </li>
            </ul>
        </nav>
    </div>
</div>
<!-- End Mobile Main Menu -->

<div class="sticky-footer d-lg-none">
    <div class="row g-0">
        <div class="col text-center text-muted">
            <a href="{{ Route('frontend.home') }}" class="sticky-footer__item">
                <i class="icon-house"></i>
                <span>Home</span>
            </a>
        </div>
        <div class="col text-center text-muted">
            <a href="{{ Route('customer.wishlist') }}" class="sticky-footer__item">
                <i class="far fa-heart"></i>
                <span>Wishlist</span>
            </a>
        </div>
        <div class="col text-center text-muted">
            <a href="{{ Route('customer.cart') }}" class="sticky-footer__item">
                <i class="shopping-cart"></i>
                <span>My Cart</span>
            </a>
        </div>
        <div class="col text-center text-muted">
            <a href="{{ Route('customer.profile') }}" class="sticky-footer__item">
                <i class="icon-settings"></i>
                <span>Setting</span>
            </a>
        </div>
        <div class="col text-center text-muted">
            <a href="#" class="sticky-footer__item scrollToTop">
                <i class="icon-arrow-up"></i>
                <span>On Top</span>
            </a>
        </div>
    </div>
</div>
<!-- End Sticky Footer Menu -->

{{-- <div id="page-preloader">
    <div class="page-loading">
        <div class="loader">
            <div class="shadow-slider"></div>
            <div class="box-slider"></div>
        </div>
    </div>
</div> --}}
<!-- End Page Loader -->

<button class="scrollTop scrollToTop" type="button" data-target="html">
    <i class="far fa-long-arrow-alt-up"></i>
</button>
