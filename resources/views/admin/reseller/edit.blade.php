@extends('layouts.admin.app')

@section('content')
<div class="row g-3">
    <div class="col-12">
        <form action="{{ Route('admin.reseller.update', $data->id) }}" method="POST" enctype="multipart/form-data">
            @csrf
            @method('PUT')
            <div class="card">
                <div class="card-header p-3">
                    <div class="d-flex justify-content-between align-items-center">
                        <h6 class="h6 mb-0 text-uppercase">Reseller Information</h6>
                        <a href="{{ Route('admin.reseller.index') }}" class="btn btn-primary btn-sm text-uppercase">Go Back</a>
                    </div>
                </div>
                <div class="card-body p-4">
                    <div class="row g-3">
                        <input type="hidden" name="role" value="2">
                        <div class="col-12">
                            <label for="name" class="form-label require"><b>Name</b></label>
                            <input type="text" placeholder="Name" class="form-control custom-input" id="name" name="name" required value="{{ $data->name }}" minlength="3">
                        </div>

                        <div class="col-12">
                            <label for="user_name" class="form-label require"><b>User ID</b></label>
                            <input type="text" class="form-control custom-input" id="user_name" name="user_name" placeholder="User ID" required value="{{ $data->user_name }}">
                        </div>

                        <div class="col-12">
                            <label for="email" class="form-label require"><b>E-mail</b></label>
                            <input type="text" class="form-control custom-input" id="email" name="email" placeholder="User ID" required value="{{ $data->email }}">
                        </div>

                        <div class="col-12">
                            <label for="phone" class="form-label require"><b>Phone</b></label>
                            <input type="phone" class="form-control custom-input" id="phone" name="phone" placeholder="Phone" required value="{{ $data->phone }}">
                        </div>

                        <div class="col-12">
                            <label for="shop_name" class="form-label require"><b>Shop Name</b></label>
                            <input type="text" class="form-control custom-input" id="shop_name" name="shop_name" value="{{ $data->shop_name }}">
                        </div>

                        <div class="col-12">
                            <label for="city" class="form-label require"><b>City</b></label>
                            <input type="text" class="form-control custom-input" id="city" name="city" placeholder="City" value="{{ $data->city }}">
                        </div>

                        <div class="col-12">
                            <label for="website_url" class="form-label require"><b>Website Url</b></label>
                            <input type="text" class="form-control custom-input" id="website_url" name="website_url" placeholder="Website Url" value="{{ $data->website_url }}">
                        </div>

                        <div class="col-12">
                            <label class="form-label" for="image"><b>Picture <span class="text-danger">(300px X 300px)</span></b></label>
                            <input class="custom-input form-control" name="image" id="image" type="file" accept="image/*">
                            @if (file_exists($data->image))
                                <img src="{{ asset($data->image) }}" alt="{{ $data->user_name }}" height="60" />
                            @endif
                        </div>

                        <div class="col-12">
                            <label for="cover_image" class="form-label require"><b>Profile Cover Image</b></label>
                            <input type="file" class="form-control custom-input" id="cover_image" name="cover_image" placeholder="Profile Image">
                            @if (file_exists($data->cover_image))
                                <img src="{{ asset($data->cover_image) }}" alt="{{ $data->user_name }}" height="60" />
                            @endif
                        </div>

                        <div class="col-12">
                            <label for="address" class="form-label require"><b>Address Details</b></label>
                            <textarea name="address" id="address" cols="30" rows="10" class="short_description" placeholder="Write your address details...">{!! $data->address !!}</textarea>
                        </div>
                </div>
                <div class="card-footer text-end p-3">
                    <button type="submit" class="btn btn-primary btn-sm">Update</button>
                </div>
            </div>
        </form>
    </div>
</div>
@endsection
