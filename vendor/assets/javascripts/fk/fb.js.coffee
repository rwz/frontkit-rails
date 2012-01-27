initialized = false
$window = $(window)

FK.FB =
  init: (opts) ->
    $('body').append """<div id="fb-root">"""
    
    window.fbAsyncInit = ->
      FB.init(opts)
      $window.trigger('fb_init')
      
    $.getScript '//connect.facebook.net/en_US/all.js'

  ready: (callback) ->
    if initialized
      callback.call null
    else
      $window.bind('fb_init', callback)

$window.bind 'fb_init', -> initialized = true

FK.fb = (callback) -> FK.ready -> FK.FB.ready(callback)