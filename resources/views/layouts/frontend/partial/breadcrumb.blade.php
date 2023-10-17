<section class="page-title-section">
    <div class="container">
        <div class="breadcrumb-title">{{ isset($title) ? $title : 'Login' }}</div>
        <ul class="breadcrumb-list">
            <li class="breadcrumb-item">
                <a class="breadcrumb-link" href="{{ Route('frontend.home') }}">
                    <span class="breadcrumb-text">Home</span>
                </a>
            </li>
            @if(isset($category) && isset($category_link))
            <li class="breadcrumb-item">
                <a class="breadcrumb-link" href="{{ $category_link }}">
                    <span class="breadcrumb-text">{{ $category }}</span>
                </a>
            </li>
            @endif
            <li class="breadcrumb-item">
                <a class="breadcrumb-link" href="{{ isset($link) ? $link : '' }}">
                    <span class="breadcrumb-text">{{ isset($title) ? $title : '' }}</span>
                </a>
            </li>
        </ul>
    </div>
</section>
<!-- End Page title Section -->
