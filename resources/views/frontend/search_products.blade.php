@extends('layouts.frontend.app')
@push('css')
    <link href="https://code.jquery.com/ui/1.10.4/themes/ui-lightness/jquery-ui.css" rel="stylesheet">
@endpush
@section('content')
    @include('layouts.frontend.partial.breadcrumb', [
        'title' => !is_null($category) ? $category->name : 'Products',
        'link' => !is_null($category) ? Route('frontend.products', $category->slug) : '',
    ])
    <section class="category-product-section py-md-5 py-4 bg-white">
        <div class="container">
            <div class="row g-4" id="filter-products__wrapper">
                <div class="col-md-3">
                    <div class="sidebar-overlay"></div>
                    <div class="filter-area">
                        <form action="{{ Route('frontend.product-filter') }}" method="GET" id="filter_form">
                            @php
                                $url = $_SERVER['REQUEST_URI'];
                                $parts = parse_url($url);
                                parse_str($parts['query'], $query);
                            @endphp
                            <input type="hidden" name="search" value="{{ isset($search_string) ? $search_string : '' }}">
                            <input type="hidden" name="sort_by" value="{{ isset($sort_by) ? $sort_by : '' }}">
                            <input type="hidden" name="search_category"
                                value="{{ isset($category) ? $category->slug : '' }}">
                            <h4 class="sidebar__title">Categories</h4>
                            <div class="mb-4 pb-lg-2">
                                <ul class="category-sub-menu text-uppercase">
                                    @foreach ($categories as $cat)
                                        <li data-depth="0">
                                            <a href="{{ Route('frontend.products', $cat->slug) }}"
                                                data-slug="{{ $cat->slug }}">{{ $cat->name }}</a>
                                            @if (count($cat->children) > 0)
                                                <div class="navbar-toggler collapse-icons collapsed">
                                                    <i class="material-icons add">add</i>
                                                    <i class="material-icons remove">remove</i>
                                                </div>
                                                @php
                                                    $category_ids = [];
                                                    foreach ($cat->children as $cchild) {
                                                        $category_ids[] = $cchild->id;
                                                        if (count($cchild->children) > 0) {
                                                            foreach ($cchild->children as $dchild) {
                                                                $category_ids[] = $dchild->id;
                                                            }
                                                        }
                                                    }
                                                @endphp
                                                <div class="collapse"
                                                    style="display: {{ !is_null($category) && in_array($category->id, $category_ids) ? 'block' : 'none' }};">
                                                    <ul class="category-sub-menu__list">
                                                        @foreach ($cat->children as $child)
                                                            <li data-depth="1">
                                                                <a class="category-sub-link"
                                                                    href="{{ Route('frontend.products', $child->slug) }}"
                                                                    data-slug="{{ $child->slug }}">{{ $child->name }}</a>
                                                                @if (count($child->children) > 0)
                                                                    @php
                                                                        $category_ids = [];
                                                                        foreach ($child->children as $schild) {
                                                                            $category_ids[] = $schild->id;
                                                                        }
                                                                    @endphp
                                                                    <div class="navbar-toggler collapse-icons collapsed">
                                                                        <i class="material-icons add">add</i>
                                                                        <i class="material-icons remove">remove</i>
                                                                    </div>
                                                                    <div class="collapse"
                                                                        style="display: {{ !is_null($category) && in_array($category->id, $category_ids) ? 'block' : 'none' }};">
                                                                        <ul class="category-sub-menu__list">
                                                                            @foreach ($child->children as $child)
                                                                                <li data-depth="2"><a
                                                                                        class="category-sub-link"
                                                                                        href="{{ Route('frontend.products', $child->slug) }}"
                                                                                        data-slug="{{ $child->slug }}">{{ $child->name }}</a>
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
                                </ul>
                            </div>
                            <h4 class="sidebar__title">Catalog</h4>
                            <div class="pb-4">
                                <div class="mb-2 pb-1">
                                    <p class="text-uppercase mb-1 font-secondary fw-400" style="font-size: 10px;">Filter By
                                    </p>
                                    <button class="btn btn-tertiary">
                                        <i class="material-icons"></i>
                                        Clear all
                                    </button>
                                </div>
                                @php
                                    $attributes = \App\Models\Attribute::with('values')
                                        ->orderBy('name')
                                        ->get();
                                @endphp
                                @foreach ($attributes as $attribute)
                                <input type="hidden" name="attribute[]" value="{{ $attribute->id }}">
                                    <div class="pb-3">
                                        <h6 class="facet-title">{{ $attribute->name }}</h6>
                                        <div class="font-secondary text-xxs">
                                            <ul class="checkbox__list">
                                                @foreach ($attribute->values as $value)
                                                    <li class="checkbox__item">
                                                        <label class="facet-label"
                                                            for="facet_input_{{ $attribute->id . '_' . $value->id }}">
                                                            <span class="custom-checkbox">
                                                                <input
                                                                    id="facet_input_{{ $attribute->id . '_' . $value->id }}"
                                                                    name="attribute_{{ $attribute->id }}[]" type="checkbox"
                                                                    value="{{ $value->value }}"
                                                                    {{ isset($query['attribute_'.$attribute->id]) && in_array($value->value, $query['attribute_'.$attribute->id]) ? 'checked' : '' }}>
                                                                <span class="ps-shown-by-js">
                                                                    <i class="material-icons"></i>
                                                                </span>
                                                            </span>
                                                            <span class="js-search-link">{{ $value->value }}</span>
                                                        </label>
                                                    </li>
                                                @endforeach
                                            </ul>
                                        </div>
                                    </div>
                                @endforeach
                                {{-- <div class="pb-3">
                                    <h6 class="facet-title">AVAILABILITY</h6>
                                    <div class="font-secondary text-xxs">
                                        <ul class="checkbox__list">
                                            <li class="checkbox__item">
                                                <label class="facet-label" for="facet_input_85_1501">
                                                    <span class="custom-checkbox">
                                                        <input id="facet_input_85_1501" data-search-url="#" type="checkbox">
                                                        <span class="ps-shown-by-js">
                                                            <i class="material-icons"></i>
                                                        </span>
                                                    </span>
                                                    <span class="js-search-link">Not available
                                                    </span>
                                                </label>
                                            </li>
                                            <li class="checkbox__item">
                                                <label class="facet-label" for="facet_input_85_1502">
                                                    <span class="custom-checkbox">
                                                        <input id="facet_input_85_1502" data-search-url="#" type="checkbox">
                                                        <span class="ps-shown-by-js"><i class="material-icons"></i></span>
                                                    </span>
                                                    <span class="js-search-link">
                                                        In stock
                                                    </span>
                                                </label>
                                            </li>
                                        </ul>
                                    </div>
                                </div> --}}
                                <div class="pb-3">
                                    <h6 class="facet-title">PRICE</h6>
                                    <div class="font-secondary text-xxs">
                                        <input type="hidden" name="min_price"
                                            value="{{ isset($min_price) ? $min_price : '0' }}">
                                        <input type="hidden" name="max_price"
                                            value="{{ isset($max_price) ? $max_price : '100000' }}">
                                        <ul class="faceted-slider" data-slider-min="0" data-slider-max="100000"
                                            data-slider-unit="Tk" data-slider-label="Price"
                                            data-set-min="{{ isset($min_price) ? $min_price : '0' }}"
                                            data-set-max="{{ isset($max_price) ? $max_price : '100000' }}">
                                            <li>
                                                <div id="slider-range"></div>
                                                <div class="pt-3">
                                                    <span> Range: </span>
                                                    <span>
                                                        <span id="min-value"></span> - <span id="max-value"></span>
                                                    </span>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="pt-3">
                                    <button type="submit" class="btn btn-dark btn-xs py-2">FILTER</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="col-md-9 products-area">
                    @if (!is_null($category))
                        <h1 class="h1 category__title mb-3 pb-2">{{ $category->name }}</h1>
                    @endif
                    <div class="products-filter">
                        <div class="row g-lg-0 g-2">
                            <div class="col-md-6 col-6">
                                <div class="d-flex align-items-center">
                                    <div class="change-type bg-white">
                                        <span class="grid-type active" data-view-type="grid">
                                            <i class="fa fa-th-large"></i>
                                        </span>
                                        <span class="list-type" data-view-type="list">
                                            <i class="fa fa-bars"></i>
                                        </span>
                                    </div>
                                    <div class="d-md-block d-none total-products bg-white pe-2">
                                        <span class="font-secondary text-muted text-xxs text-uppercase">There are
                                            {{ count($products) }}
                                            products.</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-6">
                                <div class="d-flex justify-content-end">
                                    <div class="bg-white ps-2">
                                        <select name="sort" id="sort" class="select form-select">
                                            <option value="Relevance">Relevance</option>
                                            <option value="Name, A to Z">Name, A to Z</option>
                                            <option value="Name, Z to A">Name, Z to A</option>
                                            <option value="Price, low to high">Price, low to high</option>
                                            <option value="Price, high to low">Price, high to low</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-sm-3 d-md-none filter-button">
                                <button id="search_filter_toggler" class="btn btn-secondary">
                                    Filter
                                </button>
                            </div>
                        </div>
                    </div>
                    <div id="categories-product" class="pt-4">
                        <div class="products product_list row g-lg-4 g-3 grid">
                            @foreach ($products as $product)
                                <div class="col-lg-4 col-md-4 col-6">
                                    <div class="product-card">
                                        <div class="product-card__image">
                                            <a href="{{ Route('frontend.single-product', $product->slug) }}">
                                                <img src="{{ asset($product->thumbnail) }}" alt="{{ $product->name }}">
                                            </a>
                                            <div class="product-card__action">
                                                <a href="#" class="quick-view" data-id="{{ $product->id }}">
                                                    <i class="far fa-search"></i>
                                                </a>
                                                @auth
                                                    <a class="addToWishlist" href="#" data-id="{{ $product->id }}">
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
                                            <div class="product-card__price pb-md-3 pb-1">
                                                <span class="price">৳ {{ $product->price->sale_price }}</span>
                                            </div>
                                            <div class="show-on-list font-secondary pb-2">
                                                <span id="product-availability"
                                                    class="product-available text-sm mb-sm-3 mb-1 fw-500 d-sm-block d-none ms-0">
                                                    <i class="far fa-check-square text-sm"></i>
                                                    In stock
                                                </span>
                                                <div class="text-xxs mb-3 d-sm-block d-none">{!! $product->short_description !!}</div>
                                            </div>
                                            <div class="group-action">
                                                <a class="product-card__link"
                                                    href="{{ Route('frontend.single-product', $product->slug) }}">
                                                    <i class="novicon-cart"></i>
                                                    <span>Add To Cart</span>
                                                </a>
                                                <a href="#" class="quick-view" data-id="{{ $product->id }}"
                                                    data-link-action="quickview">
                                                    <i class="zmdi zmdi-search"></i> </a>
                                                @auth
                                                    <a class="addToWishlist" href="#" data-id="{{ $product->id }}">
                                                        <i class="zmdi zmdi-favorite-outline"></i>
                                                    </a>
                                                @endauth
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    </div>
                    <div>
                        {!! $products->appends(request()->input())->links('pagination::bootstrap-5') !!}
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Category Product Section -->
@endsection

@push('js')
    <script src="https://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            $(document).on('click', '.navbar-toggler', function(e) {
                e.preventDefault();
                $(this).closest('li').find('>.collapse').slideToggle('fast');
                $(this).toggleClass('collapsed');
            });

            $(document).on('click', '[data-view-type="grid"]', function(e) {
                e.preventDefault();
                $(this).addClass('active');
                $('[data-view-type="list"]').removeClass('active');
                $('.product_list').addClass('grid');
                $('.product_list').removeClass('list');
            });

            $(document).on('click', '[data-view-type="list"]', function(e) {
                e.preventDefault();
                $(this).addClass('active');
                $('[data-view-type="grid"]').removeClass('active');
                $('.product_list').removeClass('grid');
                $('.product_list').addClass('list');
            });

            $(document).on('click', '#search_filter_toggler', function(e) {
                e.preventDefault();
                $('.sidebar-overlay').addClass('show');
                $('#filter-products__wrapper').addClass('show-sidebar');
            });

            $(document).on('click', '.sidebar-overlay', function(e) {
                e.preventDefault();
                $(this).removeClass('show');
                $('#filter-products__wrapper').removeClass('show-sidebar');
            });

            let minValue = $('.faceted-slider').data('slider-min');
            let maxValue = $('.faceted-slider').data('slider-max');
            let unit = $('.faceted-slider').data('slider-unit');
            var setMin = $(".faceted-slider").data("set-min");
            var setMax = $(".faceted-slider").data("set-max");

            $("#slider-range").slider({
                range: true,
                min: minValue,
                max: maxValue,
                values: [setMin, setMax],
                slide: function(event, ui) {
                    $('#min-value').html(unit + ' ' + ui.values[0]);
                    $('#max-value').html(unit + ' ' + ui.values[1]);
                    $('input[name="min_price"]').val(ui.values[0]);
                    $('input[name="max_price"]').val(ui.values[1]);
                }
            });
            $('#min-value').html(unit + ' ' + $("#slider-range").slider("values", 0));
            $('#max-value').html(unit + ' ' + $("#slider-range").slider("values", 1));

            $(document).on('change', '#sort', function(e) {
                let value = $(this).val();
                $('input[name="sort_by"]').val(value);
                $('#filter_form').submit();
            });

            $(document).on('click', '.category-sub-menu a', function(e) {
                e.preventDefault();
                let slug = $(this).data('slug');
                $('input[name="search_category"]').val(slug);
                $('#filter_form').submit();
            });

        });
    </script>
@endpush
