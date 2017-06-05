// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require turbolinks
//= require jquery
//= require bootstrap-sprockets
//= require moment
//= require bootstrap-datetimepicker
//= require_tree .

// $(window).scroll(function() {

//     if ($(this).scrollTop()>0)
//      {
//         $('.menu').css('background', 'dodgerblue');
//      }
//     else
//      {
//       	$('.menu').css('background', 'none');
//      }
//  });

  $(window).scroll(function() {
    if($(this).scrollTop() > 100)  /*height in pixels when the navbar becomes non opaque*/ 
    {
        $('.menu').addClass('colored');
    } else {
        $('.menu').removeClass('colored');
    }
});

$(document).ready(function(){
    $('.pmd-dropdown-hover').dropdownHover().dropdown();

    $('.pmd-tabs').pmdTab();
    
    $(function() {              
        $('#datetimepicker1').datetimepicker({
        	format: 'DD/MM/YYYY'
        });
    });
    $(function() {              
        $('#datetimepicker').datetimepicker({
        	format: 'DD/MM/YYYY'
        });
    }); 
        // start date picke on chagne event [select minimun date for end date datepicker]
    $("#datetimepicker1").on("dp.change", function (e) {
        $('#datetimepicker').data("DateTimePicker").minDate(e.date);
    });
    // Propeller Select2
    // Simple Selectbox
    $(".select-simple").select2({
        theme: "bootstrap",
        minimumResultsForSearch: Infinity,
    });
    // multiple range slider with lower tooltip at bottom
    var pmdSliderRangeTooltip = document.getElementById('pmd-slider-range-tooltip-bottom-lower');

    noUiSlider.create(pmdSliderRangeTooltip, {
        start: [0, 1000],
        connect: true,
        tooltips: [ wNumb({ decimals: 0 }), wNumb({ decimals: 0 }) ],
        range: {
            'min': 0,
            'max': 1000
        }
    });
});

// Show/hide specified div
function clickShow(w) {
    var x = document.getElementById(w);
    if (x.style.display === '') {
        x.style.display = 'block';
    } else {
        x.style.display = '';
    }
}


        