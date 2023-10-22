@extends('layouts.admin.app')

@section('content')
    @php 
        $app_data = json_encode([
            "user"=> Auth::user(),
            "resellerRoutes" => [
                "orderStore" => route('admin.order-place.store'),
                "orderView" => route('admin.order-place.index'),
            ],
            "productsList"=> App\AdditionalDataResource::getProductLists(),
            "customerOfReseller"=> App\AdditionalDataResource::getCustomerOfReseller(),
        ]);
    @endphp
    
    <div id="react-app-data" react-app-data="{{ $app_data }}"></div>
    <div id="react-app"></div>
@endsection