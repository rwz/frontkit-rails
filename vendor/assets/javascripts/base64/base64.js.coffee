REMOVE_CHARS = /[^a-z\d\+\=\/]/ig

this.Base64 =
  encode64: (str) -> window.btoa(Unicode.unpack(str))
  decode64: (str) -> Unicode.pack(window.atob(str.replace(REMOVE_CHARS, '')))