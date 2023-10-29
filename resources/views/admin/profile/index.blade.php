@extends('layouts.admin.app')

@section('breadcrumb')
<div class="d-flex gap-3 align-items-center justify-content-between px-sm-4 px-3 py-3 border-top border-light">
    <h4 class="mb-0 h6 fw-600 text-dark text-uppercase text-truncate-1">Admin Profile</h4>
    <div class="flex-shrink-0">
        <ol class="breadcrumb m-0">
            <li class="breadcrumb-item"><a href="{{ route('admin.dashboard') }}">Dashboard</a></li>
            <li class="breadcrumb-item active">Admin Profile</li>
        </ol>
    </div>
</div>
@endsection

@section('content')
<div class="row g-3">
    <div class="col-12">
        <div class="header-wrapper">
            <form action="{{ route('admin.change-images', $profile->id ) }}" method="post" enctype="multipart/form-data">
                @csrf
                @method('PUT')
                <div class="profile-header">
                    <div id="save-cover-image">
                        <div class="absolute-top-left z-3 w-100 d-flex align-items-center justify-content-between gap-3 p-md-3 p-10px" style="background-color: rgb(0 0 0 / 40%);">
                            <div class="flex-grow-1">
                                <p class="mb-0 text-white fw-500 fs-16 d-sm-block d-none">Do you want to save?</p>
                            </div>
                            <div class="flex-shrink-0">
                                <div class="d-flex gap-2">
                                    <button type="button" class="btn btn-sm close-btn">Cancel</button>
                                    <button type="submit" class="btn btn-primary btn-sm" id="save-cover-btn">Save Change</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="absolute-top-right z-2 p-10px">
                        <input class="d-none" type="file" id="cover_image" name="cover_image" accept=".jpg, .jpeg, .png, .webp">
                        <label for="cover_image" class="btn btn-sm btn-primary">Edit Cover Image</label>
                    </div>
                    <img class="lazyload img-fit absolute-full" data-src="{{ file_exists($profile->cover_image) ? asset($profile->cover_image ) : asset('backend/images/avatar/default/cover.jpg') }}" alt="Cover Image">
                    <div id="onUploadCover">
                        <img class="lazyload img-fit absolute-full z-2" id="onUploadCoverImage" src="" alt="Cover Image">
                    </div>
                </div>

                <div class="profile-meta w-fit mx-auto">
                    <img class="user-img img-fit lazyload" data-src="{{ file_exists($profile->image) ? asset($profile->image ) : asset('backend/images/avatar/default/user.jpg') }}" alt="vendor image">
                    <div class="thumb-edit">
                        <input type="file" id="profileImageInput" class="image-upload" name="profile_image" accept=".jpg, .jpeg, .png, .webp">
                        <label for="profileImageInput"><i class="fal fa-pencil-alt"></i></label>
                    </div>
                </div>

                <div id="save-profile-image">
                    <div class="inner">
                        <img class="img-fit" id="profileImage" src="" width="150" height="150" alt="Image">
                        <div class="d-flex align-items-center justify-content-center gap-3 p-md-3 p-10px">
                            <button type="button" class="btn btn-sm close-btn">Cancel</button>
                            <button type="submit" class="btn btn-primary btn-sm" id="save-profile-btn">Save Change</button>
                        </div>
                    </div>
                </div>

                <div class="text-center">
                    <h5 class="h5 mb-1 pt-sm-3 pt-2 text-primary fw-700">{{ $profile->name }}</h5>
                    <p class="text mb-0">{{ $profile->email }}</p>
                </div>
            </form>
        </div>

        <div>
            <nav class="admin-profile-tab">
                <div class="nav nav-tabs p-10px overflow-auto text-nowrap flex-nowrap" id="nav-tab" role="tablist">
                    <button class="nav-link active" id="nav-admin-info-tab" data-bs-toggle="tab" data-bs-target="#nav-admin-info" type="button" role="tab" aria-controls="nav-admin-info" aria-selected="true">Admin
                        Info</button>
                    <button class="nav-link" id="nav-info-edit-tab" data-bs-toggle="tab" data-bs-target="#nav-info-edit" type="button" role="tab" aria-controls="nav-info-edit" aria-selected="false">Profile
                        Settings</button>
                    <button class="nav-link" id="nav-password-edit-tab" data-bs-toggle="tab" data-bs-target="#nav-password-edit" type="button" role="tab" aria-controls="nav-password-edit" aria-selected="false">Change
                        Password</button>
                </div>
            </nav>
            <div class="tab-content" id="nav-tabContent">
                <div class="tab-pane fade show active" id="nav-admin-info" role="tabpanel" aria-labelledby="nav-admin-info-tab">
                    <div class="bg-white rounded-3 p-sm-4 p-3">
                        <h5 class="h5 mb-3 fw-600 text-primary">Profile Information</h5>
                        <ul class="list-group">
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                Name
                                <span class="rounded-pill">{{ $profile->name }}</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                Email Address
                                <span class="rounded-pill">{{ $profile->email }}</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                Phone
                                <span class="rounded-pill">{{ $profile->phone }}</span>
                            </li>
                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                Address
                                <span class="rounded-pill">{{ $profile->address }}</span>
                            </li>

                            @if(App\Helper\UserManagement::role('reseller'))
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    Shop Name
                                    <span class="rounded-pill">{{ $profile->reseller->shop_name }}</span>
                                </li> 
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    Bank Name
                                    <span class="rounded-pill">{{ $profile->reseller->bank_name }}</span>
                                </li> 
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    Bank Account
                                    <span class="rounded-pill">{{ $profile->reseller->bank_account }}</span>
                                </li> 
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    Bank Branch Name
                                    <span class="rounded-pill">{{ $profile->reseller->bank_branch_name }}</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    Bkash Number
                                    <span class="rounded-pill">{{ $profile->reseller->bkash }}</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    Nagad Number
                                    <span class="rounded-pill">{{ $profile->reseller->nagad }}</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    Rocket Number
                                    <span class="rounded-pill">{{ $profile->reseller->rocket }}</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    Upay Number
                                    <span class="rounded-pill">{{ $profile->reseller->upay }}</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    Shop Utility
                                    <span class="rounded-pill">{{ $profile->reseller->shop_utility }}</span>
                                </li>
                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                    Website Link
                                    <a href="{{ $profile->reseller->website_url }}" class="rounded-pill">{{ $profile->reseller->website_url }}</a>
                                </li>
                            @endif
                        </ul>
                    </div>
                </div>
                <div class="tab-pane fade" id="nav-info-edit" role="tabpanel" aria-labelledby="nav-info-edit-tab">
                    <div class="bg-white rounded-3 p-sm-4 p-3">
                        <h5 class="h5 mb-3 fw-600 text-primary">Profile Settings</h5>
                        <form action="{{ Route('admin.profile.update', $profile->id) }}" method="post">
                            @csrf
                            @method('PUT')
                            <div class="row g-3">
                                <div class="col-md-4 col-xs-6">
                                    <label for="admin-name" class="form-label">Your Name</label>
                                    <input class="form-control" type="text" id="admin-name" placeholder="Your Name" name="name" value="{{ $profile->name }}">
                                </div>
                                <div class="col-md-4 col-xs-6">
                                    <label for="admin-email" class="form-label">Your Email</label>
                                    <input class="form-control" type="email" id="admin-email" placeholder="Your Email" name="email" value="{{ $profile->email }}">
                                </div>
                                <div class="col-md-4 col-xs-6">
                                    <label for="admin-phone" class="form-label">Your Phone</label>
                                    <input class="form-control" type="number" id="admin-phone" placeholder="Your Phone" name="phone" value="{{ $profile->phone }}">
                                </div>
                                
                                @if(App\Helper\UserManagement::role('reseller'))
                                    <div class="col-md-4 col-xs-6">
                                        <label for="admin-name" class="form-label">Your Shop Name</label>
                                        <input class="form-control" type="text" id="admin-shop_name" placeholder="Your Shop Name" name="shop_name" value="{{ $profile->reseller->shop_name }}">
                                    </div>
                                    {{-- <div class="col-md-4 col-xs-6">
                                        <label for="admin-email" class="form-label">Your Mobile Bank Account Type</label>
                                        <input class="form-control" type="text" id="admin-mobile_bank_type" placeholder="Bkash" name="mobile_bank_type" value="{{ $profile->reseller->mobile_bank_type }}">
                                    </div>
                                    <div class="col-md-4 col-xs-6">
                                        <label for="admin-phone" class="form-label">Your Mobile Banking Account Number</label>
                                        <input class="form-control" type="number" id="admin-mobile_bank_number" placeholder="01896******" name="mobile_bank_number" value="{{ $profile->reseller->mobile_bank_number }}">
                                    </div> --}}
                                    <div class="col-md-4 col-xs-6">
                                        <label for="admin-name" class="form-label">Your Bank Name</label>
                                        <input class="form-control" type="text" id="admin-bank_account" placeholder="IFIC LTD" name="bank_name" value="{{ $profile->reseller->bank_name }}">
                                    </div>
                                    <div class="col-md-4 col-xs-6">
                                        <label for="admin-name" class="form-label">Your <span class="text-danger">Bank</span> Number</label>
                                        <input class="form-control" type="number" id="admin-bank_account" placeholder="89***********" name="bank_account" value="{{ $profile->reseller->bank_account }}">
                                    </div>
                                    <div class="col-md-4 col-xs-6">
                                        <label for="admin-phone" class="form-label">Your Bank Branch Name</label>
                                        <input class="form-control" type="text" id="admin-bank_branch_name" placeholder="01896******" name="bank_branch_name" value="{{ $profile->reseller->bank_branch_name }}">
                                    </div>
                                    <div class="col-md-4 col-xs-6">
                                        <label for="admin-phone" class="form-label">Your <span class="text-danger">Bkash</span> Number</label>
                                        <input class="form-control" type="text" id="admin-bkash" placeholder="01896******" name="bkash" value="{{ $profile->reseller->bkash }}">
                                    </div>
                                    <div class="col-md-4 col-xs-6">
                                        <label for="admin-phone" class="form-label">Your <span class="text-danger">Nagad</span> Number</label>
                                        <input class="form-control" type="text" id="admin-nagad" placeholder="01896******" name="nagad" value="{{ $profile->reseller->nagad }}">
                                    </div>
                                    <div class="col-md-4 col-xs-6">
                                        <label for="admin-phone" class="form-label">Your <span class="text-danger">Rocket</span> Number</label>
                                        <input class="form-control" type="text" id="admin-rocket" placeholder="01896******" name="rocket" value="{{ $profile->reseller->rocket }}">
                                    </div>
                                    <div class="col-md-4 col-xs-6">
                                        <label for="admin-phone" class="form-label">Your <span class="text-danger">Upay</span> Number</label>
                                        <input class="form-control" type="text" id="admin-upay" placeholder="01896******" name="upay" value="{{ $profile->reseller->upay }}">
                                    </div>
                                    <div class="col-md-4 col-xs-6">
                                        <label for="admin-email" class="form-label">Your Shop Utilities</label>
                                        <input class="form-control" type="text" id="admin-shop_utility" placeholder="Your Shop Utilities" name="shop_utility" value="{{ $profile->reseller->shop_utility }}">
                                    </div>
                                    <div class="col-md-4 col-xs-6">
                                        <label for="admin-phone" class="form-label">Your Website Link or URL</label>
                                        <input class="form-control" type="text" id="admin-website_url" placeholder="https://www." name="website_url" value="{{ $profile->reseller->website_url }}">
                                    </div>
                                @endif
                                <div class="col-12">
                                    <label for="address" class="form-label">Address</label>
                                    <textarea class="form-control" id="address" name="address" cols="30" rows="5" placeholder="Write your address here...">{{ $profile->address }}</textarea>
                                </div>
                                <div class="col-12">
                                    <div class="pt-3 text-center">
                                        <button type="submit" class="btn px-5 py-2 btn-primary btn-sm">Update</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="tab-pane fade" id="nav-password-edit" role="tabpanel" aria-labelledby="nav-password-edit-tab">
                    <div class="bg-white rounded-3 p-sm-4 p-3">
                        <h5 class="h5 mb-3 fw-600 text-primary">Change Password</h5>
                        <form action="{{ Route('admin.change-password', $profile->id) }}" method="post">
                            @csrf
                            @method('PUT')
                            <div class="row g-3">
                                <div class="col-md-4 col-xs-6">
                                    <label for="old-password" class="form-label">Old Password</label>
                                    <div class="input-group">
                                        <input class="form-control" type="password" id="old-password" placeholder="Old Password" required name="old_password">
                                        <button type="button" class="input-group-text password-toggler text-primary"><i class="fas fa-eye-slash fs-18"></i></button>
                                    </div>
                                </div>
                                <div class="col-md-4 col-xs-6">
                                    <label for="new-password" class="form-label">New Password</label>
                                    <div class="input-group">
                                        <input class="form-control" type="password" id="new-password" placeholder="New Password" required name="new_password">
                                        <button type="button" class="input-group-text password-toggler text-primary"><i class="fas fa-eye-slash fs-18"></i></button>
                                    </div>
                                </div>
                                <div class="col-md-4 col-xs-6">
                                    <label for="confirm-password" class="form-label">Confirm Password</label>
                                    <div class="input-group">
                                        <input class="form-control" type="password" id="confirm-password" placeholder="Confirm Password" required name="new_password_confirmation">
                                        <button type="button" class="input-group-text password-toggler text-primary"><i class="fas fa-eye-slash fs-18"></i></button>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="pt-3 text-center">
                                        <button type="submit" class="btn px-5 py-2 btn-primary btn-sm">Update</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection

@push('js')
<script type="text/javascript">
    $(document).ready(function () {

        cover_image.onchange = evt => {
            const [file] = cover_image.files
            if (file) {
                onUploadCoverImage.src = URL.createObjectURL(file);
                $('#onUploadCover').addClass('d-block');
                $('#save-cover-image').addClass('d-block');
            }
        }

        profileImageInput.onchange = evt => {
            const [file] = profileImageInput.files
            if (file) {
                profileImage.src = URL.createObjectURL(file);
                $('#save-profile-image').addClass('d-grid');
            }
        }

        $('.close-btn').on('click', function () {
            $('#save-profile-image').removeClass('d-grid');
            $('#profileImageInput').val('');

            $('#onUploadCover').removeClass('d-block');
            $('#save-cover-image').removeClass('d-block');
            $('#cover_image').val('');
        });

        $('#profileImageInput').on('change', function () {
            $('#onUploadCover').removeClass('d-block');
            $('#save-cover-image').removeClass('d-block');
            $('#cover_image').val('');
        });

    });

</script>
@endpush
