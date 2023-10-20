<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Menu;
use App\Models\MenuItem;
use App\Models\Page;
use Illuminate\Http\Request;

class MenuItemController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index($id)
    {
        $menu = Menu::findOrFail($id);
        $page_id = [];
        $categoryData = [];
        foreach ($menu->rootItems as $item) {
            if (!is_null($item->page_id)) {
                $page_id[] = $item->page_id;
            }
            if (!is_null($item->category_id)) {
                $categoryData[] = $item->category_type . '-' . $item->category_id;
            }
            foreach ($item->children as $child) {
                if (!is_null($child->page_id)) {
                    $page_id[] = $child->page_id;
                }
                if (!is_null($child->category_id)) {
                    $categoryData[] = $child->category_type . '-' . $child->category_id;
                }
                foreach ($child->children as $child) {
                    if (!is_null($child->page_id)) {
                        $page_id[] = $child->page_id;
                    }
                    if (!is_null($child->category_id)) {
                        $categoryData[] = $child->category_type . '-' . $child->category_id;
                    }
                    foreach ($child->children as $child) {
                        if (!is_null($child->page_id)) {
                            $page_id[] = $child->page_id;
                        }
                        if (!is_null($child->category_id)) {
                            $categoryData[] = $child->category_type . '-' . $child->category_id;
                        }
                    }
                }
            }
        }
        $pages = Page::where('status', 1)->get();
        $categories = Category::where('status', 1)->get();
        return view('admin.menu_item.index', compact('menu', 'pages', 'categories', 'page_id', 'categoryData'));
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
    public function show(Request $request, string $id)
    {
        $menuItemOrder = json_decode($request->input('data'));
        $this->orderMenu($menuItemOrder, NULL);
        return response()->json(['status' => 'success']);
    }

    private function orderMenu(array $menuItems, $parentId)
    {
        foreach ($menuItems as $index => $menuItem) {
            $item = MenuItem::findOrFail($menuItem->id);
            $item->update([
                'order' => $index + 1,
                'parent_id' => $parentId
            ]);

            if (isset($menuItem->children)) {
                $this->orderMenu($menuItem->children, $item->id);
            }
        }
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        MenuItem::where('menu_id', $id)->delete();
        if ($request->page_id) {
            foreach ($request->page_id as $page_id) {
                $page = Page::findOrFail($page_id);
                $order = MenuItem::select('order')->max('order');
                if ($order) {
                    $order = $order + 1;
                } else {
                    $order = 1;
                }
                if ($page) {
                    MenuItem::create([
                        'name'      => $page->name,
                        'menu_id'   => $id,
                        'page_id'   => $page_id,
                        'order'     => $order,
                    ]);
                }
            }
        }
        if ($request->category_id) {
            foreach ($request->category_id as $key => $category_id) {
                $category_type = $request->category_type[$key];
                $order = MenuItem::select('order')->max('order');
                if ($order) {
                    $order = $order + 1;
                } else {
                    $order = 1;
                }
                $category = Category::findOrFail($category_id);

                if ($category) {
                    MenuItem::create([
                        'name'      => $category->name,
                        'menu_id'   => $id,
                        'category_id'   => $category_id,
                        'order'     => $order,
                    ]);
                }
            }
        }
        return redirect()->back()->withSuccessMessage('Updated Successfully!');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $item = MenuItem::findOrFail($id);
        $itemsId = [];
        $itemsId[] = (int)$id;
        foreach ($item->children as $child) {
            $itemsId[] = $child->id;
            foreach ($child->children as $child) {
                $itemsId[] = $child->id;
                foreach ($child->children as $child) {
                    $itemsId[] = $child->id;
                    foreach ($child->children as $child) {
                        $itemsId[] = $child->id;
                    }
                }
            }
        }
        MenuItem::whereIn('id', $itemsId)->delete();
        return response()->json(['status' => 'success']);
    }
}
