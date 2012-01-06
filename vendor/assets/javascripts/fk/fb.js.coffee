initialized = false

FK.FB =
  init: (opts) ->
    # todo

  ready: (callback) ->
    if initialized
      callback.call null
    else
      $(window).bind('fb_init', callback)


$(window).bind 'fb_init', -> initialized = true