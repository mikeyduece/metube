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
//= require jquery_ujs
//= require rails-ujs
//= require turbolinks
//= require jquery
//= require bootstrap-sprockets
//= require_tree .
// import { apiKey } from './helper.js'
// $(function($) {
//   $(document).on('click', '#favorite', function(event) {
//     $(this).find('i').css('color','red').toggleClass('glyphicon-heart-empty');
//     //   });
// });
bootcards.init({
  offCanvasBackdrop: true,
  offCanvasHideOnMainClick: true,
  enableTabletPortraitMode: true,
  disableRubberBanding: true
});

// (function($) {
//
//     $.fn.bmdIframe = function( options ) {
//         var self = this;
//         var settings = $.extend({
//             classBtn: '.bmd-modalButton',
//             defaultW: 640,
//             defaultH: 360
//         }, options );
//
//         $(settings.classBtn).on('click', function(e) {
//           var allowFullscreen = $(this).attr('data-bmdVideoFullscreen') || false;
//
//           var dataVideo = {
//             'src': $(this).attr('data-bmdSrc'),
//             'height': $(this).attr('data-bmdHeight') || settings.defaultH,
//             'width': $(this).attr('data-bmdWidth') || settings.defaultW
//           };
//
//           if ( allowFullscreen ) dataVideo.allowfullscreen = "";
//
//           // stampiamo i nostri dati nell'iframe
//           $(self).find("iframe").attr(dataVideo);
//         });
//
//         // se si chiude la modale resettiamo i dati dell'iframe per impedire ad un video di continuare a riprodursi anche quando la modale è chiusa
//         this.on('hidden.bs.modal', function(e){
//           $(this).find('iframe').html("").attr("src", "");
//         });
//
//         return this;
//     };
//
// })($);


$(document).ready(function(){
  $("#myModal").bmdIframe();
});

var tag = document.createElement('script')
tag.src = "https://www.youtube.com/iframe_api";
var firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

var player;

function onYouTubeIFrameReady() {
  player = new YT.Player('player', {
    events: {
          'onReady': onPlayerReady,
          'onStateChange': onPlayerStateChange
        }
  });
}

function onPlayerReady(event) {
  event.target.playVideo();
  //bind events
  var playbutton = document.getElementById('play-button');
  playButton.addEventListent('click', function() {
    play.playVideo();
  });

  var pauseButton = document.getElementById('pause-button');
  pauseBtton.addEventListener('click', function() {
    player.pauseVideo();
  });
};

function onPlayerStateChange(event)

