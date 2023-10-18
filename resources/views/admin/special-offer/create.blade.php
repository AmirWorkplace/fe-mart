@extends('layouts.admin.app')

@section('content')
<div class="row g-3">
    <div class="col-12">
        <form action="{{ Route('admin.responsive-portfolio-description.store') }}" method="POST">
            @csrf
            <div class="card">
                <div class="card-header px-3 py-2">
                    <div class="d-flex justify-content-between align-items-center">
                        <h6 class="h6 mb-0 text-uppercase">Add Responsive Portfolio Description</h6>
                        <a href="{{ Route('admin.responsive-portfolio-description.index') }}" class="btn btn-primary btn-sm text-uppercase">
                            Go Back
                        </a>
                    </div>
                </div>
                <div class="card-body p-4">
                    <div class="row g-3">
                        <div class="col-md-8 col-sm-6">
                            <label for="title" class="form-label require"><b>Responsive Portfolio Title</b></label>
                            <input type="text" placeholder="Title" class="form-control custom-input" id="title"
                                name="title">
                        </div>
                        <div class="col-12">
                            <label for="serial" class="form-label require"><b>Priority Serial</b></label>
                            <input type="text" placeholder="Priority Serial" class="form-control custom-input" id="serial" name="serial" required>
                        </div>
                        <div class="col-12">
                            <label for="description" class="form-label"><b>Responsive Portfolio Description</b></label>
                            <textarea name="description" id="description" class="description" cols="30" rows="10"
                                placeholder="Write here your Descriptions"></textarea>
                        </div>
                    </div>
                </div>

                <div class="card-footer text-end px-3 py-2">
                    <button type="submit" class="btn btn-primary btn-sm">Save</button>
                </div>
            </div>
        </form>
    </div>
</div>
@endsection