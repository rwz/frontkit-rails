strFromCharCode = String.fromCharCode

this.Unicode =
  unpack: (utfstring) ->
    utfstring = utfstring.replace /\r\n/g, "\n"
    string = ''

    for i in [0 ... utfstring.length]
      c = utfstring.charCodeAt(i)

      if c < 128
        string += strFromCharCode(c)
      else if (c > 127) && (c < 2048)
        string += strFromCharCode((c >> 6) | 192)
        string += strFromCharCode((c & 63) | 128)
      else
        string += strFromCharCode((c >> 12) | 224)
        string += strFromCharCode(((c >> 6) & 63) | 128)
        string += strFromCharCode((c & 63) | 128)

    string

  pack: (string) ->
    utfstring = ''
    i = c = c1 = c2 = 0

    while i < string.length

      c = string.charCodeAt(i)

      if c < 128
        utfstring += strFromCharCode(c)
        i++
      else if (c > 191) && (c < 224)
        c2 = string.charCodeAt(i+1)
        utfstring += strFromCharCode(((c & 31) << 6) | (c2 & 63))
        i += 2
      else
        c2 = string.charCodeAt(i+1)
        c3 = string.charCodeAt(i+2)
        utfstring += strFromCharCode(((c & 15) << 12) | ((c2 & 63) << 6) | (c3 & 63))
        i += 3

    utfstring