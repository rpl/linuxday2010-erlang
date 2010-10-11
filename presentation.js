var converter = new Showdown.converter;

function get_presentation() {
  $.get("presentation.md", function(result) {
    var slides = result.split("#SLIDE");
    generate(slides);
    Slideshow_init();
  }, function (error) { alert("ERROR: "+error); });
}

function generate(slides) {
  for (var i in slides) {
    if(slides[i] != "") {
      var ret = converter.makeHtml(slides[i]);
      $(".slides").append($("<div class='slide'><section class='middle'>"+
                            ret+"</section></div>"));
    }
  }
}

    window.addEventListener("message", receiveMessage, false);  
      
    function receiveMessage(event)  
    {  
      /*if (event.origin !== "http://example.org:8080")  
        return;  */
      window.SLIDESHOW.go(event.data);
    }  

get_presentation();