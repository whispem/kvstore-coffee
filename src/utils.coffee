# Validate keys: must be string, non-empty, only alphanum/underscore/hyphen allowed
exports.isValidKey = (key) ->
  (typeof key is 'string') and key.length > 0 and /^[a-zA-Z0-9_\-]+$/.test key

# Validate values: must be string and non-empty
exports.isValidVal = (val) ->
  (typeof val is 'string') and val.length > 0
