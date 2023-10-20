@php
    $dashboard = App\Helper\AdditionalDataResource::getDashboardData();
@endphp


@extends('layouts.admin.app')
@push('css')
<style>
    .card-counter{
        position: relative;
        box-shadow: 2px 2px 10px #DADADA;
        margin: 5px;
        padding: 20px 10px;
        background-color: #fff;
        height: 100px;
        border-radius: 5px;
        transition: .3s linear all;
    }

    .card-counter:hover{
        box-shadow: 4px 4px 20px #DADADA;
        transition: .3s linear all;
    }

    .card-counter.primary{
        background-color: #007bff;
        color: #FFF;
    }

    .card-counter.danger{
        background-color: #ef5350;
        color: #FFF;
    }  

    .card-counter.success{
        background-color: #66bb6a;
        color: #FFF;
    }  

    .card-counter.info{
        background-color: #26c6da;
        color: #FFF;
    }  

    .card-counter i{
        font-size: 5em;
        opacity: 0.2;
    }

    .card-counter .count-numbers{
        position: absolute;
        right: 35px;
        top: 20px;
        font-size: 32px;
        display: block;
    }

    .card-counter .count-name{
        position: absolute;
        right: 35px;
        top: 65px;
        font-style: italic;
        text-transform: capitalize;
        opacity: 0.5;
        display: block;
        font-size: 18px;
    }

</style>
@endpush
 

@section('content')
    <div class="dashboard">
        <div class="container">
            <div class="row">
                <div class="col-md-3">
                    <div class="card-counter primary">
                        <i class="fab fa-first-order"></i>
                        <span class="count-numbers">{{ $dashboard['total_order'] }}</span>
                        <span class="count-name">Total Order</span>
                    </div>
                </div>
            
                <div class="col-md-3">
                    <div class="card-counter danger">
                        <i class="fas fa-folder-plus"></i>
                        <span class="count-numbers">{{ $dashboard['new_order'] }}</span>
                        <span class="count-name">New Order</span>
                    </div>
                </div>
            
                <div class="col-md-3">
                    <div class="card-counter info">
                        <i class="fas fa-spinner"></i>
                        <span class="count-numbers">{{ $dashboard['on_progress'] }}</span>
                        <span class="count-name">On Progress</span>
                    </div>
                </div>
            
                <div class="col-md-3">
                    <div class="card-counter success">
                        <i class="fas fa-truck-container"></i>
                        <span class="count-numbers">{{ $dashboard['delivered'] }}</span>
                        <span class="count-name">Delivered</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
