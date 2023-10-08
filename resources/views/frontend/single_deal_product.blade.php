@extends('layouts.frontend.app')
@section('content')
    @include('layouts.frontend.partial.breadcrumb', [
        'title' => $product->name,
        'link' => Route('frontend.single-product', $product->slug),
        'category_link' => Route('frontend.products', $product->category->slug),
        'category' => $product->category->name,
    ])
    <section class="single-product-section py-md-5 py-4 bg-white">
        <div class="container">
            <div class="row g-4">
                <div class="col-md-6">
                    <div class="product-gallery">
                        <div class="product-thumbnail">
                            <figure class="thumbnail-figure">
                                <img id="big-thumbnail"
                                    src="{{ file_exists($product->thumbnail) ? asset($product->thumbnail) : asset($setting->placeholder) }}"
                                    alt="product title">
                                <a class="modal-trigger"
                                    data-image="{{ file_exists($product->thumbnail) ? asset($product->thumbnail) : asset($setting->placeholder) }}"><i
                                        class="fa fa-expand"></i></a>
                            </figure>
                        </div>
                        <div class="product-thumbnail__nav">
                            <div class="carousel thumbnail__nav-carousel" data-items="5" data-xl-items="5" data-lg-items="5"
                                data-md-items="6" data-sm-items="5" data-xs-items="5" data-arrows="false" data-dots="false">
                                <div class="pe-1">
                                    <img class="nav-image active"
                                        src="{{ asset(file_exists($product->thumbnail) ? $product->thumbnail : $setting->placeholder) }}"
                                        alt="{{ $product->name }}">
                                </div>
                                @if (!is_null($product->more_images))
                                    @php
                                        $images = explode('|', $product->more_images);
                                    @endphp
                                    @foreach ($images as $image)
                                        <div class="pe-1">
                                            <img class="nav-image"
                                                src="{{ asset(file_exists($image) ? $image : $setting->placeholder) }}"
                                                alt="{{ $product->name }}">
                                        </div>
                                    @endforeach
                                @endif
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <h1 class="detail-product-name">{{ $product->name }}</h1>
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <div class="product-prices">
                            <div class="product-price d-flex align-items-center gap-2">
                                @php
                                    $first_variant = $product->stocks->first();
                                    if ($flash_deal_product->discount_type == 'amount') {
                                        $discounted_price = $first_variant->price - $flash_deal_product->discount;
                                    } else {
                                        $discount = ($first_variant->price / 100) * $flash_deal_product->discount;
                                        $discounted_price = $first_variant->price - floor($discount);
                                    }
                                    $current_stock = $first_variant->qty - $first_variant->ordered;
                                @endphp
                                <div class="current-price">
                                    <span>৳ {{ number_format($discounted_price, 2) }}</span>
                                </div>
                                <div class="old-price text-md text-muted">
                                    <del>৳ {{ number_format($product->price->sale_price, 2) }}</del>
                                </div>
                            </div>
                        </div>
                        <div class="product-availability">
                            <label class="control-label">Availability</label>:
                            <span id="product-availability" class="product-available">
                                <span class="in-stock {{ $current_stock > 0 ? 'd-inline-block' : 'd-none' }}">
                                    <i class="far fa-check-square text-sm"></i>
                                    In stock
                                </span>
                                <span
                                    class="out-of-stock text-danger {{ $current_stock > 0 ? 'd-none' : 'd-inline-block' }}">Stock
                                    Out</span>
                            </span>
                        </div>
                    </div>
                    <div class="short_description">
                        {!! $product->short_description !!}
                    </div>

                    <form id="option-choice-form">
                        @csrf
                        <input type="hidden" name="flash_deal_id" value="{{ $flash_deal->id }}">
                        <input type="hidden" name="flash_deal_item_id" value="{{ $flash_deal_product->id }}">
                        <input type="hidden" name="id" value="{{ $product->id }}">
                        <input type="hidden" id="variant_id" name="variant_id" value="{{ $first_variant->id }}">
                        @if (!is_null($product->choice_options))
                            <div class="product-variants in_border">
                                @foreach (json_decode($product->choice_options) as $key => $choice)
                                    <div class="product-variants-item">
                                        <span
                                            class="text-uppercase fw-500 text-xxs">{{ \App\Models\Attribute::find($choice->attribute_id)->name }}:
                                        </span>
                                        <select id="attribute_id_{{ $choice->attribute_id }}" class="form-select"
                                            name="attribute_id_{{ $choice->attribute_id }}">
                                            @foreach ($choice->values as $key => $value)
                                                <option value="{{ $value }}" title="{{ $value }}"
                                                    {{ $key == 0 ? 'selected' : '' }}>{{ $value }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                @endforeach
                            </div>
                        @endif
                        <div class="product-add-to-cart in_border">
                            <span class="control-label">QTY: </span>
                            <div class="product-quantity">
                                <div class="qty">
                                    <div class="input-group">
                                        <input type="number" name="quantity" id="quantity_wanted"
                                            class="input-group form-control quantity_wanted input-number" placeholder="1"
                                            value="{{ $product->min_order }}" min="{{ $product->min_order }}"
                                            max="{{ $current_stock < 1 ? 1 : $current_stock }}">
                                        <span class="input-group-btn-vertical">
                                            <button class="btn btn-touchspin qty-plus" type="button">
                                                <i class="fal fa-plus"></i></button>
                                            <button class="btn btn-touchspin qty-minus bootstrap-touchspin-down"
                                                type="button"><i class="fal fa-minus"></i></button>
                                        </span>
                                    </div>
                                    <div class="avialable-amount text-muted text-xxs text-nowrap">
                                        (<span id="available-quantity">{{ $current_stock }}</span> {{ __('available') }})
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="product-add-to-cart in_border">
                            <div class="add">
                                <button class="btn btn-primary add-to-cart" {{ $current_stock < 1 ? 'disabled' : '' }}
                                    type="button">
                                    <i class="shopping-cart"></i>
                                    <span>Add to cart</span>
                                </button>
                            </div>
                            @auth
                                <button class="btn addToWishlist p-0" data-id="{{ $product->id }}" type="button">
                                    <i class="zmdi zmdi-favorite-outline"></i>
                                </button>
                            @endauth
                        </div>
                    </form>

                    <div class="product-share in_border">
                        <div class="product-share__list">
                            {!! $shareComponent !!}
                        </div>
                    </div>
                    <div class="product_comments_block_extra in_border">
                        <div class="comments_note">
                            <span>Review: </span>
                            @if (count($product->reviews) > 0)
                                @php
                                    $reviews = $product->reviews->pluck('star')->toArray();
                                    $sum_star = 0;
                                    foreach ($reviews as $key => $value) {
                                        $sum_star += ($value / 5) * 100;
                                    }
                                    $total_star = count($reviews) * 100;
                                    $final_star = ($sum_star / $total_star) * 100;
                                @endphp
                                <div class="star_content clearfix">
                                    <div class="star {{ $final_star > 0 ? 'star_on' : '' }}"></div>
                                    <div class="star {{ $final_star > 20 ? 'star_on' : '' }}"></div>
                                    <div class="star {{ $final_star > 40 ? 'star_on' : '' }}"></div>
                                    <div class="star {{ $final_star > 60 ? 'star_on' : '' }}"></div>
                                    <div class="star {{ $final_star > 80 ? 'star_on' : '' }}"></div>
                                </div>
                            @else
                                <div class="star_content clearfix">
                                    <div class="star"></div>
                                    <div class="star"></div>
                                    <div class="star"></div>
                                    <div class="star"></div>
                                    <div class="star"></div>
                                </div>
                            @endif
                        </div>
                        <div class="comments_advices">
                            <a href="#" class="review_tab me-3"><i class="fa fa-comments"></i>Read
                                reviews ({{ count($product->reviews) }})</a>
                            @auth
                                @php
                                    $user_id = auth()->user()->id;
                                    $product_id = $product->id;
                                    $check_authentic_buy = \App\Models\Order::with('products')
                                        ->where('user_id', $user_id)
                                        ->whereHas('products', function ($query) use ($product_id) {
                                            $query->where('product_id', $product_id);
                                        })
                                        ->get();
                                    $check_review = \App\Models\Review::where('product_id', $product_id)
                                        ->where('user_id', $user_id)
                                        ->get();
                                @endphp
                                @if (count($check_authentic_buy) > 0 && count($check_review) == 0)
                                    <a class="open-comment-form" data-bs-toggle="modal" data-bs-target="#reviewModal"
                                        href="#"><i class="far fa-edit"></i>Write your review</a>
                                @endif
                            @endauth
                        </div>
                    </div>
                    <div class="end">
                        <div class="sku">
                            <label class="control-label me-1">Sku</label>:
                            <span id="product_sku">{{ $first_variant->sku }}</span>
                        </div>
                        <div class="pro-cate">
                            <label class="control-label me-1">Category:</label>
                            <span><a href="{{ Route('frontend.products', $product->category->slug) }}"
                                    title="Computer">{{ $product->category->name }}</a></span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="pt-3 custom-tab pt-4 pt-md-5" id="tab_section">
                <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="pills-description-tab" data-bs-toggle="pill"
                            data-bs-target="#pills-description" type="button" role="tab"
                            aria-controls="pills-description" aria-selected="true">Description</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="pills-details-tab" data-bs-toggle="pill"
                            data-bs-target="#pills-details" type="button" role="tab" aria-controls="pills-details"
                            aria-selected="false">Additional Informations</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="pills-reviews-tab" data-bs-toggle="pill"
                            data-bs-target="#pills-reviews" type="button" role="tab" aria-controls="pills-reviews"
                            aria-selected="false">Reviews <span class="text-xs">(0)</span></button>
                    </li>
                </ul>
                <div class="tab-content" id="pills-tabContent">
                    <div class="tab-pane fade show active" id="pills-description" role="tabpanel"
                        aria-labelledby="pills-description-tab">
                        <div class="product-description">
                            {!! $product->description !!}
                        </div>
                    </div>
                    <div class="tab-pane fade" id="pills-details" role="tabpanel" aria-labelledby="pills-details-tab">
                        {!! $product->additional_info !!}
                    </div>
                    <div class="tab-pane fade" id="pills-reviews" role="tabpanel" aria-labelledby="pills-reviews-tab">
                        @foreach ($product->reviews as $review)
                            <div class="review-list__item">
                                <div class="review-meta d-flex flex-column gap-1 mb-1">
                                    <div class="star_content">
                                        @php
                                            $count_rating = $review->star;
                                            $count = 5;
                                            for ($x = 0; $x < $count; $x++) {
                                                echo '<div class="star ' . ($x < $count_rating ? 'star_on' : '') . '"></div>';
                                            }
                                        @endphp
                                    </div>
                                    <div class="d-flex flex-wrap gap-2 align-items-center text-xxs">
                                        <span
                                            class="text-muted">{{ $review->customer ? $review->customer->name : '' }}</span>
                                        <span>
                                            <img class="verifyImg" width="15" height="16"
                                                src="{{ asset('frontend/assets/images/icons/verified.png') }}">Verified
                                            Purchase</span>
                                    </div>
                                </div>
                                <div class="review-content">{{ $review->description }}</div>
                                @if (!is_null($review->images))
                                    <div class="review-image">
                                        @php
                                            $images = explode('|', $review->images);
                                        @endphp
                                        @foreach ($images as $image)
                                            <div class="review-image__item">
                                                <img src="{{ asset($image) }}" alt="Product Image">
                                            </div>
                                        @endforeach
                                    </div>
                                @endif
                            </div>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Single Product Section -->

    <div class="modal fade" id="thumbnail-modal" tabindex="-1" aria-labelledby="thumbnail-modalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-md">
            <div class="modal-content">
                <div class="modal-body">
                    <div class="modal-gallery__wrapper">
                        <div class="modal-product-thumbnail">
                            <figure class="thumbnail-figure border-0 mb-0">
                                <img id="modal-big-thumbnail"
                                    src="{{ file_exists($product->thumbnail) ? asset($product->thumbnail) : asset($setting->placeholder) }}"
                                    alt="product title">
                            </figure>
                        </div>
                        <div class="modal-product-thumbnail__nav">
                            <div class="modal-nav-image__wrapper">
                                <div class="pe-1">
                                    <img class="modal-nav-image active"
                                        src="{{ file_exists($product->thumbnail) ? asset($product->thumbnail) : asset($setting->placeholder) }}"
                                        alt="">
                                </div>
                                @if (!is_null($product->more_images))
                                    @foreach ($images as $image)
                                        <div class="pe-1">
                                            <img class="modal-nav-image"
                                                src="{{ asset(file_exists($image) ? $image : $setting->placeholder) }}"
                                                alt="{{ $product->name }}">
                                        </div>
                                    @endforeach
                                @endif
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade custom-modal" id="reviewModal" tabindex="-1" aria-labelledby="reviewModalLabel"
        aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title text-sm"><i class="fa fa-edit"></i> Write your review</h4>
                    <button type="button" class="btn close-quick-view" data-bs-dismiss="modal" aria-label="Close"><i
                            class="far fa-times"></i></button>
                </div>
                <div class="modal-body pb-3">
                    <div class="row g-3 mb-3">
                        <div class="col-4">
                            <div class="product-image ">
                                <img class="img-fluid" src="{{ asset($product->thumbnail) }}"
                                    alt="{{ $product->name }}">
                            </div>
                        </div>
                        <div class="col-8">
                            <div class="product_desc">
                                <p class="product_name">{{ $product->name }}</p>
                                <div class="text-xxs font-secondary">
                                    {!! $product->short_description !!}
                                </div>
                            </div>
                        </div>
                    </div>
                    <form action="{{ Route('customer.review') }}" method="POST" enctype="multipart/form-data">
                        @csrf
                        <input type="hidden" name="product_id" value="{{ $product->id }}">
                        <div class="row g-3">
                            <div class="col-12">
                                <label class="form-label required">Rating</label>
                                <div class="star_content star_fields">
                                    <input type="hidden" name="star" id="star" value="5">
                                    <div data-star="1" class="star star_on"></div>
                                    <div data-star="2" class="star star_on"></div>
                                    <div data-star="3" class="star star_on"></div>
                                    <div data-star="4" class="star star_on"></div>
                                    <div data-star="5" class="star star_on"></div>
                                </div>
                            </div>
                            <div class="col-12">
                                <label class="form-label" for="images">Images</label>
                                <input type="file" name="images[]" id="images" class="form-control rounded-0"
                                    multiple accept="image/*">
                                <div id="preview_image" class="pt-2 d-flex flex-wrap gap-1" style="display: none;"></div>
                            </div>
                            <div class="col-12">
                                <label class="form-label required" for="description">Your review</label>
                                <textarea name="description" id="description" cols="30" class="form-control rounded-0"
                                    placeholder="Review Description" required rows="4"></textarea>
                            </div>
                            <div class="col-12 text-end">
                                <button type="submit" class="btn btn-dark">SUBMIT</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('js')
    <script type="text/javascript">
        $(document).ready(function() {
            $(document).on('click', '.nav-image', function(e) {
                e.preventDefault();
                $('.nav-image').removeClass('active');
                $(this).addClass('active');
                var img = $(this).attr('src');
                $('#big-thumbnail').attr('src', img);
                $('.modal-trigger').data('image', img);
            });

            $(document).on('click', '.modal-nav-image', function(e) {
                e.preventDefault();
                var modal_img = $(this).attr('src');
                $('#modal-big-thumbnail').attr('src', modal_img);
            });

            $(document).on('click', '.modal-trigger', function(e) {
                e.preventDefault();
                var activeImage = $(this).data('image');
                $('#modal-big-thumbnail').attr('src', activeImage);
                $('#thumbnail-modal').modal('show');
            });

            $(document).on('click', '.review_tab', function(e) {
                e.preventDefault();
                const triggerEl = document.querySelector(
                    '#pills-tab button[data-bs-target="#pills-reviews"]');
                bootstrap.Tab.getOrCreateInstance(triggerEl).show();

                $('html, body').animate({
                    scrollTop: $("#tab_section").offset().top
                }, 100);
            });

            $(document).on('click', '.star_fields .star', function(e) {
                e.preventDefault();
                let star = $(this).data('star');
                $('#star').val(star);
                $(this).addClass("star_on");
                $(this).prevAll().addClass("star_on");
                $(this).nextAll().removeClass("star_on");
            });

            // More Images Preview
            $(document).on('change', '#images', function() {
                $('#preview_image').html('');
                if (window.File && window.FileReader && window.FileList && window.Blob) {
                    var data = $(this)[0].files;
                    $.each(data, function(index, file) {
                        if (/(\.|\/)(gif|jpe?g|png|webp)$/i.test(file.type)) {
                            var fRead = new FileReader();
                            fRead.onload = (function(file) {
                                return function(e) {
                                    var img = $('<img/>').addClass('thumb').attr('src',
                                        e.target.result).height(50);
                                    $('#preview_image').append(img);
                                };
                            })(file);
                            fRead.readAsDataURL(file);
                        }
                    });
                    $('#preview_image').show();
                } else {
                    alert("Your browser doesn't support File API!");
                }
            });
        });
    </script>
@endpush
