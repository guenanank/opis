(function($) {

  var price = $('input[name="price"]');
  var downPayment = $('input[name="down_payment"]');

  $('select[name="leases"]').on('changed.bs.select', function() {

    if (price.val().length < 1 || downPayment.val().length < 1) {
      swal({
        title: '',
        text: 'Bidang harga atau uang muka harus di isi.',
        type: 'warning',
        showConfirmButton: false,
        timer: 5000
      });
    } else {
      $('div#leases').html('');
      var id = $(this).val();
      $.ajax({
        type: 'POST',
        url: $('base').attr('href') + 'credit/calculate',
        data: {
          lease_id: id,
          price: price.val().replace(/,/g, ''),
          downPayment: downPayment.val().replace(/,/g, '')
        },
        success: function(credits) {
          $('div#leases').html('<h5 class="card-title">Angsuran</h5>');
          var lists = '<ul class="list-group">';
          $.each(credits, function(k, item) {
            lists += '<li class="list-group-item">' + item.tenor + ' x Rp. ' + numberFormat(item.installment) + ' (Flat ' + item.flat + '%)</li>'
          });

          lists += '</ul>';
          $('div#leases').append(lists).fadeIn('slow');
        }
      });
    }

  });

  var numberFormat = function(nStr) {
    nStr += '';
    x = nStr.split('.');
    x1 = x[0];
    x2 = x.length > 1 ? '.' + x[1] : '';
    var rgx = /(\d+)(\d{3})/;
    while (rgx.test(x1)) {
      x1 = x1.replace(rgx, '$1' + ',' + '$2');
    }
    return x1 + x2;
  }

  $('.krajee').fileinput({
    theme: 'fa',
    uploadUrl: '',
    maxFileCount: 5,
    allowedFileExtensions: ['jpg', 'jpeg', 'png', 'gif'],
    dropZoneEnabled: false,
    showRemove: false,
    showUpload: false,
    previewFileType: 'image',
    browseLabel: 'Upload Foto'
  });
})(jQuery);
