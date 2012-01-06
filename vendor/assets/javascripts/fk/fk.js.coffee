this.FK = FK = FrontKit =

  updaters: []

  decode: (str) ->
    JSON.parse(Base64.decode64(str))

  meta: (id) ->
    @Driver.meta(id)

  log: (args...) ->
    args.unshift('FK:')
    console.log(args...)

  ready: (callback) ->
    @Driver.onready(callback)

  push: (callback) ->
    @updaters.push(callback)

  update: (element=document) ->
    @log "Running application update on: ", element
    for updater in @updaters
      updater.call null, @Driver.prepare(element)

  init: ->
    if content = @meta('fk:state')
      gotState = true
      content = @decode(content)
    else
      development = !!window.location.port ||
        /\.(?:dev|local)$/.test window.location.hostname ||
        'localhost' == window.location.hostname
      content = { production: !development }

    @state = new State(content)

    console.disable() if !!@state.production

    if gotState
      @log 'Got application state: ', @state
    else
      @log 'No application state detected'

    this.ready -> FK.update()

class State
  constructor: (state) ->
    FK.Driver.extend this, state

  get: (path) ->
    for chunk in path.split('.')
      value = (value or this)[chunk]
      return null unless value?

    value