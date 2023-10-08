@extends('layouts.admin.app')

@section('content')
    <div class="row g-3">
        <div class="col-lg-4 order-lg-last">
            <form action="{{ Route('admin.category.store') }}" method="POST" enctype="multipart/form-data" id="addForm">
                @csrf
                <div class="card">
                    <div class="card-header">
                        <h6 class="h6 mb-0 py-1 text-uppercase">Add New Category</h6>
                    </div>
                    <div class="card-body">
                        <div class="row g-3">
                            <div class="col-12">
                                <label for="name" class="form-label"><b>Name</b></label>
                                <input type="text" class="form-control" id="name" name="name" required
                                    placeholder="Category Name">
                            </div>
                            <div class="col-12">
                                <label for="parent_id" class="form-label"><b>Parent Category</b></label>
                                <select name="parent_id" id="parent_id" class="select form-select"
                                    data-placeholder="Select Parent..">
                                    <option value="" disabled selected></option>
                                    @foreach ($categories as $category)
                                        <option value="{{ $category->id }}">{{ $category->name }}</option>
                                        @foreach ($category->children as $child)
                                            <option value="{{ $child->id }}">{{ $child->name }}</option>
                                        @endforeach
                                    @endforeach
                                </select>
                            </div>
                            <div class="col-12">
                                <label for="image" class="form-label"><b>Image <span
                                            class="text-danger">(200x200)</span></b></label>
                                <input type="file" id="image" name="image" class="form-control" accept="image/*">
                            </div>
                            <div class="col-12">
                                <div class="d-flex gap-3 align-items-center flex-wrap">
                                    <div class="flex-shrink-0">
                                        <div class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" name="featured"
                                                id="featured">
                                            <label class="custom-control-label" for="featured">Featured</label>
                                        </div>
                                    </div>
                                    <div class="flex-shrink-0">
                                        <div class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" name="status" checked
                                                id="status">
                                            <label class="custom-control-label" for="status">Show</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer text-end">
                        <button type="submit" class="btn btn-sm btn-primary">Add New</button>
                    </div>
                </div>
            </form>

            <form action="" method="POST" id="editForm" enctype="multipart/form-data" style="display: none;">
                @csrf
                @method('PUT')
                <div class="card">
                    <div class="card-header">
                        <h6 class="h6 mb-0 py-1 text-uppercase">Edit Category</h6>
                    </div>
                    <div class="card-body">
                        <div class="row g-3">
                            <div class="col-12">
                                <label for="old_name" class="form-label"><b>Name</b></label>
                                <input type="text" class="form-control" id="old_name" name="name" required
                                    placeholder="Category Name">
                            </div>
                            <div class="col-12">
                                <label for="old_parent_id" class="form-label"><b>Parent Category</b></label>
                                <select name="parent_id" id="old_parent_id" class="select form-select"
                                    data-placeholder="Select Parent..">
                                </select>
                            </div>
                            <div class="col-12">
                                <label for="image" class="form-label"><b>Image <span
                                            class="text-danger">(200x200)</span></b></label>
                                <input type="file" id="image" name="image" class="form-control" accept="image/*">
                                <img src="" id="image_old" class="mt-2" height="60" alt="Image"
                                    style="display: none;">
                            </div>
                            <div class="col-12">
                                <div class="d-flex gap-3 align-items-center flex-wrap">
                                    <div class="flex-shrink-0">
                                        <div class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" name="featured"
                                                id="old_featured">
                                            <label class="custom-control-label" for="old_featured">Featured</label>
                                        </div>
                                    </div>
                                    <div class="flex-shrink-0">
                                        <div class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" name="status"
                                                id="old_status">
                                            <label class="custom-control-label" for="old_status">Show</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-footer text-end">
                        <div class="d-flex justify-content-between">
                            <button type="button" class="btn btn-sm btn-warning" id="cancelBtn">Cancel</button>
                            <button type="submit" class="btn btn-sm btn-primary">Update</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
        <div class="col-lg-8">
            <div class="card">
                <div class="card-header">
                    <h6 class="h6 mb-0 py-1 text-uppercase">Category Setup</h6>
                </div>
                <div class="card-body">
                    <table class="dataTable table align-middle" style="width:100%">
                        <thead>
                            <tr class="text-nowrap">
                                <th width="3"></th>
                                <th>Image</th>
                                <th>Name</th>
                                <th>Parent Category</th>
                                <th>Status</th>
                                <th width="110" class="text-end">Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                        <tfoot>
                            <tr>
                                <th class="text-center" colspan="1">
                                    <div class="custom-control custom-checkbox">
                                        <input type="checkbox" class="custom-control-input" id="selectAll">
                                        <label class="custom-control-label" for="selectAll"></label>
                                    </div>
                                </th>
                                <th colspan="5">
                                    <button type="button" name="bulk_delete"
                                        data-url="{{ Route('admin.category.destroy', '0') }}" id="bulk_delete"
                                        class="btn btn btn-xs btn-danger">Delete</button>
                                </th>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('js')
    <script type="text/javascript">
        $(document).ready(function() {
            var table = $('.dataTable').dataTable({
                processing: true,
                serverSide: true,
                scrollX: true,
                ajax: {
                    url: "{{ Route('admin.category.index') }}",
                    type: "GET",
                },
                columns: [{
                        data: "checkbox",
                        name: "checkbox",
                        orderable: false,
                        searchable: false,
                        width: '3'
                    },
                    {
                        data: 'image',
                        name: 'image'
                    },
                    {
                        data: 'name',
                        name: 'name'
                    },
                    {
                        data: 'parent',
                        name: 'parent'
                    },
                    {
                        data: 'status',
                        name: 'status'
                    },
                    {
                        data: 'actions',
                        name: 'actions',
                        orderable: false,
                        searchable: false,
                        className: "text-end",
                    },
                ]
            });

            $(document).on('click', '.link-edit', function(e) {
                e.preventDefault();
                let url = $(this).data('url');
                $.ajax({
                    url: url,
                    data: {
                        _method: 'GET',
                    },
                    success: (response) => {
                        if (response.status == 'success') {
                            $('#editForm').attr('action', response.form_link);
                            $('#old_name').val(response.data.name);
                            if (response.data.status == '1') {
                                $('#old_status').attr('checked', true);
                            } else {
                                $('#old_status').attr('checked', false);
                            }
                            if (response.data.featured == '1') {
                                $('#old_featured').attr('checked', true);
                            } else {
                                $('#old_featured').attr('checked', false);
                            }
                            if (response.data.image) {
                                $('#image_old').attr('src', window.location.origin + '/' +
                                    response.data.image);
                                $('#image_old').show();
                            } else {
                                $('#image_old').hide();
                            }

                            $('#old_parent_id option').remove();
                            $('#old_parent_id').append(
                                '<option value="NULL">--</option>');
                            $.each(response.categories, function(key, value) {
                                var option = '<option value="' + value.id + '"';
                                if (value.id == response.data.parent_id) {
                                    option += ' selected ';
                                }
                                option += '>' + value.name + '</option>';

                                $.each(value.children, function(key, value) {
                                    var option = '<option value="' + value.id +
                                        '"';
                                    if (value.id == response.data.parent_id) {
                                        option += ' selected ';
                                    }
                                    option += '>' + value.name + '</option>';
                                    $('#old_parent_id').append(option);
                                });

                                $('#old_parent_id').append(option);
                            });

                            var placeholder = $(this).data('placeholder');
                            placeholder = !placeholder ? "choose" : placeholder;
                            $('.select').select2({
                                placeholder: placeholder,
                            });

                            $('#editForm').show();
                            $('#addForm').hide();
                        }
                        if (response.status == 'error') {
                            Swal.fire({
                                width: "22rem",
                                title: "Failed!",
                                text: "You don't have any Authority to do this action",
                                icon: "error",
                                showConfirmButton: false,
                                timer: 1500
                            });
                        }
                    }
                });
            });

            $(document).on('click', '#cancelBtn', function(e) {
                e.preventDefault();
                $('#editForm').hide();
                $('#addForm').show();
            });
        });
    </script>
@endpush
