@extends('layouts.frontend.app')
@section('content')
    @include('layouts.frontend.partial.breadcrumb', [
        'title' => 'My Wishlist',
        'link' => '',
    ])
    <section class="wishlist-section py-md-5 py-4 bg-white">
        <div class="container">
            <div class="row g-4">
                @include('layouts.customer.menu')
                <div class="col-lg-9 col-md-8">
                    <div class="dashboard-card">
                        <h5 class="dashboard-title">Wishlist</h5>
                        <div class="pb-2">
                            <div class="row g-3">
                                @foreach ($wishlists as $wishlist)
                                    <div class="col-lg-3 col-md-4 col-6" id="wishlist_item_{{ $wishlist->id }}">
                                        <div class="wishlist-item">
                                            <a href="#" class="lnkdel" data-id="{{ $wishlist->id }}" title="Delete"><i
                                                    class="material-icons close">close</i>
                                            </a>
                                            <div class="wishlist__image">
                                                <a href="{{ Route('frontend.single-product', $wishlist->product->slug) }}">
                                                    <img src="{{ asset($wishlist->product->thumbnail) }}"
                                                        alt="{{ $wishlist->product->name }}">
                                                </a>
                                            </div>
                                            <h6 class="wishlist-title"><a
                                                    href="{{ Route('frontend.single-product', $wishlist->product->slug) }}">{{ $wishlist->product->name }}.</a>
                                            </h6>
                                        </div>
                                    </div>
                                @endforeach
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End Wishlist Section -->
@endsection

@push('js')
    <script type="text/javascript">
        $(document).ready(function() {
            $(document).on('click', '.lnkdel', function(e) {
                e.preventDefault();
                let id = $(this).data('id');

                let url = "{{ Route('customer.wishlist') }}";
                $.ajax({
                    url: url,
                    data: {
                        _method: 'GET',
                        id: id,
                        delete: 'true',
                    },
                    success: (response) => {
                        if (response.status == 'success') {
                            Swal.fire({
                                width: "22rem",
                                text: 'Removed Successfully!',
                                icon: "success",
                                toast: true,
                                position: 'top-end',
                                showConfirmButton: false,
                                timer: 1500
                            });
                            $('#wishlist_item_' + id).remove();
                        }
                    }
                });
            });

        });
    </script>
@endpush
