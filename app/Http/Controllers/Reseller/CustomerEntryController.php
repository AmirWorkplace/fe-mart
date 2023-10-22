<?php

namespace App\Http\Controllers\Reseller;

use App\helperClass;
use App\Http\Controllers\Controller;
use App\Models\CustomerEntry;
use App\Rules\ResellerRuleValidation;
use Illuminate\Http\Request;

class CustomerEntryController extends Controller
{

    public string|array $route_path;

    public function __construct(){
        $this->route_path = [
            'view' => 'reseller.customer-entry',
            'route' => 'admin.customer-entry',
        ];
    }

    // Display a listing of the resource.
    public function index()
    {
        return helperClass::resourceDataView(CustomerEntry::query(), ['name', 'phone', 'email'], null, $this->route_path);
    }

    // Show the form for creating a new resource.
    public function create()
    {
        return view('reseller.customer-entry.create');
    }

    // Store a newly created resource in storage.
    public function store(Request $request)
    {
        $request->validate(['name' => 'required', 'phone'=> 'required|unique:customer_entries,phone', 'reseller_id' => ['required', new ResellerRuleValidation]]);

        return helperClass::resourceDataStore('customer_entries', $request, ['name', 'reseller_id', 'phone', 'email', 'address'], null, null, $this->route_path);
    }

    // Display the specified resource.
    public function show(string $id)
    {
        //
    }

    // Show the form for editing the specified resource.
    public function edit(string $id)
    {
        if (request()->ajax()) {
            $data = CustomerEntry::findOrFail($id);
            $data->update(['status' => !$data->status]);
            return response()->json(['status' => 'success']);
        }

        $data = CustomerEntry::findOrFail($id);
        return view('reseller.customer-entry.edit', compact('data'));
    }

    // Update the specified resource in storage.
    public function update(Request $request, string $id)
    {
        $customer = CustomerEntry::findOrFail($id);

        if($customer->phone != $request->phone) {
            $request->validate(['phone'=> 'required|unique:customer_entries,phone']);
        }

        $request->validate(['name' => 'required', 'phone'=> 'required']);

        return helperClass::resourceDataUpdate('customer_entries', $id, $request, ['name', 'phone', 'email', 'address'], null, null, $this->route_path);
    }

    // Remove the specified resource from storage.
    public function destroy(Request $request, string $id)
    {
        return helperClass::resourceDataDelete('customer_entries', $request, $id, null, null);
    }
}
