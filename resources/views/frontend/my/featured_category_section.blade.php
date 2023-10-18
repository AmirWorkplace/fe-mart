<section class="py-md-5 py-4 bg-light">
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
</section>