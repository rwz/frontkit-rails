CHARACTERS = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/='
REMOVE_CHARACTERS = /[^a-z\d\+\=\/]/ig
fromCharCode = String.fromCharCode

try
  document.createElement '$'
catch error
  INVALID_CHARACTER_ERR = error



encode64 = window.btoa || (input) ->
  output = ''
  i = 0

  while i < input.length

    chr1 = input.charCodeAt(i++) || 0
    chr2 = input.charCodeAt(i++) || 0
    chr3 = input.charCodeAt(i++) || 0

    if Math.max(chr1, chr2, chr3) > 0xFF
      throw INVALID_CHARACTER_ERR

    enc1 = chr1 >> 2
    enc2 = ((chr1 & 3) << 4) | (chr2 >> 4)
    enc3 = ((chr2 & 15) << 2) | (chr3 >> 6)
    enc4 = chr3 & 63

    if isNaN chr2
      enc3 = enc4 = 64
    else if isNaN chr3
      enc4 = 64

    for char in [ enc1, enc2, enc3, enc4 ]
      output += CHARACTERS.charAt(char)

  output

decode64 = window.atob || (input) ->
  output = ''
  i = 0
  length = input.length

  if length % 4 != 0
    throw INVALID_CHARACTER_ERR

  while i < length

    enc1 = CHARACTERS.indexOf input.charAt(i++)
    enc2 = CHARACTERS.indexOf input.charAt(i++)
    enc3 = CHARACTERS.indexOf input.charAt(i++)
    enc4 = CHARACTERS.indexOf input.charAt(i++)

    chr1 = (enc1 << 2) | (enc2 >> 4)
    chr2 = ((enc2 & 15) << 4) | (enc3 >> 2)
    chr3 = ((enc3 & 3) << 6) | enc4

    output += fromCharCode(chr1)

    if enc3 != 64
      output += fromCharCode(chr2)

    if enc4 != 64
      output += fromCharCode(chr3)

  output

this.Base64 =
  encode64: (str) -> encode64(unescape(encodeURIComponent(str)))
  decode64: (str) -> decodeURIComponent(escape(decode64(str.replace(REMOVE_CHARACTERS, ''))))