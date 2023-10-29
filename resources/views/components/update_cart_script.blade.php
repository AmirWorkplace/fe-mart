<script>
  $(document).ready(function(){
        $("#order_address_selection #order_type").change(function(){
            switch ($(this).val()) {
                case 'self':
                    $('#shipping_address_box').addClass('d-none');
                    $('#customer_selection_box').addClass('d-none');

                    calculatePrice('self');
                    break;
                    
                case 'new-business':
                    $('#shipping_address_box').removeClass('d-none');
                    $('#customer_selection_box').addClass('d-none');

                    calculatePrice('new-business');
                    break;
                    
                case 'business':
                    $('#shipping_address_box').addClass('d-none');
                    $('#customer_selection_box').removeClass('d-none');

                    calculatePrice('business');
                    break; 

                default:
                    $('#shipping_address_box').addClass('d-none');
                    $('#customer_selection_box').addClass('d-none');

                    calculatePrice('self');
                    break;
            }
        });

        function calculatePrice(type){
            $('.checkout-cart-product .cart-price-box input').each(function(index){
                const _this = $($('.checkout-cart-product .cart-price-box input')[index]);

                const qty = +$(_this.attr('set-total-quantities')).val()
                const reseller_price = +_this.attr('reseller-price');
                const regular_price = +_this.attr('regular-price');

                if(type === 'self'){
                    _this.val(reseller_price)
                    _this.attr("disabled", true);
                    $(_this.attr("set-total-price")).html(reseller_price * qty)
                }else if(type === 'new-business'){
                    _this.val(regular_price)
                    _this.removeAttr("disabled");
                    $(_this.attr("set-total-price")).html(regular_price * qty)
                }else if(type === 'business'){
                    _this.val(regular_price)
                    _this.removeAttr("disabled");
                    $(_this.attr("set-total-price")).html(regular_price * qty)
                }else{ 
                    $(_this.attr("set-total-price")).html(+_this.val() * qty)
                    _this.attr("disabled", true);
                    console.log((+_this.val()) * qty, $(_this.attr("set-total-price")));
                } 
            });

            calculate();
        }

        $('.checkout-cart-product .cart-price-box input').on("change", function(){
            const id = $(this).attr("data-id");
            console.log($(this).val());

            updateCart({
                id,
                price: parseInt($(this).val()),
                qty: parseInt($($(this).attr('set-total-quantities')).val())
            });

            $($(this).attr("set-total-price")).html((+$(this).val()) * (+$($(this).attr('set-total-quantities')).val()));
            calculate();
        });

        $("[product-quantities]").on('click', ".qty-plus", function(){
            const inputEl = $($(this).attr("qty-input"));
            const totalPriceId = $($(this).attr("total-price-id"));
            const price = Number($(this).attr("price"));
            const id = $(this).attr("data-id");

            inputEl.val(Number(inputEl.val()) + 1);

            totalPriceId.html(Number(inputEl.val()) * price)

            calculate();
            updateCart({
                id,
                qty: Number(inputEl.val()),
                price: null
                //   price: $('.cart-price-box input').val(),
            });
        });

        $("[product-quantities]").on('click', ".qty-minus", function(){
            const inputEl = $($(this).attr("qty-input"));
            const totalPriceId = $($(this).attr("total-price-id"));
            const price = Number($(this).attr("price"));
            const id = $(this).attr("data-id");

            inputEl.val() > 1 && inputEl.val(Number(inputEl.val()) - 1);
            totalPriceId.html(Number(inputEl.val()) * price);

            calculate();
            updateCart({
                id,
                qty: Number(inputEl.val()),
                price: null
                //   price: $('.cart-price-box input').val(),
            });
        });

        $(".checkout-delete-btn").click(function(){
            const removeEl = $(this).attr("remove-cart-item");
            $(removeEl).remove();

            calculate();
        });

      function calculate(){
          let subTotalPrices = 0, totalQty = 0;
          $(".total_prices").each(function(index){
              subTotalPrices += Number($($(".total_prices")[index]).html());
          })

          $(".quantity_wanted").each(function(index){
              totalQty += Number($($(".quantity_wanted")[index]).val());
          })

          $("#total_qty").html(totalQty);
          $("#all_total_price").html(subTotalPrices + parseInt($('#delivery_charge').val()));
          $("#total_cart_price").html(subTotalPrices);
          $(".total_cart_price").val(subTotalPrices + parseInt($('#delivery_charge').val()));
      }

        $('#inside_dhaka_charge').on("change click",function(){
            $('#inside_dhaka_charge').prop('checked', true);
            $('#outside_dhaka_charge').prop('checked', false);
            $('#deliver_charge_free').prop('checked', false);

            $('#delivery_charge, #hidden_delivery_charge').val('{{ $setting->inside_dhaka_charge }}')
            $('#cart-subtotal-shipping .value').html('{{ $setting->inside_dhaka_charge }}')
            calculate();
            $('.in-dhaka').addClass('d-none');
        }); 

        function initiateDeliveryCharge(){
            $('#inside_dhaka_charge').prop('checked', true);
            $('#outside_dhaka_charge').prop('checked', false);
            $('#deliver_charge_free').prop('checked', false);

            $('#delivery_charge').val('{{ $setting->inside_dhaka_charge }}');
            $('#cart-subtotal-shipping .value').html('{{ $setting->inside_dhaka_charge }}');
            calculate();
        }

        initiateDeliveryCharge();

        $('#outside_dhaka_charge').on("change click",function(){
            $('#outside_dhaka_charge').prop('checked', true);
            $('#inside_dhaka_charge').prop('checked', false);
            $('#deliver_charge_free').prop('checked', false);

            $('#delivery_charge, #hidden_delivery_charge').val('{{ $setting->outside_dhaka_charge }}');
            $('#cart-subtotal-shipping .value').html('{{ $setting->outside_dhaka_charge }}');
            calculate();
            $('.in-dhaka').addClass('d-none');
        });

        $('#deliver_charge_free').change(function(){
            $('#deliver_charge_free').prop('checked', true);

            $('#delivery_charge').val(0);
            $('#cart-subtotal-shipping .value').html(0);
            calculate();
        });

        

        function updateCart({id, qty, price}) {
            $.ajax({
                url: "{{ route('frontend.cart.update') }}",
                _method: 'PATCH',
                method: 'PATCH',
                data: {id, qty, price},

                success: function(response){
                    if(response.status){
                        Swal.fire({
                            width: "22rem",
                            icon: 'success',
                            text: response.message,                                
                            toast: true,
                            position: 'top-end',
                            showConfirmButton: false,
                            timer: 1500

                        }); 
                    }else{
                        Swal.fire({
                            width: "22rem",
                            icon: 'error',
                            text: response.message,                                
                            toast: true,
                            position: 'top-end',
                            showConfirmButton: false,
                            timer: 1500

                        });
                    }
                }
            })
        }
  });
</script>