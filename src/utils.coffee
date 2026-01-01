exports.isValidKey = (key) ->
  (typeof key is 'string') and key.length > 0 and /^[a-zA-Z0-9_\-]+$/.test key

exports.isValidVal = (val) ->
  (typeof val is 'string') and val.length > 0
