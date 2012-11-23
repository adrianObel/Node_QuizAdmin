require({
  paths: {
    jquery: 'libs/jquery-min'
}})

require([
  'jquery'
], function($) {

  var $form = $('#login-form')
  $form.submit(function(e) {
    e.preventDefault()
    var $inputs        = $form.find('input, select, button, textarea')
      , $errLabel      = $('.errMsg')
      , serializedData = $form.serialize()

    $inputs.attr('disabled', 'disabled')
    $errLabel.hide()

    $.ajax({
      url:'user/connect'
    , type:'POST'
    , data: serializedData
    , success: function(res, status, XHR) {
      if(res === 'false') {
       $errLabel.show()
       $errLabel.text('Usuario o contrasena incorrecto')
      }
      else {
        $('.contenedor').fadeOut('slow',function() {
          window.location = '/#/'
        })        
      }
    }
    , error: function(XHR, status, err) {
      $errLabel.show()
      $errLabel.text('Error, porfavor mandar denuevo')
    }
    , complete: function() {
       $inputs.removeAttr('disabled')
      }
    })  
  })

})
