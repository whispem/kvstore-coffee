store = {}

exports.set = (key, val) ->
  store[key] = val

exports.get = (key) ->
  store[key] or null

exports.all = ->
  store

exports.clear = ->
  for own k of store
    delete store[k]
