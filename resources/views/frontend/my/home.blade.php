@extends('layouts.frontend.app')
@section('content')
    <section class="slider-section bg-white">
        <div class="slider-area__wrapper">
            <div class="blank-area"></div>
            <div class="slider-area">
                <div class="slider-wrapper theme-default">
                    <div id="nivoSlider" class="nivoSlider">
                        @foreach ($sliders as $slide)
                            @php
                                $link = isset($slide->link) ? $slide->link : "#";
                                $image = isset($slide->image) ? asset($slide->image) : "#";
                            @endphp
                            @if (!is_null($link))
                                <a href="{{ $link }}"><img src="{{ $image }}" alt="Slide Image"></a>
                            @else
                                <img src="{{ $image }}" alt="Slide Image">
                            @endif
                        @endforeach
                    </div>
                </div>
            </div>
            <div class="banner-area">
                @if (isset($setting) && !is_null($setting))
                    @if (file_exists($setting->banner_one))
                        <div>
                            <a href="{{ $setting->banner_one_link }}">
                                <img src="{{ asset($setting->banner_one) }}" alt="home banner 1">
                            </a>
                        </div>
                    @endif
                    @if (file_exists($setting->banner_two))
                        <pre></pre>
                        <div class="d-sm-block d-none">
                            <a href="{{ $setting->banner_two_link }}">
                                <img src="{{ asset($setting->banner_two) }}" alt="home banner 2">
                            </a>
                        </div>
                    @endif
                @endif
            </div>
        </div>
    </section>
    <!-- End SLider Section -->

    @if (!is_null($flash_deal))
        <section class="offer-section pb-4" style="background-color: #d2e6f0;">
            <div class="container-fluid">
                <div class="deal-week__wrapper">
                    <div class="deal-week__title">
                        <img src="{{ asset('frontend/assets/images/icons/deal.png') }}" alt="icon title">
                        <span>{{ $flash_deal->title }}</span>
                    </div>
                    <div class="row g-4">
                        <div class="col-xl-3 col-md-5 col-lg-4">
                            <div class="deal-week__banner">
                                @php 
                                    $slug = isset($flash_deal->slug) ? $flash_deal->slug : "-";
                                    $banner = isset($flash_deal->banner) ? asset($flash_deal->banner) : "#";
                                    $title = isset($flash_deal->title) ? $flash_deal->title : "#";
                                @endphp

                                <a href="{{ Route('frontend.flash-deal', ) }}">
                                    <img src="{{ $banner }}" alt="{{ $title }}"
                                        title="{{ $title }}">
                                </a>
                            </div>
                        </div>
                        <div class="col-xl-9 col-lg-8 col-md-7">
                            <div class="deal-week__product">
                                @if (count($flash_deal->items) > 0)
                                    <div class="carousel product-card__carousel" data-timeout="4000" data-rows="1"
                                        data-arrows="false" data-dots="false" data-autoplay="true" data-infinite="true"
                                        data-items="5" data-xl-items="4" data-lg-items="3" data-md-items="3"
                                        data-sm-items="2" data-xs-items="2">
                                        @foreach ($flash_deal->items as $item)
                                            <div>
                                                <div class="product-card bg-white">
                                                    <div class="product-card__image">
                                                        @php
                                                            $f_slug = isset($flash_deal->slug) ? $flash_deal->slug : "-";
                                                            $p_slug = isset($item->product->slug) ? $item->product->slug : "-";
                                                            $thumbnail = isset($item->product->thumbnail) ? asset($item->product->thumbnail) : "#";
                                                            $name = isset($item->product->name) ? $item->product->name : "#";
                                                        @endphp

                                                        <a
                                                            href="{{ Route('frontend.single-deal-product', ['deal' => $f_slug, 'slug' => $p_slug]) }}">
                                                            <img src="{{ $thumbnail }}" alt="{{ $name }}">
                                                        </a>
                                                    </div>
                                                    <div class="product-card__content">
                                                        <h6 class="product-card__title"><a
                                                                href="{{ Route('frontend.single-deal-product', ['deal' => $f_slug, 'slug' => $p_slug]) }}">{{ $name }}</a>
                                                        </h6>
                                                        <div class="product-card__review">
                                                            <div class="star_content">
                                                                <div class="star"></div>
                                                                <div class="star"></div>
                                                                <div class="star"></div>
                                                                <div class="star"></div>
                                                                <div class="star"></div>
                                                            </div>
                                                            <span>( 0 review )</span>
                                                        </div>
                                                        <div class="product-card__price">
                                                            @php
                                                                $sale_price = isset($item->product->price->sale_price) ? $item->product->price->sale_price : 0;

                                                                $item_discount = isset($item->discount) ? $item->discount : 0;

                                                                if ($item->discount_type == 'amount') {
                                                                    $discounted_price = $sale_price - $item_discount;
                                                                } else {
                                                                    $discount = ($sale_price / 100) * $item_discount;
                                                                    $discounted_price = $sale_price - floor($discount);
                                                                }
                                                            @endphp
                                                            <del class="price text-muted">৳
                                                                {{ number_format($sale_price) }}</del>
                                                            <span class="price">৳
                                                                {{ number_format($discounted_price) }}</span>
                                                        </div>
                                                        <a class="product-card__link"
                                                            href="{{ Route('frontend.single-deal-product', ['deal' => $f_slug, 'slug' => $p_slug]) }}">
                                                            <i class="novicon-cart"></i>
                                                            <span>Select option</span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        @endforeach
                                    </div>
                                @else
                                    <p class="alert alert-info">No products at this time.</p>
                                @endif
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Offer Section -->
    @endif

    <section class="py-md-5 py-4 bg-light">
        <div class="container-fluid">
            <h3 class="h3 mb-4 text-uppercase text-center">Shop by Categories</h3>
            <div class="pb-2">
                <div class="carousel category-carousel" data-items="9" data-xl-items="7" data-lg-items="5" data-md-items="4"
                    data-sm-items="3" data-xs-items="3" data-arrows="true" data-infinite="true" data-dots="false"
                    data-timeout="5000">
                    @foreach ($featured_categories as $featured_category)

                        @php
                            $fc_slug = isset($featured_category->slug) ? $featured_category->slug : '-';
                            $fc_name = isset($featured_category->name) ? $featured_category->name : '-';
                            $fc_pdt = isset($featured_category->products) ? $featured_category->products : 0;
                            $fc_img = isset($featured_category->image) && file_exists($featured_category->image) ? asset($featured_category->image) : asset('frontend/assets/images/icons/deal.png');
                        @endphp

                        <div class="px-sm-3 px-2">
                            <div class="featured-category">
                                <figure class="featured-category__image">
                                    <a href="{{ Route('frontend.products', $fc_slug) }}">
                                        <img class="lazyload"
                                            data-src="{{ $fc_img }}"
                                            alt="{{ $fc_name }}" width="124" height="124">
                                    </a>
                                </figure>
                                <div class="featured-category__text">
                                    <a href="#" class="featured-category__link">{{ $fc_name }}</a>
                                    <div class="text-xxs fw-400 text-muted pt-1">{{ count($fc_pdt) }}
                                        Item(s)</div>
                                </div>
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>
        </div>
    </section>
    <!-- End Featured Category Section -->

    <section id="wrapper-site">
        <div class="container-fluid">
            <div class="row g-5">
                @foreach ($product_sections as $key => $section)
                    @php
                        $image = isset($section->category->image) ? asset($section->category->image) : '#';
                        $name = isset($section->category->name) ? $section->category->name : '';
                    @endphp

                    <div class="col-12" style="display: flex; margin-bottom: 20px; padding: 10px;">
                        <div class="product-sidebar__wrapper">
                            <div style="max-width: 100%; width: 100%; flex: 1;" class="product-sidebar__area d-flex flex-column justify-content-between">
                                <div class="flex-grow-1" style="background-color: #e8f2f7;">
                                    <h2 class="title_block">
                                        <img src="{{ $image }}" alt="{{ $name }}">
                                        <span>{{ $name }}</span>
                                    </h2>
                                    <ul class="sidebar-category__list">
                                        
                                        @isset($section->category->limitChildren)
                                            @foreach ($section->category->limitChildren as $key => $child)
                                                @if ($key > 8)
                                                    @break
                                                @endif
                                                <li>
                                                    <a class="sidebar-category__link" href="{{ Route('frontend.products', $child->slug) }}">{{ $child->name }}</a>
                                                </li>
                                            @endforeach
                                        @endisset

                                    </ul>
                                </div>
                                @if ($section->second_row_content == 'product')
                                    <div class="sidebar-brands">
                                        <div class="row g-0">
                                            @php
                                                $get_section_brands = App\Models\Brand::whereIn('id', json_decode($section->brand_ids))->get();

                                                $section_brands = isset($get_section_brands) ? $get_section_brands : [];
                                            @endphp
                                            @foreach ($section_brands as $brand)
                                                <div class="col-6 sidebar-brands__item text-center">
                                                    <a href="{{ Route('frontend.brand-products', $brand->slug) }}">
                                                        <img src="{{ asset($brand->image) }}" alt="{{ $brand->name }}">
                                                    </a>
                                                </div>
                                            @endforeach
                                        </div>
                                    </div>
                                @endif
                            </div>
                        </div> <!-- </div> added new -->
                        <div class="product__area" style="padding-right: 12px;">
                            <nav class="filter-tab__btns style__one">
                                <div class="nav nav-tabs filter-nav__tabs px-3" id="nav-tab" role="tablist">
                                    <button class="nav-link active" id="nav-{{ $key }}-new-arrivals-tab"
                                        data-bs-toggle="tab" data-bs-target="#nav-{{ $key }}-new-arrivals"
                                        type="button" role="tab"
                                        aria-controls="nav-{{ $key }}-new-arrivals" aria-selected="true">New
                                        Arrivals</button>
                                    <button class="nav-link" id="nav-{{ $key }}-best-sellers-tab"
                                        data-bs-toggle="tab" data-bs-target="#nav-{{ $key }}-best-sellers"
                                        type="button" role="tab"
                                        aria-controls="nav-{{ $key }}-best-sellers"
                                        aria-selected="false">Best
                                        Sellers</button>
                                    <button class="nav-link" id="nav-{{ $key }}-featured-products-tab"
                                        data-bs-toggle="tab"
                                        data-bs-target="#nav-{{ $key }}-featured-products" type="button"
                                        role="tab" aria-controls="nav-{{ $key }}-featured-products"
                                        aria-selected="false">Featured
                                        Products</button>
                                </div>
                            </nav>
                            
                            @if(isset($section->category->children) && !is_null($section->category->children))
                                <div class="tab-content" id="nav-tabContent">
                                    @php
                                        $category_ids = [$section->category->id];
                                        foreach ($section->category->children as $child) {
                                            $category_ids[] = $child->id;
                                            foreach ($child->children as $child) {
                                                $category_ids[] = $child->id;
                                            }
                                        }
                                        $new_arrival_products = App\Models\Product::with(['price'])
                                            ->whereIn('category_id', $category_ids)
                                            ->where('status', 1)
                                            ->where('product_type', 'new_arrival')
                                            ->inRandomOrder()
                                            ->limit(50)
                                            ->get();
                                        $best_seller_products = App\Models\Product::with(['price'])
                                            ->whereIn('category_id', $category_ids)
                                            ->where('status', 1)
                                            ->where('product_type', 'best_seller')
                                            ->inRandomOrder()
                                            ->limit(50)
                                            ->get();
                                        $featured_products = App\Models\Product::with(['price'])
                                            ->whereIn('category_id', $category_ids)
                                            ->where('status', 1)
                                            ->where('product_type', 'featured')
                                            ->inRandomOrder()
                                            ->limit(50)
                                            ->get();
                                    @endphp
                                    <div class="tab-pane fade show active" id="nav-{{ $key }}-new-arrivals"
                                        role="tabpanel" aria-labelledby="nav-{{ $key }}-new-arrivals-tab">
                                        <div class="carousel product-card__carousel" data-timeout="4000"
                                            data-rows="{{ $section->second_row_content == 'product' ? '2' : '1' }}"
                                            data-arrows="false" data-dots="false" data-autoplay="true"
                                            data-infinite="true" data-items="5" data-xl-items="4" data-lg-items="3"
                                            data-md-items="3" data-sm-items="2" data-xs-items="2">
                                            @foreach ($new_arrival_products as $product)
                                                <div>
                                                    <div class="product-card">
                                                        <div class="product-card__image">
                                                            <a
                                                                href="{{ Route('frontend.single-product', $product->slug) }}">
                                                                <img src="{{ asset($product->thumbnail) }}"
                                                                    alt="{{ $product->name }}"></a>
                                                            <div class="product-card__action">
                                                                <a href="#" class="quick-view"
                                                                    data-id="{{ $product->id }}">
                                                                    <i class="far fa-search"></i>
                                                                </a>
                                                                @auth
                                                                    <a class="addToWishlist" href="#"
                                                                        data-id="{{ $product->id }}">
                                                                        <i class="far fa-heart"></i>
                                                                    </a>
                                                                @endauth
                                                            </div>
                                                        </div>
                                                        <div class="product-card__content">
                                                            <h6 class="product-card__title"><a
                                                                    href="{{ Route('frontend.single-product', $product->slug) }}">{{ $product->name }}</a>
                                                            </h6>
                                                            <div class="product-card__review">
                                                                <div class="star_content">
                                                                    <div class="star"></div>
                                                                    <div class="star"></div>
                                                                    <div class="star"></div>
                                                                    <div class="star"></div>
                                                                    <div class="star"></div>
                                                                </div>
                                                                <span>( 0 review )</span>
                                                            </div>
                                                            <div class="product-card__price">
                                                                @if ($product->price->sale_price != $product->price->regular_price)
                                                                    <del class="price">৳
                                                                        {{ number_format($product->price->regular_price) }}</del>
                                                                @endif
                                                                <span class="price">৳
                                                                    {{ number_format($product->price->sale_price) }}</span>
                                                            </div>
                                                            <a class="product-card__link"
                                                                href="{{ Route('frontend.single-product', $product->slug) }}">
                                                                <i class="novicon-cart"></i>
                                                                <span>Select option</span>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            @endforeach
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="nav-{{ $key }}-best-sellers" role="tabpanel"
                                        aria-labelledby="nav-{{ $key }}-best-sellers-tab">
                                        <div class="carousel product-card__carousel" data-timeout="4000"
                                            data-rows="{{ $section->second_row_content == 'product' ? '2' : '1' }}"
                                            data-arrows="false" data-dots="false" data-autoplay="true"
                                            data-infinite="true" data-items="5" data-xl-items="4" data-lg-items="3"
                                            data-md-items="3" data-sm-items="2" data-xs-items="2">
                                            @foreach ($best_seller_products as $product)
                                                <div>
                                                    <div class="product-card">
                                                        <div class="product-card__image">
                                                            <a
                                                                href="{{ Route('frontend.single-product', $product->slug) }}">
                                                                <img src="{{ asset($product->thumbnail) }}"
                                                                    alt="{{ $product->name }}"></a>
                                                            <div class="product-card__action">
                                                                <a href="#" class="quick-view"
                                                                    data-id="{{ $product->id }}">
                                                                    <i class="far fa-search"></i>
                                                                </a>
                                                                @auth
                                                                    <a class="addToWishlist" href="#"
                                                                        data-id="{{ $product->id }}">
                                                                        <i class="far fa-heart"></i>
                                                                    </a>
                                                                @endauth
                                                            </div>
                                                        </div>
                                                        <div class="product-card__content">
                                                            <h6 class="product-card__title"><a
                                                                    href="{{ Route('frontend.single-product', $product->slug) }}">{{ $product->name }}</a>
                                                            </h6>
                                                            <div class="product-card__review">
                                                                <div class="star_content">
                                                                    <div class="star"></div>
                                                                    <div class="star"></div>
                                                                    <div class="star"></div>
                                                                    <div class="star"></div>
                                                                    <div class="star"></div>
                                                                </div>
                                                                <span>( 0 review )</span>
                                                            </div>
                                                            <div class="product-card__price">
                                                                @if ($product->price->sale_price != $product->price->regular_price)
                                                                    <del class="price">৳
                                                                        {{ number_format($product->price->regular_price) }}</del>
                                                                @endif
                                                                <span class="price">৳
                                                                    {{ number_format($product->price->sale_price) }}</span>
                                                            </div>
                                                            <a class="product-card__link"
                                                                href="{{ Route('frontend.single-product', $product->slug) }}">
                                                                <i class="novicon-cart"></i>
                                                                <span>Select option</span>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            @endforeach
                                        </div>
                                    </div>
                                    <div class="tab-pane fade" id="nav-{{ $key }}-featured-products"
                                        role="tabpanel" aria-labelledby="nav-{{ $key }}-featured-products-tab">
                                        <div class="carousel product-card__carousel" data-timeout="4000"
                                            data-rows="{{ $section->second_row_content == 'product' ? '2' : '1' }}"
                                            data-arrows="false" data-dots="false" data-autoplay="true"
                                            data-infinite="true" data-items="5" data-xl-items="4" data-lg-items="3"
                                            data-md-items="3" data-sm-items="2" data-xs-items="2">
                                            @foreach ($featured_products as $product)
                                                <div>
                                                    <div class="product-card">
                                                        <div class="product-card__image">
                                                            <a
                                                                href="{{ Route('frontend.single-product', $product->slug) }}">
                                                                <img src="{{ asset($product->thumbnail) }}"
                                                                    alt="{{ $product->name }}"></a>
                                                            <div class="product-card__action">
                                                                <a href="#" class="quick-view"
                                                                    data-id="{{ $product->id }}">
                                                                    <i class="far fa-search"></i>
                                                                </a>
                                                                @auth
                                                                    <a class="addToWishlist" href="#"
                                                                        data-id="{{ $product->id }}">
                                                                        <i class="far fa-heart"></i>
                                                                    </a>
                                                                @endauth
                                                            </div>
                                                        </div>
                                                        <div class="product-card__content">
                                                            <h6 class="product-card__title"><a
                                                                    href="{{ Route('frontend.single-product', $product->slug) }}">{{ $product->name }}</a>
                                                            </h6>
                                                            <div class="product-card__review">
                                                                <div class="star_content">
                                                                    <div class="star"></div>
                                                                    <div class="star"></div>
                                                                    <div class="star"></div>
                                                                    <div class="star"></div>
                                                                    <div class="star"></div>
                                                                </div>
                                                                <span>( 0 review )</span>
                                                            </div>
                                                            <div class="product-card__price">
                                                                @if ($product->price->sale_price != $product->price->regular_price)
                                                                    <del class="price">৳
                                                                        {{ number_format($product->price->regular_price) }}</del>
                                                                @endif
                                                                <span class="price">৳
                                                                    {{ number_format($product->price->sale_price) }}</span>
                                                            </div>
                                                            <a class="product-card__link"
                                                                href="{{ Route('frontend.single-product', $product->slug) }}">
                                                                <i class="novicon-cart"></i>
                                                                <span>Select option</span>
                                                            </a>
                                                        </div>
                                                    </div>
                                                </div>
                                            @endforeach
                                        </div>
                                    </div>
                                </div>
                            @endif
                        </div>
                    </div>
                    @if ($section->second_row_content == 'banner')
                        <div class="product-sidebar__wrapper p-3">
                            <div class="product-sidebar__area">
                                <div class="sidebar-brands">
                                    <div class="row g-0">
                                        @php
                                            $get_section_brands = App\Models\Brand::whereIn('id', json_decode($section->brand_ids))->get();

                                            $section_brands = isset($get_section_brands) ? $get_section_brands : [];
                                        @endphp
                                        @foreach ($section_brands as $brand)
                                            <div class="col-6 sidebar-brands__item text-center">
                                                <a href="{{ Route('frontend.brand-products', $brand->slug) }}">
                                                    <img src="{{ asset($brand->image) }}" alt="{{ $brand->name }}">
                                                </a>
                                            </div>
                                        @endforeach
                                    </div>
                                </div>
                            </div>
                            <div class="product__area">
                                @if ($section->second_row_content == 'banner' && file_exists($section->banner_two))
                                    <div class="row g-0">
                                        <div class="col-sm-6">
                                            <a href="{{ $section->banner_one_link }}">
                                                <img class="product-banner" src="{{ asset($section->banner_one) }}"
                                                    alt="Banner Image">
                                            </a>
                                        </div>
                                        <div class="col-sm-6">
                                            <a href="{{ $section->banner_two_link }}">
                                                <img class="product-banner" src="{{ asset($section->banner_two) }}"
                                                    alt="Banner Image">
                                            </a>
                                        </div>
                                    </div>
                                @elseif ($section->second_row_content == 'banner' && !file_exists($section->banner_two))
                                    <div class="row g-0">
                                        <div class="col-12">
                                            <a href="{{ $section->banner_one_link }}">
                                                <img class="product-banner" src="{{ asset($section->banner_one) }}"
                                                    alt="Banner Image">
                                            </a>
                                        </div>
                                    </div>
                                @endif
                            </div>
                        </div>
                    @endif
                @endforeach
                  {{-- </div> --}}
            </div>
        </div>
    </section>
<!-- End Main Section -->

<section class="pb-md-5 pb-4 bg-white mt-3">
    <div class="container-fluid">
        <h3 class="h3 mb-4 text-uppercase text-center">Our Brands</h3>
        <div class="pt-2">
            <div class="carousel brand-carousel" data-items="8" data-xl-items="6" data-lg-items="5"
                data-md-items="4" data-sm-items="3" data-arrows="true" data-rows="2">
                @foreach ($brands as $brand)
                    <div class="pe-2 pb-2">
                        <a href="{{ Route('frontend.brand-products', $brand->slug) }}"
                            class="border d-block text-reset py-sm-2 px-3 hov-shadow-md rounded-3 bg-white overflow-hidden shadow-sm">
                            <img data-src="{{ asset($brand->image) }}" alt="{{ $brand->name }}"
                                class="img-contain lazyload w-100" height="60">
                        </a>
                    </div>
                @endforeach
            </div>
        </div>
    </div>
</section>
<!-- End Brands Section -->
@endsection

@push('js')
<script type="text/javascript">
    $(document).ready(function() {
        if ($("#nivoSlider").length) {
            $('#nivoSlider').nivoSlider({
                effect: 'random', // Specify sets like: 'fold,fade,sliceDown'
                slices: 1, // For slice animations
                boxCols: 12, // For box animations
                boxRows: 6, // For box animations
                animSpeed: 600, // Slide transition speed
                pauseTime: 7000, // How long each slide will show
                startSlide: 0, // Set starting Slide (0 index)
                directionNav: false, // Next & Prev navigation
                controlNav: true, // 1,2,3... navigation
                controlNavThumbs: false, // Use thumbnails for Control Nav
                pauseOnHover: true, // Stop animation while hovering
                manualAdvance: false, // Force manual transitions
                prevText: 'Prev', // Prev directionNav text
                nextText: 'Next', // Next directionNav text
                randomStart: false, // Start on a random slide
                beforeChange: function() {

                }, // Triggers before a slide transition
                afterChange: function() {

                }, // Triggers after a slide transition
                slideshowEnd: function() {

                }, // Triggers after all slides have been shown
                lastSlide: function() {

                }, // Triggers when last slide is shown
                afterLoad: function() {
                    $(".nov_preload").hide();
                } // Triggers when slider has loaded
            });
        }

        $('button[data-bs-toggle="tab"]').on('shown.bs.tab', function(e) {
            $('.carousel').slick('setPosition');
        });
    });
</script>
@endpush
