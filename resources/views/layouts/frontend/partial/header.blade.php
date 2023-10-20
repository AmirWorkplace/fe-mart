{{-- <header class="header">
    <div class="d-lg-block d-none header-top">
        <div class="container-fluid">
            <div class="row justify-content-between align-items-center">
                <div class="col-lg-3 col-md-4 col-sm-3">
                    <a href="{{ Route('frontend.home') }}">
                        <img class="logo"
                            src="{{ !is_null($setting) ? asset($setting->logo) : asset('frontend/assets/images/logo/logo.png') }}"
                            alt="Logo">
                    </a>
                </div>
                <div class="col-lg-9 col-md-8 col-sm-3">
                    <nav class="desktop-menu">
                        <ul class="desktop-menu__list">
                            <li class="desktop-menu__item {{ Route::is('frontend.home') ? 'active' : '' }}">
                                <a href="{{ Route('frontend.home') }}" title="Home"><i
                                        class="zmdi zmdi-home"></i>Home</a>
                            </li>
                            <li class="desktop-menu__item">
                                <a href="#" title="About Us"><i class="zmdi zmdi-file-text"></i>About Us</a>
                            </li>
                            <li class="desktop-menu__item"><a href="#" title="Product Category"><i
                                        class="zmdi zmdi-assignment"></i>Product Category</a>
                            </li>
                            <li class="desktop-menu__item"><a href="#" title="Daily deals"><i
                                        class="zmdi zmdi-tag"></i>Daily deals</a>
                            </li>
                            <li class="desktop-menu__item">
                                <a href="#" title="Blog"><i class="zmdi zmdi-library"></i>Blog</a>
                            </li>
                            <li class="desktop-menu__item">
                                <a href="#" title="Contact Us"><i
                                        class="fas fa-envelope-open text-xxs"></i>Contact Us</a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
    <div class="d-lg-block d-none header-center py-2">
        <div class="container-fluid">
            <div class="d-flex justify-content-between align-items-center">
                <ul class="d-flex mb-0">
                    @if (!is_null($setting))
                        <li class="list-inline-item d-inline-flex align-items-center gap-2 me-4"><i
                                class="novicon novicon-email"></i><a href="mailto:{{ $setting->primary_email }}">Email :
                                {{ $setting->primary_email }}</a></li>
                        <li class="list-inline-item d-inline-flex align-items-center gap-2"><i
                                class="novicon novicon-phone"></i><a href="tel:1234-567-899">Hotline :
                                {{ $setting->primary_mobile }}</a></li>
                    @endif
                </ul>
                <div class="d-flex align-items-center">
                    <ul class="list-inline mb-0 header-social">
                        @if (!is_null($setting))
                            @if ($setting->facebook_page)
                                <li class="list-inline-item mb-0"><a class="header-social__link" target="_blank"
                                        href="{{ $setting->facebook_page }}"><i class="fab fa-facebook-f"></i></a>
                                </li>
                            @endif
                            @if ($setting->twitter)
                                <li class="list-inline-item mb-0"><a class="header-social__link" target="_blank"
                                        href="{{ $setting->twitter }}"><i class="fab fa-twitter"></i></a></li>
                            @endif
                            @if ($setting->youtube)
                                <li class="list-inline-item mb-0"><a class="header-social__link" target="_blank"
                                        href="{{ $setting->youtube }}"><i class="fab fa-youtube"></i></a></li>
                            @endif
                            @if ($setting->google)
                                <li class="list-inline-item mb-0"><a class="header-social__link" target="_blank"
                                        href="{{ $setting->google }}"><i class="fab fa-google"></i></a></li>
                            @endif
                            @if ($setting->linkedin)
                                <li class="list-inline-item mb-0"><a class="header-social__link" target="_blank"
                                        href="{{ $setting->linkedin }}"><i class="fab fa-linkedin-in"></i></a>
                                </li>
                            @endif
                            @if ($setting->whatsapp)
                                <li class="list-inline-item mb-0"><a class="header-social__link" target="_blank"
                                        href="{{ $setting->whatsapp }}"><i class="fab fa-whatsapp"></i></a></li>
                            @endif
                        @endif
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="d-lg-block d-none header-bottom">
        <div class="header-bottom-inner">
            <div class="header-bottom__area-wrapper">
                <div class="vertical-menu">
                    <div
                        class="toggle-nav d-flex align-items-center {{ Route::is('frontend.home') ? 'active' : '' }}">
                        <span class="btnov-lines"></span>
                        <span>Shop By Categories</span>
                    </div>
                    <div class="verticalmenu-content {{ Route::is('frontend.home') ? 'show' : '' }}">
                        <div class="verticalmenu-wrapper">
                            <nav class="verticalmenu">
                                <ul class="verticalmenu-list">
                                    @isset($menus)
                                        
                                    @foreach ($menus->where('position', 'sidebar')->first()->rootItems as $rootItem)
                                        <li
                                            class="verticalmenu-item {{ count($rootItem->children) > 0 ? 'has-sub' : '' }}">
                                            <a class="verticalmenu-link"
                                                href="{{ Route('frontend.products', $rootItem->category->slug) }}"
                                                title="{{ $rootItem->category->name }}">
                                                <i class="hasicon nov-icon"
                                                    style="background:url({{ asset($rootItem->category->image) }}) no-repeat scroll center center;"></i>
                                                {{ $rootItem->category->name }}
                                            </a>
                                            @if (count($rootItem->children) > 0)
                                                <span class="show-sub fa-active-sub"></span>
                                                <div class="verticalmenu-submenu">
                                                    <ul class="verticalmenu-submenu__list">
                                                        @foreach ($rootItem->children as $child)
                                                            <li class="verticalmenu-submenu__item">
                                                                <a class="verticalmenu-submenu__link"
                                                                    href="{{ Route('frontend.products', $child->category->slug) }}"
                                                                    title="{{ $child->category->name }}">{{ $child->category->name }}</a>
                                                                @if (count($child->children) > 0)
                                                                    <span class="show-sub fa-active-sub"></span>
                                                                    <div class="verticalmenu-submenu">
                                                                        <ul class="verticalmenu-submenu__list">
                                                                            @foreach ($child->children as $child)
                                                                                <li class="verticalmenu-submenu__item">
                                                                                    <a class="verticalmenu-submenu__link"
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
                </div>
                <div class="header-search__desktop">
                    <div id="desktop_search">
                        <form method="get" action="{{ Route('frontend.search') }}" id="searchbox"
                            class="desktop_search__form">
                            <div class="search-input__group">
                                <div class="search-category">
                                    <select name="search_category" id="search_category" class="select"
                                        data-placeholder="CATEGORIES">
                                        <option value="">All Categories</option>
                                        @foreach ($header_categories as $header_category)
                                            <option value="{{ $header_category->slug }}"
                                                {{ isset($category) && $category->id == $header_category->id ? 'selected' : '' }}>
                                                {{ $header_category->name }}</option>
                                            @foreach ($header_category->children->where('status', 1) as $child)
                                                <option value="{{ $child->slug }}"
                                                    {{ isset($category) && $category->id == $child->id ? 'selected' : '' }}>
                                                    -- {{ $child->name }}</option>
                                                @foreach ($child->children->where('status', 1) as $child)
                                                    <option value="{{ $child->slug }}"
                                                        {{ isset($category) && $category->id == $child->id ? 'selected' : '' }}>
                                                        -- -- {{ $child->name }}
                                                    </option>
                                                @endforeach
                                            @endforeach
                                        @endforeach
                                    </select>
                                </div>
                                <input type="text" class="form-control search-input" name="search"
                                    placeholder="Enter Your Keyword..."
                                    value="{{ isset($search_string) ? $search_string : '' }}">
                                <button class="btn btn-secondary search-btn" type="submit"><i
                                        class="material-icons">search</i></button>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="header-elements">
                    <div class="header-cart">
                        <div class="cart-toggle">
                            <i class="material-icons shopping-cart">shopping_cart</i>
                            <div class="">
                                <span class="title-cart">My Cart</span>
                                <span class="cart-products-count"><span
                                        class="cart_count">{{ !is_null($cart) ? count($cart) : '0' }}</span><span>
                                        items</span></span>
                            </div>
                        </div>
                        <div class="cart_block">
                            <div class="cart-block-content">
                                <ul class="cart_items" id="cart_items">
                                    @php
                                        $cart_total_price = 0;
                                    @endphp
                                    @if (is_null($cart) || count($cart) == 0)
                                        <li class="no-items" id="no_items">
                                            No products in the cart
                                        </li>
                                    @else
                                        @foreach ($cart as $key => $item)
                                            @php
                                                $cart_total_price += $item['price'] * $item['qty'];
                                            @endphp
                                            <li class="cart_item" id="cart_item_{{ $key }}">
                                                <div class="cart_item_media">
                                                    <div class="cart_item_image">
                                                        <img src="{{ asset($item['image']) }}"
                                                            alt="{{ $item['name'] }}" title="{{ $item['name'] }}">
                                                        <a href="#" class="cart_item_remove remove_item"
                                                            rel="nofollow" title="remove from cart"
                                                            data-id="{{ $key }}">
                                                            <i class="far fa-trash-alt"></i>
                                                        </a>
                                                    </div>
                                                    <div class="cart_item_body">
                                                        <div class="cart_item_name">
                                                            <a
                                                                href="{{ Route('frontend.single-product', $item['slug']) }}">{{ $item['name'] }}</a>
                                                        </div>
                                                        <div>
                                                            <span class="cart_item_price">৳{{ $item['price'] }}</span>
                                                            <span class="cart_item_quantity"> x
                                                                <span
                                                                    id="item_qty_{{ $key }}">{{ $item['qty'] }}</span></span>
                                                        </div>
                                                        <div class="d-flex gap-2">
                                                            <span class="flex-shrink-0 d-flex gap-1">
                                                                @foreach ($item['attribute'] as $key => $attribute)
                                                                    @if ($loop->iteration != 1)
                                                                        ,
                                                                    @endif
                                                                    <span>{{ $key }} : </span>
                                                                    <span>{{ $attribute }}</span>
                                                                @endforeach
                                                            </span>
                                                        </div>
                                                    </div>
                                                </div>
                                            </li>
                                        @endforeach
                                    @endif
                                </ul>
                            </div>
                            <div id="cart-footer-area"
                                style="display: {{ is_null($cart) || count($cart) == 0 ? 'none' : 'block' }}">
                                <div class="cart-total">
                                    <span class="label">SubTotal:</span>
                                    <span class="value">৳ <span
                                            class="total_cart_price">{{ number_format($cart_total_price, 2) }}</span></span>
                                </div>
                                <div class="cart-buttons">
                                    <a href="{{ Route('customer.checkout') }}"
                                        class="btn btn-primary btn-checkout">Check out</a>
                                    <a href="{{ Route('customer.cart') }}" class="btn btn-primary btn-cart">View
                                        cart</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="header-account">
                        <div class="toggle-group-account"> <span class="btnov-lines"></span></div>
                        <ul class="account-list-content">
                            @guest
                                <li class="account-list__item">
                                    <a class="account-list__link" href="{{ Route('customer.login') }}" rel="nofollow"
                                        title="Log in to your customer account"><i class="fas fa-sign-in"></i><span>Sign
                                            in</span></a>
                                </li>
                                <li class="account-list__item">
                                    <a class="account-list__link" href="{{ Route('customer.register') }}" rel="nofollow"
                                        title="Register Account"><i class="fas fa-user"></i><span>Register
                                            Account</span></a>
                                </li>
                            @else
                                <li class="account-list__item">
                                    <a class="account-list__link" href="{{ Route('customer.profile') }}" rel="nofollow"
                                        title="Log in to your customer account"><i class="fas fa-cog"></i><span>My
                                            Account</span></a>
                                </li>
                                <li class="account-list__item">
                                    <a class="account-list__link" href="{{ Route('customer.cart') }}" rel="nofollow"
                                        title="Cart"><i class="fas fa-shopping-cart text-xxs"></i><span>Cart</span></a>
                                </li>
                                <li class="account-list__item">
                                    <a class="account-list__link" href="{{ Route('customer.checkout') }}" rel="nofollow"
                                        title="Checkout"><i
                                            class="material-icons">check_circle</i><span>Checkout</span></a>
                                </li>
                                <li class="account-list__item">
                                    <a class="account-list__link" href="{{ Route('customer.orders') }}" rel="nofollow"
                                        title="Checkout"><i class="zmdi zmdi-time-restore"></i><span>Orders
                                            History</span></a>
                                </li>
                                <li class="account-list__item">
                                    <a class="account-list__link" href="{{ Route('customer.wishlist') }}"
                                        title="My Wishlists">
                                        <i class="fas fa-heart"></i><span>My Wishlists</span>
                                    </a>
                                </li>
                                <li class="account-list__item">
                                    <a class="account-list__link" href="{{ Route('customer.logout') }}"
                                        title="My Wishlists">
                                        <i class="fas fa-sign-out-alt"></i><span>Logout</span>
                                    </a>
                                </li>
                            @endguest
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="mobile-header d-lg-none">
        <div class="container-fluid">
            <div class="mobile-header__wrapper">
                <div class="d-flex align-items-center flex-shrink-0">
                    <div class="mobile-cateogry__toggler text-lg text-white"><i class="zmdi zmdi-sort-amount-asc"></i>
                    </div>
                    <div class="mobile_logo overflow-hidden">
                        <a href="{{ Route('frontend.home') }}">
                            <img class="logo-mobile"
                                src="{{ !is_null($setting) ? asset($setting->footer_logo) : asset('frontend/assets/images/logo/logo2.png') }}"
                                style="max-height: 30px; max-width: 80px;" alt="Prestashop DigiMart">
                        </a>
                    </div>
                </div>
                <div class="mobile-search flex-grow-1">
                    <form method="get" action="{{ Route('frontend.search') }}" id="searchbox_2"
                        class="mobile-search__form">
                        <div class="input-group">
                            <input type="hidden" name="search_category">
                            <input type="text" id="search_query_top" class="form-control mobile-search__input"
                                name="search" placeholder="Enter Your Keyword..." autocomplete="off"
                                value="{{ isset($search_string) ? $search_string : '' }}">
                            <button class="btn mobile-search__btn" type="submit"><i
                                    class="far fa-search"></i></button>
                        </div>
                    </form>
                </div>
                <div class="mobile-menu__toggler text-lg text-white flex-shrink-0"><i
                        class="zmdi zmdi-view-headline"></i></div>
            </div>
        </div>
    </div>
</header> --}}
<!-- End Header -->  

@include('frontend.my.header')