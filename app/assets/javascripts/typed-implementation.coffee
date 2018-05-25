ready = ->
  new Typed '#typed-container',
    strings: [
      'Cover is a one-page template for building simple and beautiful home pages.',
      'Download, edit the text, and add your own fullscreen background photo to make it your own.'
    ]
    typeSpeed: 30
  return

$(document).ready ready
$(document).on 'turbolinks:load', ready
