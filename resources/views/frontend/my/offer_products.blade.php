


@php
    $window_width = '<script>document.write(window.innerWidth)</script>';
@endphp

@if ($window_width > 380)
    <section class="pt-md-5 pt-4 bg-light">
    <div class="container-fluid">
        @foreach ($special_offers as $key => $special_offer) 
        <h3 class="h3 bg-light text-uppercase text-center pb-2">{{ $special_offer->name }}</h3>
            <div class="d-md-none">
                
                @if (file_exists($special_offer->image))
                    <img src="{{ asset($special_offer->image) }}" alt="home banner 1" width="100%" style="min-height: 20vh;" />
                @endif

            </div>
        {{-- <h3 class="special-offer-title text-uppercase">{{ $special_offer->name }}</h3> --}}
        <div class="tab-pane fade show active pb-2" id="nav-{{ $key }}-new-arrivals"
            role="tabpanel" aria-labelledby="nav-{{ $key }}-new-arrivals-tab">

            @php 
                $products = App\Helper\AdditionalDataResource::getProductsBySpecialOffer($special_offer->product_ids, 10);
                $showcase_items = 3;
                if(count($products) < 11){
                    $showcase_items = 2;
                }else if(count($products) < 6){
                    $showcase_items = 1;
                }
            @endphp

            <div class="carousel product-card__carousel" 
                data-timeout="4000" data-rows="{{ $showcase_items }}" data-xs-items="2" data-sm-items="2"
                data-infinite="true" data-items="5" data-xl-items="4" data-lg-items="3"
                data-arrows="false" data-dots="false" data-autoplay="true" data-md-items="3">

                @foreach ($products as $product)
                    @include('components.product_card', ["product"=> $product, "normal"=> false])
                @endforeach
            </div>
        </div>
        
        <div>
            {!! $products->appends(request()->input())->links('pagination::bootstrap-5') !!}
        </div>
        @endforeach
    </div>
    </section>
@else
    <section class="pt-md-5 pt-4 bg-light">
    <div class="container-fluid">
        @foreach ($special_offers as $key => $special_offer) 
        <h3 class="h3 bg-light text-uppercase text-center pb-2">{{ $special_offer->name }}</h3>
            <div class="d-md-none">
                
                @if (file_exists($special_offer->image))
                    <img src="{{ asset($special_offer->image) }}" alt="home banner 1" width="100%" style="min-height: 20vh;" />
                @endif

            </div>
            <div class="tab-pane fade show active" id="nav-{{ $key }}-new-arrivals"
                role="tabpanel" aria-labelledby="nav-{{ $key }}-new-arrivals-tab">

                @php 
                    $products = App\Helper\AdditionalDataResource::getProductsBySpecialOffer($special_offer->product_ids);
                    $showcase_items = 3;
                    if(count($products) < 11){
                        $showcase_items = 2;
                    }else if(count($products) < 6){
                        $showcase_items = 1;
                    }
                @endphp

                <div class="carousel product-card__carousel" 
                    data-timeout="4000" data-rows="{{ $showcase_items }}"
                    data-arrows="false" data-dots="false" data-autoplay="true"
                    data-infinite="true" data-items="5" data-xl-items="4" data-lg-items="3"
                    data-md-items="3" data-sm-items="2" data-xs-items="2">
                    @foreach ($products as $product)
                        @include('components.product_card', ["product"=> $product, "normal"=> true])
                    @endforeach
                </div>
            </div>
        @endforeach
    </div>
    </section>
@endif