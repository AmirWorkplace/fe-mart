<script>
  $(document).ready(function(){
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
              price: Number(inputEl.val()) * price,
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
              price: Number(inputEl.val()) * price,
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
          $("#all_total_price").html(subTotalPrices);
          $("#total_cart_price").html(subTotalPrices);
          $(".total_cart_price").val(subTotalPrices);
      }

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