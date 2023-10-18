{{-- <section class="py-md-5 py-4 bg-light">
  <div class="container-fluid">
      <h3 class="h3 mb-4 text-uppercase text-center">Shop by Categories</h3>
      <div class="pb-2">
          <div class="carousel category-carousel" data-items="9" data-xl-items="7" data-lg-items="5" data-md-items="4"
              data-sm-items="3" data-xs-items="3" data-arrows="true" data-infinite="true" data-dots="false"
              data-timeout="5000">
              @foreach ($featured_categories as $featured_category)
                  <div class="px-sm-3 px-2">
                      <div class="featured-category">
                          <figure class="featured-category__image">
                              <a href="{{ Route('frontend.products', $featured_category->slug) }}">
                                  <img class="lazyload"
                                      data-src="{{ file_exists($featured_category->image) ? asset($featured_category->image) : asset('frontend/assets/images/icons/deal.png') }}"
                                      alt="{{ $featured_category->name }}" width="124" height="124">
                              </a>
                          </figure>
                          <div class="featured-category__text">
                              <a href="#" class="featured-category__link">{{ $featured_category->name }}</a>
                              <div class="text-xxs fw-400 text-muted pt-1">
                                  {{ App\Helper\AdditionalDataResource::getCategoryProductsCount($featured_category->id) }} Item(s)
                              </div>
                          </div>
                      </div>
                  </div>
              @endforeach
          </div>
      </div>
  </div>
</section> --}}

<style>
  .special-offer-title {
      background: #1399bf;
      text-align: center;
      padding: 4px 6px;
      border-radius: 4px;
      color: #e4e4e4;
  }
</style>

<section class="pb-md-5 pb-4 bg-light">
  <!-- <h3 class="h3 bg-light text-uppercase text-center pb-2">Special Offers</h3> -->
  <div class="container-fluid">
    @foreach ($special_offers as $key => $special_offer) 
      <h3 class="special-offer-title text-uppercase">{{ $special_offer->name }}</h3>
      <div class="tab-pane fade show active pb-2" id="nav-{{ $key }}-new-arrivals"
        role="tabpanel" aria-labelledby="nav-{{ $key }}-new-arrivals-tab">

        @php 
            $products = App\Helper\AdditionalDataResource::getProductsBySpecialOffer($special_offer->product_ids, 15);
            $showcase_items = 3;
            // $showcase_items = count($products) > 11 
            if(count($products) < 10){
                $showcase_items = 2;
            }else if(count($products) < 5){
                $showcase_items = 1;
            }
        @endphp

        <div class="carousel product-card__carousel" 
            data-timeout="4000" data-rows="{{ $showcase_items }}" data-xs-items="2" data-sm-items="2"
            data-infinite="true" data-items="5" data-xl-items="4" data-lg-items="3"
            data-arrows="false" data-dots="false" data-autoplay="true" data-md-items="3">

            @foreach ($products as $product)
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
                                {{-- @if ($product->price->sale_price != $product->price->sale_price) --}}
                                    <del class="price" style="color: #ce150f">৳
                                        {{ number_format($product->price->sale_price) }}</del>
                                {{-- @endif --}}
                                <span class="price">৳
                                    {{ number_format($product->price->offer_price) }}</span>
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
      
      <div>
        {!! $products->appends(request()->input())->links('pagination::bootstrap-5') !!}
      </div>
    @endforeach
  </div>
</section>
