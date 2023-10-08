<div class="col-lg-3 col-md-4">
    <ul class="group-link__list">
        <li class="group-link__item">
            <a class="group-link {{ Route::is('customer.profile') ? 'active' : '' }}"
                href="{{ Route('customer.profile') }}">
                <span class="link-item">
                    <i class="material-icons"></i>
                    <span>Information</span>
                </span>
            </a>
        </li>
        <li class="group-link__item">
            <a class="group-link {{ Route::is('customer.address') ? 'active' : '' }}"
                href="{{ Route('customer.address') }}">
                <span class="link-item">
                    <i class="material-icons"></i>
                    <span>Add first address</span>
                </span>
            </a>
        </li>
        <li class="group-link__item">
            <a class="group-link {{ Route::is('customer.orders') ? 'active' : '' }}"
                href="{{ Route('customer.orders') }}">
                <span class="link-item">
                    <i class="zmdi zmdi-time-restore"></i>
                    <span>Order history and details</span>
                </span>
            </a>
        </li>
        <li class="group-link__item">
            <a class="group-link {{ Route::is('customer.return-orders') ? 'active' : '' }}"
                href="{{ Route('customer.return-orders') }}">
                <span class="link-item">
                    <i class="material-icons"></i>
                    <span>Merchandise returns</span>
                </span>
            </a>
        </li>
        <li class="group-link__item">
            <a class="group-link {{ Route::is('customer.wishlist') ? 'active' : '' }}"
                href="{{ Route('customer.wishlist') }}" title="My Wishlists">
                <i class="fa fa-heart"></i><span>My Wishlists</span>
            </a>
        </li>
        <li class="group-link__item">
            <a class="group-link" href="{{ Route('customer.logout') }}" rel="nofollow" class="btn-logout">
                <span class="link-item">
                    <i class="zmdi zmdi-power"></i>
                    Sign out
                </span>
            </a>
        </li>
    </ul>
</div>
