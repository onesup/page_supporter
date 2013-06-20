$(document).ready(function() {
    var clip = new ZeroClipboard($(".copy-button"), {
      moviePath: "ZeroClipboard.swf"
    });
		clip.on("mouseup", function(){
			var link = this.getAttribute("link")
			// $(location).attr('href',link);
			window.open(link);
		});
    clip.on('load', function (client) {
      debugstr("Flash movie loaded and ready.");
    });

    clip.on('noFlash', function (client) {
      $(".demo-area").hide();
      debugstr("Your browser has no Flash.");
    });

    clip.on('wrongFlash', function (client, args) {
      $(".demo-area").hide();
      debugstr("Flash 10.0.0+ is required but you are running Flash " + args.flashVersion.replace(/,/g, "."));
    });

    clip.on('complete', function (client, args) {
      debugstr("Copied text to clipboard: " + args.text);
    });

    // jquery stuff (optional)
    function debugstr(text) {
      $("#d_debug").append($("<p>").text(text));
    }

    $("#clear-test").on("click", function(){
      $("#fe_text").val("Copy me!");
      $("#testarea").val("");
    });
  });
