<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Order;
use Illuminate\Http\Request;
use Yajra\DataTables\Facades\DataTables;

class OrderController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        if (request()->ajax()) {
            $model = Order::with(['products', 'user']);
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
                ->addColumn('order_products', function ($row) {
                    return count($row->products);
                })
                ->addColumn('order_date', function ($row) {
                    return date('d M Y h:i A');
                })
                ->addColumn('order_status', function ($row) {
                    if ($row->status == 'Canceled') {
                        $status = '<span class="btn btn-xs text-white bg-danger">Canceled</span>';
                    } elseif ($row->status == 'Successed') {
                        $status = '<span class="btn btn-xs text-white bg-success">Successed</span>';
                    } else {
                        $status = '<select name="status" class="form-select select2 order_status fs-14" data-id="' . $row->id . '">';

                        $status .= '<option';
                        if ($row->status == 'Pending' || $row->status == 'Confirmed' || $row->status == 'Processing' || $row->status == 'Delivered') {
                            $status .= ' selected disabled';
                        }
                        $status .= ' value="Pending">Pending</option>';

                        $status .= '<option';
                        if ($row->status == 'Confirmed' || $row->status == 'Processing' || $row->status == 'Delivered') {
                            $status .= ' selected disabled';
                        }
                        $status .= ' value="Confirmed">Confirmed</option>';

                        $status .= '<option';
                        if ($row->status == 'Processing' || $row->status == 'Delivered') {
                            $status .= ' selected disabled';
                        }
                        $status .= ' value="Processing">Processing</option>';

                        $status .= '<option';
                        if ($row->status == 'Delivered') {
                            $status .= ' selected disabled';
                        }
                        $status .= ' value="Delivered">Delivered</option>';
                        $status .= '<option value="Successed">Successed</option>';
                        $status .= '<option value="Canceled">Canceled</option>';

                        $status .= '</select>
                        </form>';
                    }
                    return $status;
                })
                ->addColumn('actions', function ($row) {
                    $actionBtn = '<div class="btn-group">
                        <a href="' . Route('admin.order.edit', $row->id) . '" class="btn btn-sm btn-success border-0 px-10px fs-15"><i class="fas fa-eye"></i></a>
                        <a href="' . Route('admin.order.show', $row->id) . '" target="_blank" class="btn btn-sm btn-info text-white border-0 px-10px fs-15"><i class="fas fa-print"></i></a>
                    </div>';
                    return $actionBtn;
                })
                ->rawColumns(['checkbox', 'order_status', 'actions'])
                ->make(true);
        }
        return view('admin.order.index');
    }


    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $order = Order::findOrFail($id);
        return view('admin.order.print', compact('order'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        if (request()->ajax()) {
            $data = Order::findOrFail(request('id'));
            $data->update(['status' => request('status')]);
            return response()->json(['status' => 'success']);
        }
        $order = Order::findOrFail($id);
        return view('admin.order.view', compact('order'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        //
    }
}
