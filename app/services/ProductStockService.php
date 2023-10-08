<?php

namespace App\Services;

use App\helperClass;
use App\Models\Product;
use App\Models\ProductStock;
use App\Utility\ProductUtility;

class ProductStockService
{
    public function store(array $data, $product)
    {
        $collection = collect($data);

        $options = ProductUtility::get_attribute_options($collection);

        //Generates the combinations of customer choice options
        $combinations = $this->makeCombinations($options);

        if (count($combinations[0]) > 0) {
            Product::findOrFail($product->id)->update(['variant_product' => 1]);
            foreach ($combinations as $key => $combination) {
                $str = ProductUtility::get_combination_string($combination);

                // Product Variant Image
                $variant_image = request()['img_' . str_replace('.', '_', $str)];
                if (isset($variant_image)) {
                    $response = helperClass::storeImage($variant_image, 800, 'media/product/');
                    if ($response['status'] == 'success') {
                        $variant_image_path_name =  $response['path_name'];
                    } else {
                        $variant_image_path_name = NULL;
                    }
                } else {
                    $variant_image_path_name = NULL;
                }

                ProductStock::create([
                    'product_id' => $product->id,
                    'variant' => $str,
                    'price' => request()['price_' . str_replace('.', '_', $str)],
                    'sku' => request()['sku_' . str_replace('.', '_', $str)],
                    'qty' => request()['qty_' . str_replace('.', '_', $str)],
                    'image' => $variant_image_path_name,
                ]);
            }
        } else {
            $qty = $collection['current_stock'];
            $price = $collection['sale_price'];
            $sku = $collection['sku'];
            ProductStock::create([
                'product_id' => $product->id,
                'sku' => $sku,
                'price' => $price,
                'qty' => $qty,
            ]);
        }
    }

    public static function makeCombinations($arrays)
    {
        $result = array(array());
        foreach ($arrays as $property => $property_values) {
            $tmp = array();
            foreach ($result as $result_item) {
                foreach ($property_values as $property_value) {
                    $tmp[] = array_merge($result_item, array($property => $property_value));
                }
            }
            $result = $tmp;
        }
        return $result;
    }
}
