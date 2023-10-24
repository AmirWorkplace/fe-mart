{{-- <div class="accordion-body"> --}}
  {{-- <div class="content"> --}}
      <div class="d-flex gap-4 my-3">
          <input type="hidden" name="shipping_address_id"
              value="{{ $shipping_address ? $shipping_address->id : '' }}">
          <div class="flex-shrink-0 form-check deliver_location">
              <input class="form-check-input" type="radio" id="home"
                  name="address_type"
                  {{ ($shipping_address && $shipping_address->address_type == 'home') || is_null($shipping_address) ? 'checked' : '' }} value="home">
              <label class="form-check-label" for="home">
                  Home
              </label>
          </div>
          <div class="flex-shrink-0 form-check deliver_location">
              <input class="form-check-input" type="radio" id="office"
                  {{ $shipping_address && $shipping_address->address_type == 'office' ? 'checked' : '' }} name="address_type" value="office">
              <label class="form-check-label" for="office">
                  Office
              </label>
          </div>
      </div>
      <div class="row g-3 mb-4 address">
          <div class="col-12">
              <div class="row g-2 align-items-center">
                  <label class="col-md-2 form-control-label required"
                      for="name">Full
                      Name</label>
                  <div class="col-md-8">
                      <input type="text" id="name" name="name"
                          placeholder="Full Name" class="form-control"
                          value="{{ $shipping_address ? $shipping_address->name : old('name') }}">
                  </div>
                  <div class="col-md-2 label">
                  </div>
              </div>
          </div>
          <div class="col-12">
              <div class="row g-2 align-items-center">
                  <label class="col-md-2 form-control-label required"
                      for="phone">Phone
                      Number</label>
                  <div class="col-md-8">
                      <input type="number" id="phone" name="phone"
                          placeholder="Phone Number" class="form-control"
                          value="{{ $shipping_address ? $shipping_address->phone : old('phone') }}">
                  </div>
                  <div class="col-md-2 label">
                  </div>
              </div>
          </div>
          <div class="col-12">
              <div class="row g-2 align-items-center">
                  <label class="col-md-2 form-control-label" for="email">Email
                      Address</label>
                  <div class="col-md-8">
                      <input type="email" id="email" name="email"
                          placeholder="Email Address" class="form-control"
                          value="{{ $shipping_address ? $shipping_address->email : old('email') }}">
                  </div>
                  <div class="col-md-2 label">
                      Optional
                  </div>
              </div>
          </div>
          <div class="col-12">
              <div class="row g-2 align-items-center">
                  <label class="col-md-2 form-control-label required" 
                      for="division">Division</label>
                  <div class="col-md-8">
                      <select name="division" id="division"
                          class="form-select select2">
                          <option value="">-- Select Division --</option>
                          @foreach ($divisions as $division)
                              <option value="{{ $division->id }}"
                                  {{ $shipping_address && $shipping_address->division_id == $division->id ? 'selected' : '' }}>
                                  {{ $division->name }}</option>
                          @endforeach
                      </select>
                  </div>
                  <div class="col-md-2 label">
                  </div>
              </div>
          </div>
          <div class="col-12">
              <div class="row g-2 align-items-center">
                  <label class="col-md-2 form-control-label required" 
                      for="district">District </label>
                  <div class="col-md-8">
                      <select name="district" id="district"
                          class="form-select select2">
                          @if ($selected_district)
                              <option value="{{ $selected_district->id }}" selected>
                                  {{ $selected_district->name }}</option>
                          @else
                              <option value="">-- Select District --</option>
                          @endif
                      </select>
                  </div>
                  <div class="col-md-2 label">
                  </div>
              </div>
          </div>
          <div class="col-12">
              <div class="row g-2 align-items-center">
                  <label class="col-md-2 form-control-label required"
                      for="upozila">Upozila </label>
                  <div class="col-md-8">
                      <select name="upozila" id="upozila" 
                          class="form-select select2">
                          @if ($selected_upozila)
                              <option value="{{ $selected_upozila->id }}" selected>
                                  {{ $selected_upozila->name }}</option>
                          @else
                              <option value="">-- Select Upozila --</option>
                          @endif
                      </select>
                  </div>
                  <div class="col-md-2 label">
                  </div>
              </div>
          </div>
          <div class="col-12">
              <div class="row g-2 align-items-center">
                  <label class="col-md-2 form-control-label required"
                      for="street">Street </label>
                  <div class="col-md-8">
                      <textarea name="street" id="street" class="form-control" cols="30" rows="3"
                          placeholder="Street Address">{{ $shipping_address ? $shipping_address->street : '' }}</textarea>
                  </div>
                  <div class="col-md-2 label">
                  </div>
              </div>
          </div>
      </div>
  {{-- </div> --}}
{{-- </div> --}}