// Consider all the following javascript code as public domain, do whatever you like with it.
// taken from sparkleshare.org
(function($) {
  var cache = [];
  $.preLoadImages = function() {
    var args_len = arguments.length;
      for (var i = args_len; i--;) {
        var cacheImage = document.createElement('img');
        cacheImage.src = arguments[i];
        cache.push(cacheImage);
      }
  }
  Slider = {
    images: [],
    texts: [],
    slide: 0,

    initialize: function(images, texts) {
      this.images = images;
      this.texts = texts;

      for (var i = 0; i < images.length; i++ ){
        jQuery.preLoadImages(images[i]);
      }
      this.updateSlide();
      this.updateControls();

      klazz = this;
      $(".navigation-forward").click(function () {
        klazz.slide++;
        klazz.updateControls();

        $('#graphic').animate({
          opacity: 0.1, left: '63px'
        }, 400, function() {
          // Animation complete.
        });

        $('#text').animate({
          opacity: 0, left: '-30px'
        }, 400, function() {
        klazz.updateControls();
          klazz.updateSlide(); 
          klazz.slideForward ();
        });
      });

      $(".navigation-back").click(function () {
        klazz.slide--;
        klazz.updateControls();

        $('#graphic').animate({
          opacity: 0.1, left: '173px'
        }, 400, function() {
          // Animation complete.
        });

        $('#text').animate({
          opacity: 0, left: '30px'
        }, 400, function() {
          klazz.updateSlide();
          klazz.slideBack ();
        });
      });
    },

    updateControls: function() {
      $(".navigation-back").show();
      $(".navigation-forward").show();
      if (this.slide == 0) {
        $(".navigation-back").hide();
      } else if (this.slide == this.texts.length - 1) {
        $(".navigation-forward").hide();          
      } else {

      }
    },

    updateSlide: function () {
      if(this.slide > this.texts.length)
        this.slide = this.texts.length;

      if(this.slide < 0)
        this.slide = 0;

      $("#text").html(this.texts[this.slide]);
      $("#graphic").html("<img src='"+this.images[this.slide]+"' />");
    },

    slideForward: function() {
      $('#graphic').css({
        opacity: 0, left: '173px'
      });

      $('#text').css({
        opacity: 0, left: '50px'
      });

      $('#graphic').animate({
        opacity: 1, left: '123px'
      }, 600, function() {
        // Animation complete.
      });        $('#text').animate({
        opacity: 1, left: '0px'
      }, 600, function() {
        // Animation complete.
      });
    },

    slideBack: function() {
      $('#graphic').css({
        opacity: 0, left: '63px'
      });

      $('#text').css({
        opacity: 0, left: '-30px'
      });

      $('#graphic').animate({
        opacity: 1, left: '123px'
      }, 400, function() {
        // Animation complete.
      });        $('#text').animate({
        opacity: 1, left: '0px'
      }, 400, function() {
        // Animation complete.
      });
    }
  };
  
})(jQuery)