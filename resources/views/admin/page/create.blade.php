@extends('layouts.admin.app')

@section('content')
    <div class="row g-3">
        <div class="col-12">
            <form action="{{ Route('admin.page.store') }}" method="POST" enctype="multipart/form-data" id="store_form">
                @csrf
                <div class="card">
                    <div class="card-header p-3">
                        <div class="d-flex justify-content-between align-items-center">
                            <h6 class="h6 mb-0 text-uppercase">Add New Page</h6>
                            <a href="{{ Route('admin.page.index') }}" class="btn btn-primary btn-sm text-uppercase">Go
                                Back</a>
                        </div>
                    </div>
                    <div class="card-body p-4">
                        <div class="row g-3">
                            <div class="col-lg-4 col-sm-6">
                                <label for="name" class="form-label require"><b>Page title</b></label>
                                <input type="text" class="form-control custom-input" id="name" name="name"
                                    required value="{{ old('name') }}" minlength="3" placeholder="Page title">
                            </div>
                            <div class="col-lg-4 col-sm-6">
                                <label for="sub_title" class="form-label require"><b>Page Subtitle</b></label>
                                <input type="text" class="form-control custom-input" id="sub_title" name="sub_title"
                                    required value="{{ old('sub_title') }}" minlength="3" placeholder="Page Subtitle">
                            </div>
                            <div class="col-lg-4 col-sm-6">
                                <label for="status" class="form-label"><b>Status</b></label>
                                <div class="custom-select">
                                    <select class="form-control select2 custom-select__element" name="status"
                                        id="status" required>
                                        <option value="1"
                                            {{ !is_null(old('status')) && old('status') == '1' ? 'selected' : '' }}>Active
                                        </option>
                                        <option value="0"
                                            {{ !is_null(old('status')) && old('status') == '0' ? 'selected' : '' }}>
                                            Inactive</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-12">
                                <label for="description" class="form-label"><b>Description</b></label>
                                <textarea name="description" id="description" class="description form-control" cols="30" rows="10">{!! old('description') !!}</textarea>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer text-end p-3">
                        <button type="submit" class="btn btn-primary btn-sm">Save</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
@endsection
