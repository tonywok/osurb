// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


jQuery.ajaxSetup({
  beforeSend: function(xhr){ xhr.setRequestHeader('Accept', 'text/javascript') }
});

jQuery.fn.submitWithAjax = function() {
  this.submit(function(event) {
    $.post($(this).attr("action"), $(this).serialize(), null, "script");
    event.preventDefault();
  })
};

jQuery(function($) {
  $('#new_comment').submitWithAjax();


  $('#user_email').change(function() {
    var user_email = $(this).val();
    if(user_email.length > 3) {
      $.getJSON('/check_avaliability.json', { user_email: user_email, format: 'json'}, 
        function(response) {
					alert(response.result);
          if (response.result == false) {
            alert('Sorry, someone has that username');
          } else {
            alert('Valid username'); 
          }
       });
     }
     });
    
});
