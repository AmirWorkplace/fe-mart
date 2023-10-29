

@extends('layouts.admin.app')

@section('content')
<div class="row g-3">
    <div class="col-12">
        <div class="card">
            <div class="card-header px-3 py-2">
                <div class="d-flex justify-content-between align-items-center">
                    <h6 class="h6 mb-0 text-uppercase">Manage Responsive Portfolio Description</h6>
                    <a href="{{ Route('admin.reseller-product-discount.create') }}" class="btn btn-primary btn-sm text-uppercase">
                        Add New
                    </a>
                </div>
            </div>
            <div class="card-body">
                <table class="dataTable table align-middle" style="width:100%">
                    <thead>
                        <tr class="text-nowrap">
                            <th width="3"></th>
                            <th>Offer Date</th>
                            <th>Product Name</th>
                            <th>Reseller Price</th>
                            <th>Discount</th>
                            <th>Discount Price</th>
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
                            <th colspan="4">
                                <button type="button" name="bulk_delete"
                                    data-url="{{ Route('admin.reseller-product-discount.destroy', '0') }}" id="bulk_delete"
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
                    url: "{{ Route('admin.reseller-product-discount.index') }}",
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
                        data: 'date',
                        name: 'date',
                        orderable: false,
                        searchable: false,
                    },
                    {
                        data: 'product_name',
                        name: 'product_name',
                    },
                    {
                        data: 'reseller_price',
                        name: 'reseller_price',
                    },
                    {
                        data: 'discount',
                        name: 'discount',
                    },
                    {
                        data: 'discount_price',
                        name: 'discount_price',
                    },
                    {
                        data: 'status',
                        name: 'status',
                        orderable: false,
                        searchable: false,
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
        });
</script>
@endpush