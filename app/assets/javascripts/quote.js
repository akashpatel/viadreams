var refreshBackgroundImage = function(author) {
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
        $('.background_cover').fadeIn("slow")
      }
  });
};

var cycleRandomQuote = function() {
  $.ajax({
    type: 'GET',
    url: '/quotes/random.json',
  })
  .done(function( data ) {
    $('.background_cover').hide("slow").fadeOut("slow")
    refreshBackgroundImage(data.author);
    $(".transparent_box").fadeOut("slow")


    // Update quote text with the new quote.
    $("#quote_title").text("quote #" + data.id)
    $("#quote_desc").text(data.description)
    $("#quote_author").text(data.author)
    $("#quote_likes").text(data.likes)

    $(".transparent_box").fadeIn("slow")
  });
}

$(function() {
  var author = $('#author_name').val()
  refreshBackgroundImage(author)

  setInterval(cycleRandomQuote, 10000);
});
