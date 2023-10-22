@switch($type)

  @case("login")
    <section class="page-title-section">
      <div class="container">
          <div class="breadcrumb-title">Login</div>
          <ul class="breadcrumb-list">
              <li class="breadcrumb-item">
                  <a class="breadcrumb-link" href="{{ Route('frontend.home') }}">
                      <span class="breadcrumb-text">Home</span>
                  </a>
              </li>
              <li class="breadcrumb-item">
                  <a class="breadcrumb-link {{ $active == 'customer' ? 'active' : '' }}" href="{{ Route('customer.login') }}">
                      <span class="breadcrumb-text">User Login</span>
                  </a>
              </li>
              <li class="breadcrumb-item">
                  <a class="breadcrumb-link {{ $active == 'reseller' ? 'active' : '' }}" href="{{ Route('reseller.login') }}">
                      <span class="breadcrumb-text">Reseller Login</span>
                  </a>
              </li>
          </ul>
      </div>
    </section>
    @break

  @case("register")
    <section class="page-title-section">
      <div class="container">
          <div class="breadcrumb-title">Registration</div>
          <ul class="breadcrumb-list">
            <li class="breadcrumb-item">
                <a class="breadcrumb-link" href="{{ Route('frontend.home') }}">
                    <span class="breadcrumb-text">Home</span>
                </a>
            </li>
            <li class="breadcrumb-item">
                <a class="breadcrumb-link {{ $active == 'customer' ? 'active' : '' }}" href="{{ Route('customer.register') }}">
                    <span class="breadcrumb-text">User Registration</span>
                </a>
            </li>
            <li class="breadcrumb-item">
                <a class="breadcrumb-link {{ $active == 'reseller' ? 'active' : '' }}" href="{{ Route('reseller.register') }}">
                    <span class="breadcrumb-text">Reseller Registration</span>
                </a>
            </li>
        </ul>
      </div>
    </section>
    @break

  @default
    <section class="page-title-section">
      <div class="container">
          <div class="breadcrumb-title">Registration</div>
          <ul class="breadcrumb-list">
            <li class="breadcrumb-item">
                <a class="breadcrumb-link" href="{{ Route('frontend.home') }}">
                  <span class="breadcrumb-text">Home</span>
                </a>
            </li> 
        </ul>
      </div>
    </section>
    
@endswitch