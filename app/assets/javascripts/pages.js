$(document).ready(function(){
  $('#tweet-form').on('submit', function(e){
    e.preventDefault();
    request = $.ajax({
      url: $(this).attr("action"),
      data: {tweet: $('input[name="tweet"]').val()},
    });

    request.done(function(response){
      $('#tweet-form')[0].reset();
    });

  })
});