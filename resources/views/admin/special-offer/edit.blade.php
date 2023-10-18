@extends('layouts.admin.app')

@push('css')
<link rel="stylesheet" href="{{ asset('backend/css/jquery.minicolors.css') }}">
@endpush

@section('content')
<form action="{{ Route('admin.responsive-portfolio-description.update', $data ? $data->id : '0') }}" method="POST">
    @csrf
    @method('PUT')
    <div class="row g-3">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <h6 class="h6 mb-0 py-5px">Update Responsive Portfolio Description</h6>
                </div>
                <div class="card-body p-4">
                    <div class="row g-3">
                        <div class="col-md-8 col-sm-6">
                            <label for="title" class="form-label require"><b>Responsive Portfolio Title</b></label>
                            <input type="text" placeholder="Title" class="form-control custom-input" id="title" name="title"
                            value="{{ $data ? $data->title : '' }}">
                        </div>
                        <div class="col-12">
                            <label for="serial" class="form-label require"><b>Priority Serial</b></label>
                            <input type="text" placeholder="Priority Serial" class="form-control custom-input" id="serial" name="serial" value="{{ $data->serial }}" required>
                        </div>
                        <div class="col-12">
                            <label for="description" class="form-label"><b>Responsive Portfolio Description</b></label>
                            <textarea name="description" id="description" required class="description" cols="30" rows="10" placeholder="Write here your Descriptions">{!! $data ? $data->description : '' !!}</textarea>
                        </div>
                    </div>
                </div>
                <div class="card-footer text-end">
                    <div class="py-1">
                        <button type="submit" class="btn btn-sm btn-primary">Update Now</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
@endsection
 