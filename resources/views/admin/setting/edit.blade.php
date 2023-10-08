@extends('layouts.admin.app')

@section('content')
    <form action="{{ Route('admin.settings.update', '0') }}" method="POST" enctype="multipart/form-data">
        @csrf
        @method('PUT')
        <div class="row g-3">
            <div class="col-12">
                <div class="card">
                    <div class="card-header p-3">
                        <div class="d-flex justify-content-between align-items-center">
                            <h6 class="h6 mb-0 text-uppercase">{{ __('Update Homepage Banner') }}</h6>
                        </div>
                    </div>
                    <div class="card-body p-4">
                        <div class="row g-3">
                            <div class="col-lg-3 col-6">
                                <label for="banner_one" class="form-label require"><b>Banner One Image (415x190)</b></label>
                                <input type="file" class="form-control custom-input" id="banner_one" name="banner_one"
                                    accept="image/*">
                                @if ($setting && file_exists($setting->banner_one))
                                    <div class="pt-2">
                                        <img src="{{ asset($setting->banner_one) }}" height="60" alt="">
                                    </div>
                                @endif
                            </div>
                            <div class="col-lg-3 col-6">
                                <label for="banner_one_link" class="form-label require"><b>Banner One Link</b></label>
                                <input type="text" placeholder="Banner One Link" class="form-control custom-input"
                                    id="banner_one_link" name="banner_one_link"
                                    value="{{ $setting ? $setting->banner_one_link : '' }}">
                            </div>
                            <div class="col-lg-3 col-6">
                                <label for="banner_two" class="form-label require"><b>Banner Two Image (415x355)</b></label>
                                <input type="file" class="form-control custom-input" id="banner_two" name="banner_two"
                                    accept="image/*">
                                @if ($setting && file_exists($setting->banner_two))
                                    <div class="pt-2">
                                        <img src="{{ asset($setting->banner_two) }}" height="60" alt="">
                                    </div>
                                @endif
                            </div>
                            <div class="col-lg-3 col-6">
                                <label for="banner_two_link" class="form-label require"><b>Banner Two Link</b></label>
                                <input type="text" placeholder="Banner Two Link" class="form-control custom-input"
                                    id="banner_two_link" name="banner_two_link"
                                    value="{{ $setting ? $setting->banner_two_link : '' }}">
                            </div>
                        </div>
                    </div>
                    <div class="card-footer text-end p-3">
                        <button type="submit" class="btn btn-primary btn-sm">Update</button>
                    </div>
                </div>
            </div>
            <div class="col-12">
                <div class="card">
                    <div class="card-header p-3">
                        <div class="d-flex justify-content-between align-items-center">
                            <h6 class="h6 mb-0 text-uppercase">{{ __('Update Settings') }}</h6>
                        </div>
                    </div>
                    <div class="card-body p-4">
                        <div class="row g-3">
                            <div class="col-md-4 col-6">
                                <label for="title" class="form-label require"><b>Title</b></label>
                                <input type="text" required placeholder="title" class="form-control custom-input"
                                    id="title" name="title" value="{{ $setting ? $setting->title : '' }}"
                                    minlength="6">
                            </div>
                            <div class="col-md-4 col-6">
                                <label for="primary_mobile" class="form-label require"><b>Primary Phone</b></label>
                                <input type="number" class="form-control custom-input" id="primary_mobile"
                                    name="primary_mobile" value="{{ $setting ? $setting->primary_mobile : '' }}"
                                    placeholder="Primary Phone">
                            </div>
                            <div class="col-md-4 col-6">
                                <label for="secondary_mobile" class="form-label require"><b>Secondary
                                        Phone</b></label>
                                <input type="number" class="form-control custom-input" id="secondary_mobile"
                                    name="secondary_mobile" value="{{ $setting ? $setting->secondary_mobile : '' }}"
                                    placeholder="Secondary Phone">
                            </div>
                            <div class="col-lg-3 col-md-4 col-6">
                                <label for="primary_email" class="form-label require"><b>Primary Email</b></label>
                                <input type="email" class="form-control custom-input" id="primary_email"
                                    name="primary_email" value="{{ $setting ? $setting->primary_email : '' }}"
                                    placeholder="Primary Email">
                            </div>
                            <div class="col-lg-3 col-md-4 col-6">
                                <label for="secondary_email" class="form-label require"><b>Secondary
                                        Email</b></label>
                                <input type="email" class="form-control custom-input" id="secondary_email"
                                    name="secondary_email" value="{{ $setting ? $setting->secondary_email : '' }}"
                                    placeholder="Secondary Email">
                            </div>
                            <div class="col-lg-3 col-md-4 col-6">
                                <label for="address" class="form-label"><b>Address</b></label>
                                <input type="text" class="form-control custom-input" id="address" name="address"
                                    value="{{ $setting ? $setting->address : '' }}" placeholder="Address">
                            </div>
                            <div class="col-lg-3 col-md-4 col-6">
                                <label for="meta_keyword" class="form-label"><b>Meta Keyword</b></label>
                                <input type="text" class="form-control custom-input" id="meta_keyword"
                                    name="meta_keyword" value="{{ $setting ? $setting->meta_keyword : '' }}"
                                    placeholder="Meta Keyword">
                            </div>
                            <div class="col-12">
                                <label for="meta_description" class="form-label"><b>Meta Description</b></label>
                                <textarea name="meta_description" id="meta_description" class="form-control" cols="30" rows="3"
                                    placeholder="Meta Description">{{ $setting ? $setting->meta_description : '' }}</textarea>
                            </div>
                            <div class="col-12">
                                <label for="description" class="form-label"><b>Description</b></label>
                                <textarea name="description" id="description" class="form-control description" cols="30" rows="3"
                                    placeholder="Description">{!! $setting ? $setting->description : '' !!}</textarea>
                            </div>
                            <div class="col-lg-4 col-sm-6">
                                <label for="favicon" class="form-label"><b>Favicon Image</b></label>
                                <input class="form-control" type="file" id="favicon" name="favicon"
                                    {{ is_null($setting) || !file_exists($setting->favicon) ? 'required' : '' }}
                                    accept="image/*">
                                @if ($setting && file_exists($setting->favicon))
                                    <div>
                                        <img class="img-contain" src="{{ asset($setting->favicon) }}" height="50"
                                            alt="Favicon">
                                    </div>
                                @endif
                            </div>
                            <div class="col-lg-4 col-sm-6">
                                <label for="logo" class="form-label"><b>Logo Image</b></label>
                                <input class="form-control" type="file" id="logo" name="logo"
                                    {{ is_null($setting) || !file_exists($setting->favicon) ? 'required' : '' }}
                                    accept="image/*">
                                @if ($setting && file_exists($setting->logo))
                                    <div>
                                        <img class="img-contain" src="{{ asset($setting->logo) }}" height="50"
                                            alt="Logo">
                                    </div>
                                @endif
                            </div>
                            <div class="col-md-4 col-sm-6">
                                <label for="footer_logo" class="form-label"><b>Mobile Logo</b></label>
                                <input class="form-control" type="file" id="footer_logo" name="footer_logo"
                                    accept="image/*">
                                @if ($setting && file_exists($setting->footer_logo))
                                    <div>
                                        <img class="img-contain" src="{{ asset($setting->footer_logo) }}" height="50"
                                            alt="Footer Logo">
                                    </div>
                                @endif
                            </div>
                            <div class="col-md-4 col-sm-6">
                                <label for="placeholder" class="form-label"><b>Placeholder</b></label>
                                <input class="form-control" type="file" id="placeholder" name="placeholder"
                                    accept="image/*">
                                @if ($setting && file_exists($setting->placeholder))
                                    <div>
                                        <img class="img-contain" src="{{ asset($setting->placeholder) }}" height="50"
                                            alt="Placeholder Image">
                                    </div>
                                @endif
                            </div>
                            <div class="col-md-4 col-sm-6">
                                <label for="meta_image" class="form-label"><b>Meta Image</b></label>
                                <input class="form-control" type="file" id="meta_image" name="meta_image"
                                    accept="image/*">
                                @if ($setting && file_exists($setting->meta_image))
                                    <div>
                                        <img class="img-contain" src="{{ asset($setting->meta_image) }}" height="50"
                                            alt="Meta Image">
                                    </div>
                                @endif
                            </div>
                            <div class="col-12">
                                <label for="socialLinks" class="form-label"><b>Socail Links</b></label>
                                <div class="row gx-3 gy-2">
                                    <div class="col-md-6">
                                        <div class="input-group">
                                            <span
                                                class="input-group-text text-white d-inline-flex gap-2 justify-content-center"
                                                style="background-color: #1877F2; width: 42px;"><i
                                                    class="fab fa-facebook-f"></i></span>
                                            <input type="text" class="form-control" name="facebook_page"
                                                placeholder="https://www."
                                                value="{{ $setting ? $setting->facebook_page : '' }}">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="input-group">
                                            <span class="input-group-text text-white d-inline-flex justify-content-center"
                                                style="background-color: #FF0000; width: 42px;"><i
                                                    class="fab fa-youtube"></i></span>
                                            <input type="text" class="form-control" name="youtube"
                                                placeholder="https://www."
                                                value="{{ $setting ? $setting->youtube : '' }}">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="input-group">
                                            <span class="input-group-text text-white d-inline-flex justify-content-center"
                                                style="background-color: #1D9BF0; width: 42px;"><i
                                                    class="fab fa-twitter"></i></span>
                                            <input type="text" class="form-control" name="twitter"
                                                placeholder="https://www."
                                                value="{{ $setting ? $setting->twitter : '' }}">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="input-group">
                                            <span class="input-group-text text-white d-inline-flex justify-content-center"
                                                style="background-color: #0077B7; width: 42px;"><i
                                                    class="fab fa-linkedin-in"></i></span>
                                            <input type="text" class="form-control" name="linkedin"
                                                placeholder="https://www."
                                                value="{{ $setting ? $setting->linkedin : '' }}">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="input-group">
                                            <span class="input-group-text text-white d-inline-flex justify-content-center"
                                                style="background-color: #E33E2B; width: 42px;"><i
                                                    class="fab fa-google"></i></span>
                                            <input type="text" class="form-control" name="google"
                                                placeholder="https://www."
                                                value="{{ $setting ? $setting->google : '' }}">
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="input-group">
                                            <span class="input-group-text text-white d-inline-flex justify-content-center"
                                                style="background-color: #47C756; width: 42px;"><i
                                                    class="fab fa-whatsapp"></i></span>
                                            <input type="text" class="form-control" name="whatsapp"
                                                placeholder="https://www."
                                                value="{{ $setting ? $setting->whatsapp : '' }}">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer text-end p-3">
                        <button type="submit" class="btn btn-primary btn-sm">Update</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
@endsection
