$ = jQuery

driver =
  meta: (str) -> $("""meta[property="#{str}"]""").attr('content')
  extend: (args...) -> $.extend(args...)
  fire: (object, eventName, args...) -> $(object).trigger(eventName, args...)
  onready: $

FK.Driver = driver