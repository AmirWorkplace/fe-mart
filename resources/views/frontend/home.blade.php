@extends('layouts.frontend.app')
@section('content')
    <section class="slider-section bg-white">
        <div class="slider-area__wrapper">
            <div class="blank-area"></div>
            <div class="slider-area">
                <div class="slider-wrapper theme-default">
                    <div id="nivoSlider" class="nivoSlider">
                        @foreach ($sliders as $slide)
                            @if (!is_null($slide->link))
                                <a href="{{ $slide->link }}"><img src="{{ asset($slide->image) }}" alt="SliderImage" style="max-height: 600px; height: 100%;"></a>
                            @else
                                <img src="{{ asset($slide->image) }}" alt="SliderImage" style="max-height: 600px; height: 100%;">
                            @endif
                        @endforeach
                    </div>
                </div>
            </div>
            <div class="banner-area">
                @if (!is_null($setting))
                    @if (file_exists($setting->banner_one))
                        <div>
                            <a href="{{ $setting->banner_one_link }}">
                                <img src="{{ asset($setting->banner_one) }}" alt="home banner 1" width="100%">
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
                                <a href="{{ Route('frontend.flash-deal', $flash_deal->slug) }}">
                                    <img src="{{ asset($flash_deal->banner) }}" alt="{{ $flash_deal->title }}"
                                        title="{{ $flash_deal->title }}">
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
                                                        <a
                                                            href="{{ Route('frontend.single-deal-product', ['deal' => $flash_deal->slug, 'slug' => $item->product->slug]) }}">
                                                            <img src="{{ asset($item->product->thumbnail) }}"
                                                                alt="{{ $item->product->name }}"></a>
                                                    </div>
                                                    <div class="product-card__content">
                                                        <h6 class="product-card__title"><a
                                                                href="{{ Route('frontend.single-deal-product', ['deal' => $flash_deal->slug, 'slug' => $item->product->slug]) }}">{{ $item->product->name }}</a>
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
                                                                if ($item->discount_type == 'amount') {
                                                                    $discounted_price = $item->product->price->sale_price - $item->discount;
                                                                } else {
                                                                    $discount = ($item->product->price->sale_price / 100) * $item->discount;
                                                                    $discounted_price = $item->product->price->sale_price - floor($discount);
                                                                }
                                                            @endphp
                                                            <del class="price text-muted">৳
                                                                {{ number_format($item->product->price->sale_price) }}</del>
                                                            <span class="price">৳
                                                                {{ number_format($discounted_price) }}</span>
                                                        </div>
                                                        <a class="product-card__link"
                                                            href="{{ Route('frontend.single-deal-product', ['deal' => $flash_deal->slug, 'slug' => $item->product->slug]) }}">
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

    <!-- Started Offer Products -->
    @include('frontend.my.offer_products')
    <!-- Ended Offer Products -->

    <!-- Started Featured Category Section -->
    @include('frontend.my.featured_category_section')
    <!-- Ended Featured Category Section -->


    @if (count($product_sections) > 0) 
        <section id="wrapper-site">
            <div class="container-fluid">
                <div class="row g-5">
                    @foreach ($product_sections as $key => $section)
                        <div class="col-12">
                            <div class="product-sidebar__wrapper">
                                <div class="product-sidebar__area d-flex flex-column justify-content-between">
                                    <div class="flex-grow-1" style="background-color: #e8f2f7;">
                                        <h2 class="title_block">
                                            
                                            @if ($section->category->image && file_exists($section->category->image))
                                                <img src="{{ asset($section->category->image) }}" 
                                                    alt="{{ $section->category->name }}">
                                            @endif
                                            
                                            <span>{{ $section->category->name }}</span>
                                        </h2>
                                        <ul class="sidebar-category__list">
                                            
                                            @foreach ($section->category->limitChildren as $key => $child)
                                                @if ($key > 8)
                                                    @break
                                                @endif
                                                
                                                <li>
                                                    <a class="sidebar-category__link" 
                                                        href="{{ Route('frontend.products', $child->slug) }}">{{ $child->name }}
                                                    </a>
                                                </li>
                                            @endforeach
                                        </ul>
                                    </div>
                                <!-- </div> -->
                                @if ($section->second_row_content == 'product')
                                    <div class="sidebar-brands">
                                        <div class="row g-0">
                                            @php
                                                $brand_id = $section->brand_ids ? json_decode($section->brand_ids) : [0];
                                                $section_brands = App\Models\Brand::whereIn('id', [0])->get();
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
                            <div class="product__area">
                                <nav class="filter-tab__btns style__one">
                                    <div class="nav nav-tabs filter-nav__tabs" id="nav-tab" role="tablist">
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
                                <div class="tab-content" id="nav-tabContent">

                                    @php
                                        $category_ids = [strval($section->category->id)];
                                        foreach ($section->category->children as $child) {
                                            $category_ids[] = strval($child->id);
                                            foreach ($child->children as $child) {
                                                $category_ids[] = strval($child->id);
                                            }
                                        }

                                        $new_arrival_products = App\Helper\AdditionalDataResource::getParentCategoryProducts($category_ids, 'new_arrival');

                                        $best_seller_products = App\Helper\AdditionalDataResource::getParentCategoryProducts($category_ids, 'best_seller');

                                        $featured_products = App\Helper\AdditionalDataResource::getParentCategoryProducts($category_ids, 'featured');
                                    @endphp

                                    <div class="tab-pane fade show active" id="nav-{{ $key }}-new-arrivals"
                                        role="tabpanel" aria-labelledby="nav-{{ $key }}-new-arrivals-tab">
                                        <div class="carousel product-card__carousel" data-timeout="4000"
                                            data-rows="{{ $section->second_row_content == 'product' ? '2' : '1' }}"
                                            data-arrows="false" data-dots="false" data-autoplay="true"
                                            data-infinite="true" data-items="5" data-xl-items="4" data-lg-items="3"
                                            data-md-items="3" data-sm-items="2" data-xs-items="2">
                                            @foreach ($new_arrival_products as $product)
                                                @include('components.product_card', ["product"=> $product, "normal"=> true])
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
                                                @include('components.product_card', ["product"=> $product, "normal"=> true])
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
                                                @include('components.product_card', ["product"=> $product, "normal"=> true])
                                            @endforeach
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        @if ($section->second_row_content == 'banner')
                            <div class="product-sidebar__wrapper">
                                <div class="product-sidebar__area">
                                    <div class="sidebar-brands">
                                        <div class="row g-0">
                                            @php
                                                $section_brands = App\Models\Brand::whereIn('id', json_decode($section->brand_ids))->get();
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
                    </div>
                @endforeach
            </div>
        </div>
    @endif
</section>
<!-- End Main Section -->

@if (count($brands) > 0)
    <section class="py-md-5 pb-4 bg-white">
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
@endif

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

        // banner area's images height accusation
        $('[alt="SliderImage"]').height($($('[alt="SliderImage"]')[0]).height() + 'px');
        $('.banner-area img').height($($('[alt="SliderImage"]')[0]).height() / 2 + 'px');
        $('.small.text-muted.text-nowrap.showing.mb-0').remove()
    });
</script>
@endpush
 
{{-- @include('frontend.my.home') --}}
