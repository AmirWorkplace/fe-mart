
@php 
   $reseller_inquiries = App\Helper\AdditionalDataResource::getResellerEarning();
@endphp
@extends('layouts.admin.app')

@section('content')
<div class="row g-3">
    <div class="col-12">
        <div class="card">
            <div class="card-header px-3 py-2">
                <div class="d-flex justify-content-between align-items-center">
                    <h6 class="h6 mb-0 text-uppercase">Order Management</h6>
                    <form action="#" class="flex-shrink-0 d-flex gap-2" method="GET" id="filter_form">
                        <input type="date" id="start_date" name="start_date" required class="form-control">
                        <input type="date" id="end_date" name="end_date" required class="form-control">
                        <select name="status" id="status" class="form-select">
                            <option value="">Select Status</option>
                            <option value="Pending">Pending</option>
                            <option value="Confirmed">Confirmed</option>
                            <option value="Processing">Processing</option>
                            <option value="Delivered">Delivered</option>
                            <option value="Successed">Succeed</option>
                            <option value="Canceled">Canceled</option>
                        </select>
                        <button type="submit" class="btn btn-sm btn-primary px-4">Filter</button>
                    </form>
                </div>
            </div>
            <div class="card-body">
                <table class="dataTable table align-middle" style="width:100%">
                    <thead>
                        <tr class="text-nowrap">
                            <th>Invoice Date</th>
                            <th>Invoice No.</th>
                            <th>Product Details</th>
                            <th class="text-center">Target Value</th>
                            <th class="text-center">Sale Value</th>
                            <th class="text-center">Reseller Earning</th>
                        </tr>
                    </thead>
                    <tbody>
                    </tbody>
                    <tfoot class="bg-success">
                        <tr class=""> 
                          <th class="text-light">Total</th>
                          <th></th>
                          <th></th>
                          <th class="text-light text-center">{{ number_format($reseller_inquiries['target_value']) }} Tk.</th>
                          <th class="text-light text-center">{{ number_format($reseller_inquiries['resale_value']) }} Tk.</th>
                          <th class="text-light text-center">{{ number_format($reseller_inquiries['reseller_earning']) }} Tk.</th>
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
            url: "{{ Route('admin.reseller-commission.index') }}",
            type: "GET",
        },
        columns: [
            {
                data: 'order_date',
                name: 'order_date'
            },
            {
                data: 'order_code',
                name: 'order_code'
            }, 
            {
                data: 'product_details',
                name: 'product_details'
            }, 
            {
                data: 'invoice_value',
                name: 'invoice_value'
            }, 
            {
                data: 'reseller_value',
                name: 'reseller_value'
            }, 
            {
                data: 'reseller_earning',
                name: 'reseller_earning'
            }, 
        ]
    });

    // update order status
    $(document).on('submit', '#filter_form', function(e) {
        e.preventDefault();
        $('.dataTable').DataTable().draw();
    });

      $(document).on('change', '.order_status', function(event) {
          event.preventDefault();
          let id = $(this).data('id');
          let status = $(this).val();
          $.ajax({
              url: "{{ Route('admin.reseller-commission.edit', '0') }}",
              type: 'POST',
              data: {
                  _method: 'GET',
                  id: id,
                  status: status,
              },
              success: (response) => {
                  if (response.status == 'success') {
                      Swal.fire({
                          toast: true,
                          text: 'Changed Successfully!',
                          position: 'top-right',
                          icon: 'success',
                          iconColor: 'white',
                          customClass: {
                              popup: 'success-toast'
                          },
                          showConfirmButton: false,
                          timer: 1500,
                          timerProgressBar: true
                      });
                      $('.dataTable').DataTable().ajax.reload(function() {
                          $('.select2').select2({
                              minimumResultsForSearch: -1
                          });
                      });
                  }
              }
          });
      });
  });
</script>
@endpush
