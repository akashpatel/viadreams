$(function() {
  var author = $('#author_name').val()
  $.ajax({
      type: 'GET',
      url: 'https://ajax.googleapis.com/ajax/services/search/images?v=1.0',
      data: { q: author,
              imgsz: 'huge'
            },
      dataType: 'jsonp'
  })
  .done(function( data ) {
      var results = data.responseData.results
      if (results.length != 0) {
        var img_src = results[Math.floor(Math.random() * results.length)].url;
        $('.background_cover').css('-webkit-background-size', 'cover');
        $('.background_cover').css('background', 'url(' + img_src + ') no-repeat center center');
        $('.background_cover').hide();
        $('.background_cover').fadeIn(1500)
      }

  });
});
