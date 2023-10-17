@extends('layouts.frontend.app')
@section('content')
    @include('layouts.frontend.partial.breadcrumb', [
        'title' => 'Address',
        'link' => '',
    ])
    <section class="wishlist-section py-md-5 py-4 bg-white">
        <div class="container">
            <div class="row g-4">
                @include('layouts.customer.menu')
                <div class="col-lg-9 col-md-8">
                    <div class="dashboard-card">
                        <h5 class="dashboard-title">Your Address</h5>
                        <form action="{{ Route('customer.address') }}" method="POST">
                            @csrf
                            <div class="pb-2 font-secondary text-xs">
                                <div class="d-flex gap-4 mb-3">
                                    <div class="flex-shrink-0 form-check">
                                        <input class="form-check-input" type="radio" id="home" name="address_type"
                                            {{ $address && $address->address_type == 'home' ? 'checked' : '' }}
                                            value="home">
                                        <label class="form-check-label" for="home">
                                            Home
                                        </label>
                                    </div>
                                    <div class="flex-shrink-0 form-check">
                                        <input class="form-check-input" type="radio" id="office"
                                            {{ $address && $address->address_type == 'office' ? 'checked' : '' }}
                                            name="address_type" value="office">
                                        <label class="form-check-label" for="office">
                                            Office
                                        </label>
                                    </div>
                                </div>
                                <div class="mb-4 pb-lg-2 row g-2 align-items-center">
                                    <label class="col-md-2 form-label mb-0 required">
                                        Full Name
                                    </label>
                                    <div class="col-md-8">
                                        <input class="form-control" name="name" type="text"
                                            value="{{ $address ? $address->name : '' }}" placeholder="First name"
                                            required="">
                                    </div>
                                </div>
                                <div class="mb-4 pb-lg-2 row g-2 align-items-center">
                                    <label class="col-md-2 form-label mb-0">
                                        Email
                                    </label>
                                    <div class="col-md-8">
                                        <input class="form-control" name="email" type="email" placeholder="Email"
                                            value="{{ $address ? $address->email : '' }}">
                                    </div>
                                    <div class="col-md-2 label">
                                        Optional
                                    </div>
                                </div>
                                <div class="mb-4 pb-lg-2 row g-2 align-items-center">
                                    <label class="col-md-2 form-label mb-0 required">
                                        Phone
                                    </label>
                                    <div class="col-md-8">
                                        <input class="form-control" name="phone" type="number" placeholder="Phone"
                                            value="{{ $address ? $address->phone : '' }}" required="">
                                    </div>
                                </div>
                                <div class="mb-4 pb-lg-2 row g-2 align-items-center">
                                    <label class="col-md-2 form-label mb-0 required">
                                        Division
                                    </label>
                                    <div class="col-md-8">
                                        <select class="form-control form-control-select" name="division_id" id="division_id"
                                            required="">
                                            <option value="">-- Select Division --</option>
                                            @foreach ($divisions as $division)
                                                <option value="{{ $division->id }}"
                                                    {{ $address && $address->division_id == $division->id ? 'selected' : '' }}>
                                                    {{ $division->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="mb-4 pb-lg-2 row g-2 align-items-center">
                                    <label class="col-md-2 form-label mb-0 required">
                                        District
                                    </label>
                                    <div class="col-md-8">
                                        <select class="form-control form-control-select" name="district_id" id="district_id"
                                            required="">
                                            <option value="">-- Select District --</option>
                                            @foreach ($districts as $district)
                                                <option value="{{ $district->id }}"
                                                    {{ $address && $address->district_id == $district->id ? 'selected' : '' }}>
                                                    {{ $district->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="mb-4 pb-lg-2 row g-2 align-items-center">
                                    <label class="col-md-2 form-label mb-0 required">
                                        Upozila
                                    </label>
                                    <div class="col-md-8">
                                        <select class="form-control form-control-select" name="upozila_id" id="upozila_id"
                                            required="">
                                            <option value="">-- Select Upozila --</option>
                                            @foreach ($upozilas as $upozila)
                                                <option value="{{ $upozila->id }}"
                                                    {{ $address && $address->upozila_id == $upozila->id ? 'selected' : '' }}>
                                                    {{ $upozila->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="mb-4 pb-lg-2 row g-2 align-items-center">
                                    <label class="col-md-2 form-label mb-0 required">
                                        Street
                                    </label>
                                    <div class="col-md-8">
                                        <textarea name="street" id="street" class="form-control h-auto" cols="30" rows="3" required
                                            placeholder="Street Address" spellcheck="false">{{ $address ? $address->street : '' }}</textarea>
                                    </div>
                                </div>
                                <div class="pt-2">
                                    <button type="submit" class="btn btn-primary">SAVE</button>
                                </div>
                            </div>
                        </form>
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
            $(document).on('change', '#division_id', function(e) {
                let id = $(this).val();
                let url = "{{ Route('customer.address') }}";
                $.ajax({
                    url: url,
                    data: {
                        _method: 'GET',
                        id: id,
                    },
                    success: (response) => {
                        if (response.status == 'success') {
                            var selected_district =
                                "{{ $address ? $address->district_id : '' }}";
                            $('#district_id').html('');
                            $('#upozila_id').html('');
                            $('#upozila_id').append(
                                '<option value="" selected>-- Select Upozila --</option>');
                            $('#district_id').append(
                                '<option value="" selected>-- Select District --</option>');
                            $.each(response.locations, function(key, value) {
                                var option = '<option value="' + value.id + '"';
                                if (selected_district != '' && selected_district ==
                                    value.id) {
                                    option += ' selected';
                                }
                                option += '>' + value.name + '</option>';
                                $('#district_id').append(option);
                            });
                        }
                    }
                });
            });

            $(document).on('change', '#district_id', function(e) {
                let id = $(this).val();
                let url = "{{ Route('customer.address') }}";
                $.ajax({
                    url: url,
                    data: {
                        _method: 'GET',
                        id: id,
                    },
                    success: (response) => {
                        if (response.status == 'success') {
                            var selected_upozila =
                                "{{ $address ? $address->upozila_id : '' }}";
                            $('#upozila_id').html('');
                            $('#upozila_id').append(
                                '<option value="" selected>-- Select Upozila --</option>');
                            $.each(response.locations, function(key, value) {
                                var option = '<option value="' + value.id + '"';
                                if (selected_upozila != '' && selected_upozila ==
                                    value.id) {
                                    option += ' selected';
                                }
                                option += '>' + value.name + '</option>';
                                $('#upozila_id').append(option);
                            });
                        }
                    }
                });
            });
        });
    </script>
@endpush
