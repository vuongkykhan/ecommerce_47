$(document).on('click', '.btn_delete_product', function(event){
  var product_id = $(this).parent().find('span.product_id').html();
  this_event = $(this);
  swal({
      title: 'Are you sure you want to delete.',
      text: "Is it possible to reject orders in the waiting state of this product!",
      type: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Yes, delete it!'
    })
  .then(function(isConfirm){
    if (isConfirm) {
      $.ajax({
        type: 'delete',
        url: '/admin/products/' + product_id,
        data: false,
        dataType: "application/json",
        success: function(data){
          swal(
            'Deleted!',
            'Your file has been deleted.',
            'success'
          );
          $(".product_"+product_id).remove();
        },
        error: function(data){
          swal(
            "Oops....",
            data.message,
            "error"
          )
        }
      });
    }
  });
});
