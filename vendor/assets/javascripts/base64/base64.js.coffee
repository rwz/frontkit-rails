REMOVE_CHARS = /[^a-z\d\+\=\/]/ig

this.Base64 =
  encode64: (str) -> window.atob(Unicode.unpack(str))
  decode64: (str) -> Unicode.pack(window.btoa(str.replace(REMOVE_CHARS, '')))