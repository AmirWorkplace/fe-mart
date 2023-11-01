<?php

namespace App\Http\Controllers\Reseller;

use App\Helper\AdditionalDataResource;
use App\Helper\UserManagement;
use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Withdraw;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Yajra\DataTables\Facades\DataTables;

class WithdrawController extends Controller
{
    public string|array $route_path;
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        if(UserManagement::role('System Admin')){
            if (request()->ajax()) {
                $model = Withdraw::query();
                return DataTables::eloquent($model)
                    ->filter(function ($query) {
                        if (!empty(request('start_date')) && !empty(request('end_date'))) {
                            $query->where('created_at', '>=', request('start_date'))->where('created_at', '<=', request('end_date'));
                        }
                        if (!empty(request('status'))) {
                            $query->where('status', request('status'));
                        }
                    }, true)
                    ->addIndexColumn()
                    ->addColumn('created_at', function($row){
                        return $row->created_at->format('Y-m-d | H:i:s');
                    })
                    ->addColumn('reseller_name', function($row){
                        return User::where('id', $row->user_id)->first()->name;
                    })
                    ->addColumn('withdraw_amount', function($row){
                        return "<p class='text-center'>" . number_format($row->withdraw_amount, 2) . " Tk.</p>";
                    })
                    ->addColumn('withdrawal_method', function($row){
                        return "<p class='text-center'>" . ucwords($row->withdrawal_method) . "</p>";
                    })
                    ->addColumn('account_number', function($row){
                        return "<p class='text-center'>" . ucwords($row->account_number) . "</p>";
                    })
                    ->addColumn('transaction_id', function($row){
                        return "<input data-id={$row->id} placeholder='TX-*******' class='input_transaction_id text-center form-control form-input' value='{$row->transaction_id}'/>";
                    })
                    ->addColumn('status', function ($row) {
                        if($row->status == 'Succeed') return '<span class="btn btn-xs text-light bg-success">Paid</span>'; 
                        if($row->status == 'Canceled') return '<span class="btn btn-xs text-light bg-danger">Canceled</span>'; 

                        return "
                            <div class='input-group'>
                                <select data-id='{$row->id}' class='form-control select2 withdraw_status'>
                                <option value='Pending' " . ($row->status == 'Pending' ? 'selected' : '') . ">Pending</option>
                                <option value='Accepted' " . ($row->status == 'Accepted' ? 'selected' : '') . ">Accepted</option>
                                <option value='Succeed' " . ($row->status == 'Succeed' ? 'selected' : '') . ">Paid</option>
                                <option value='Canceled' " . ($row->status == 'Canceled' ? 'selected' : '') . ">Canceled</option>
                                </select>
                            </div>
                        ";
                    })
                    /* ->addColumn('actions', function ($row) {
                        $actionBtn = '<div class="btn-group">
                                        <a href="' . Route('admin.withdraw.edit', $row->id) . '" class="btn btn-sm btn-success border-0 px-10px fs-15">
                                            <i class="fas fa-eye"></i>
                                        </a>
                                    </div>';
                        return $actionBtn;, 'actions'
                    }) */
                    ->rawColumns(['checkbox', 'created_at', 'reseller_name', 'withdraw_amount', 'account_number', 'withdrawal_method', 'transaction_id', 'status'])
                    ->make(true);
            }

            return view('admin.withdraw.index');

        } else if(UserManagement::role('Reseller Admin')){
            // return 0;
            if (request()->ajax()) {
                $model = Withdraw::where('user_id', Auth::id());
                return DataTables::eloquent($model)
                    ->filter(function ($query) {
                        if (!empty(request('start_date')) && !empty(request('end_date'))) {
                            $query->where('created_at', '>=', request('start_date'))->where('created_at', '<=', request('end_date'));
                        }
                        if (!empty(request('status'))) {
                            $query->where('status', request('status'));
                        }
                    }, true)
                    ->addIndexColumn()
                    ->addColumn('withdraw_amount', function($row){
                        return "<p class='text-center'>" . number_format($row->withdraw_amount, 2) . " Tk</p>";
                    })
                    ->addColumn('account_number', function($row){
                        return "<p class='text-center'>" . ucwords($row->account_number) . "</p>";
                    })
                    ->addColumn('created_at', function($row){
                        return $row->created_at->format('Y-m-d | H:i:s');
                    })
                    ->addColumn('status', function ($row) {
                        switch ($row->status) {
                            case 'Canceled':
                                return "<span class='btn btn-xs text-light bg-danger'>Canceled</span>";
    
                            case 'Succeed':
                                return '<span class="btn btn-xs text-light bg-success">Paid</span>';
    
                            case 'Pending':
                                return '<span class="btn btn-xs text-dark bg-warning">Pending</span>'; 
    
                            case 'Accepted':
                                return '<span class="btn btn-xs text-white bg-info">Accepted</span>'; 
    
                            default:
                                return '<span class="btn btn-xs text-light bg-warning">Pending</span>';
                        }
                    })
                    ->addColumn('withdrawal_method', function($row){
                        return "<p class='text-center'>". ucwords($row->withdrawal_method) ."</p>";
                    })
                    ->addColumn('actions', function ($row) {
                        $actionBtn = 
                            "<div class='btn-group'>
                                <a href='" . route('admin.withdraw.edit', $row->id) . "' class='btn btn-sm btn-warning border-0 px-10px fs-15 link-edit'>
                                    <i class='far fa-pencil-alt'></i>
                                </a>
                                <button type='button' class='btn btn-sm btn-danger border-0 px-10px fs-15 link-delete' 
                                  data-url='" . route('admin.withdraw.destroy', $row->id) . "'>
                                    <i class='far fa-trash-alt'></i>
                                </button>
                            </div>";

                        if($row->status != 'Pending'){
                            $actionBtn = 
                                "<div class='btn-group opacity-75 pe-none'>
                                    <a href='#' class='btn btn-sm btn-warning border-0 px-10px fs-15 link-edit'>
                                        <i class='far fa-pencil-alt'></i>
                                    </a>
                                    <button type='button' class='btn btn-sm btn-danger border-0 px-10px fs-15 link-delete' 
                                    data-url='#'>
                                        <i class='far fa-trash-alt'></i>
                                    </button>
                                </div>";                
                        }

                        return $actionBtn;
                    })
                    ->rawColumns(['checkbox', 'created_at', 'withdraw_amount', 'account_number', 'withdrawal_method', 'status', 'actions'])
                    ->make(true);
            }
            return view('reseller.withdraw.index');
        } else {
            return redirect()->route('admin.dashboard')->withErrors("You have not a permission to access this Page");
        }
    }

    /** id='" . route('admin.withdraw.edit', $row->id) . "' id='" . route('admin.withdraw.edit', $row->id) . "'
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('reseller.withdraw.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'payment_method' => 'required',
            'withdraw_amount' => 'required',
            'password' => 'required',
            'account_number' => 'required',
            'total_earning' => 'required',
        ]);

        $user = User::with('reseller')->findOrFail(Auth::id()); 

        if(Hash::check($request->password, $user->password)) {
            Withdraw::create([
                'user_id' => $user->id,
                'total_earning' => $request->total_earning,
                'withdrawal_method' => $request->payment_method,
                'withdraw_amount' => $request->withdraw_amount,
                'account_number' => $request->account_number,
                'status' => 'Pending'
            ]);

            return redirect()->route('admin.withdraw.index')->withSuccessMessage('Your Withdraw Request Sended Successfully!');
        }else{
            return redirect()->back()->withErrors("Your Password didn't match");
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id){}

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        if(UserManagement::role('System Admin')){
            if(request()->ajax()){
                switch(request('type')){
                    case 'transaction_id':
                        Withdraw::where('id', request('id'))->update(['transaction_id'=> request('transaction_id')]);
                        return response()->json(['status'=> true, 'message'=> 'Payment Transaction ID Changed Successfully!']);

                    case 'status':
                            Withdraw::where('id', request('id'))->update(['status'=> request('status')]);
                            AdditionalDataResource::initiateResellerStatement(id: request('id'), status: request('status'), type: 'withdraw');
                            return response()->json(['status'=> true, 'message'=> 'Payment Request Status Changed Successfully!']);

                    default: 
                        return response()->json(['status'=> true, 'message'=> 'No Change detected here!']);
                }
            }
        }

        if(UserManagement::role('Reseller Admin')){
            $data = Withdraw::findOrFail($id);

            if($data->status != 'Pending') return redirect()->route('admin.withdraw.index')->withErrors('You can not edit your withdraw request after `Accepting & Success`');

            $withdraw_method = $data->account_number;

            if($data->withdrawal_method == 'bank'){
                $withdraw_method = User::with('reseller')->findOrFail(Auth::id())->reseller;
            }

            $account = $this->showAccountNumber($data->withdrawal_method, $withdraw_method, true);
            return view("reseller.withdraw.edit", compact("data", "account"));
        }

        return redirect('/')->withErrors('Sorry, You do not have any permission for this route!');
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $data = Withdraw::findOrFail($id);

        if($data->status != 'Pending') return redirect()->route('admin.withdraw.index')->withErrors('You can not edit your withdraw request after `Accepting & Success`');

        $request->validate([
            'payment_method' => 'required',
            'withdraw_amount' => 'required',
            'password' => 'required',
            'account_number' => 'required',
            'total_earning' => 'required',
        ]);

        $user = User::with('reseller')->findOrFail(Auth::id()); 

        if(Hash::check($request->password, $user->password)) {
                $data->user_id = $user->id;
                $data->total_earning = $request->total_earning;
                $data->withdrawal_method = $request->payment_method;
                $data->withdraw_amount = $request->withdraw_amount;
                $data->account_number = $request->account_number;

                $data->save();

            return redirect()->route('admin.withdraw.index')->withSuccessMessage('Your Withdraw Request Sended Successfully!');
        }else{
            return redirect()->back()->withErrors("Your Password didn't match");
        }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }

    // Show payment method --- custom routes ----
    public function showPaymentMethod(){
        $user = User::with('reseller')->findOrFail(Auth::id()); 

        if(request()->ajax()){
            switch(request('payment_method')){
                case 'cash':
                    return $this->showAccountNumber('cash', '0');
                
                case 'bkash':
                    return $this->showAccountNumber('bkash', $user->reseller->bkash);
                
                case 'nagad':
                    return $this->showAccountNumber('nagad', $user->reseller->nagad);
                
                case 'bank':
                    return $this->showAccountNumber('bank', $user->reseller);
                
                case 'rocket':
                    return $this->showAccountNumber('rocket', $user->reseller->rocket);
                
                case 'upay':
                    return $this->showAccountNumber('upay', $user->reseller->upay);
                
                default: 
                    return request('payment_method');
            }
        }
    }

    protected function showAccountNumber(string $type, mixed $account, $protected = null){
        $data = "";

        if($type == 'bank'){
            $data = "<div class='col-12'>
                        <div class='p-2'>
                            <input type='hidden' name='account_number' value='{$account->bank_account}' />
                            <p class='m-0'>Bank Name:  <b>{$account->bank_name}</b></p>
                            <p class='m-0'>Branch Name:  <b>{$account->bank_branch_name}</b></p>
                            <p class='m-0'>Account Number:  <b>{$account->bank_account}</b></p>
                        </div>
                    </div>";
        } else if($type == 'cash') {
            $data = "<div class='col-12'>
                        <p style='margin: 35px 0 0 10px;' for='account_number'><b>Payment By Cash</b></p>
                        <input type='hidden' name='account_number' value='0' />
                    </div>";
        } else {
            $data = "<div class='col-12'>
                        <label for='account_number' class='form-label require text-capitalize'><b>{$type} Number</b></label>
                        <input type='hidden' name='account_number' value='{$account}' />
                        <input type='text' value='{$account}' name='disabled_account_number' disabled class='custom-input form-control'>
                    </div>";
        }
        
        if($protected) return $data;
        return response()->json(['status'=> true, 'data'=> $data]);
    }
}


// $actionBtn = "<div class='btn-group'>
//                 <a href='" . route('admin.withdraw.edit', $row->id) . "'class='btn btn-sm btn-success border-0 px-10px fs-15'>
//                     <i class='fas fa-eye'></i>
//                 </a>
//                 <a href='" . route('admin.withdraw.edit', $row->id) . "'class='btn btn-sm btn-danger border-0 px-10px fs-15'>
//                     <i class='fas fa-trash'></i>
//                 </a>
//             </div>";