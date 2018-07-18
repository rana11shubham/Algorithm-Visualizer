particlesJS("particles-js", {
  "particles": {
    "number": {
      "value": 200,/*80*/
      "density": {
        "enable": true,
        "value_area": 800
      }
    },
    "color": {
      "value": "#ffffff"
    },
    "shape": {
      "type": "circle",
      "stroke": {
        "width": 0,
        "color": "#000000"
      },
      "polygon": {
        "nb_sides": 5
      }
    },
    "opacity": {
      "value": 0.5,
      "random": false,
      "anim": {
        "enable": false,
        "speed": 1,
        "opacity_min": 0.1,
        "sync": false
      }
    },
    "size": {
      "value": 3,
      "random": true,
      "anim": {
        "enable": false,
        "speed": 40,
        "size_min": 0.1,
        "sync": false
      }
    },
    "line_linked": {
      "enable": true,
      "distance": 150,
      "color": "#ffffff",
      "opacity": 0.4,
      "width": 1
    },
    "move": {
      "enable": true,
      "speed": 6,
      "direction": "none",
      "random": true,
      "straight": false,
      "out_mode": "out",
      "bounce": false,
      "attract": {
        "enable": false,
        "rotateX": 600,
        "rotateY": 1200
      }
    }
  },
  "interactivity": {
    "detect_on": "canvas",
    "events": {
      "onhover": {
        "enable": true,
        "mode": "grab"
      },
      "onclick": {
        "enable": true,
        "mode": "push"
      },
      "resize": true
    },
    "modes": {
      "grab": {
        "distance": 140,
        "line_linked": {
          "opacity": 1
        }
      },
      "bubble": {
        "distance": 400,
        "size": 40,
        "duration": 2,
        "opacity": 8,
        "speed": 3
      },
      "repulse": {
        "distance": 200,
        "duration": 0.4
      },
      "push": {
        "particles_nb": 4
      },
      "remove": {
        "particles_nb": 2
      }
    }
  },
  "retina_detect": true
});

$(document).ready(function() {
  var options = {
    initColor: '#0491A4',
    maxColors: 10,
    colors: [],
    interval: 5000
  };
  for (var i = 0; i <= options.maxColors; i++) {
    ChangeItNow();
  }

  function RandomColor() {
    var letters = '0123456789ABCDEF';
    var color = '#';
    for (var i = 0; i < 6; i++) {
      color += letters[1];
    }
    return color;
  }

  function setBackgroundColor(color) {
    $('#particles-js').css('background-color', color);
  }

  setInterval(ChangeItNow, options.interval);

  function ChangeItNow() {
    var newColor = RandomColor();
    setBackgroundColor(newColor);
    options.colors.push(newColor);
    if (options.colors.length > options.maxColors) {
      options.colors = [];
      $("#colors li").remove();
    }
    $("#colors").append('<li style="background-color: ' + newColor + '" class="color" title=""> </li>');
    $("#colors li").on('click', function(e) {
      setBackgroundColor($(this).css('background-color'));
    });
  }

});