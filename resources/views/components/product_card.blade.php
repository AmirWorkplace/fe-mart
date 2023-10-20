@php
  $first_variant = $product->stocks->first();
  $current_stock = $first_variant->qty - $first_variant->ordered;
  $is_available = $current_stock <= 0;
@endphp

<div>
  <div class="product-card {{ $is_available ? 'stock-out' : '' }}">
    @if ($is_available && false)
      <div class="stock-out-label">stock out</div>
    @endif

      <div class="product-card__image">
          <a
              href="{{ $is_available ? '#' : route('frontend.single-product', $product->slug) }}">
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
                  href="{{ $is_available ? '#' : route('frontend.single-product', $product->slug) }}">{{ $product->name }}</a>
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

            @if ($normal)
                @if ($product->price->sale_price != $product->price->sale_price)
                  <del class="price">৳
                    {{ number_format($product->price->sale_price) }}
                  </del>
                @endif
            @else
                <del class="price" style="color: #ce150f">৳
                  {{ number_format($product->price->sale_price) }}
                </del>
            @endif
                
              <span class="price">৳
                  {{ number_format($product->price->offer_price) }}</span>
          </div>
          @if ($is_available)
              <a href="#" class="product-card__link">
                  <i class="fas fa-virus-slash" style="font-size: 22px; padding: 2px 0;"></i>
                  <span>Stock Out</span>
              </a>
          @else
              <a class="product-card__link"
                  href="{{ Route('frontend.single-product', $product->slug) }}">
                  <i class="novicon-cart"></i>
                  <span>Select option</span>
              </a>
          @endif
      </div>
  </div>
</div>