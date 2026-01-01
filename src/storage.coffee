fs = require 'fs'

# Main in-memory key-value store
store = {}
# Hash to store expiration time (in epoch seconds) per key
ttls = {}

# File path for persistent storage
filepath = 'kvstore_data.json'

# Save the full store and TTLs to disk as JSON
save = ->
  fd = fs.openSync filepath, 'w'
  fs.writeSync fd, JSON.stringify({data: store, ttls: ttls}), 0, 'utf8'
  fs.closeSync fd

# Load the store and TTLs from the JSON file on startup
load = ->
  try
    obj = JSON.parse fs.readFileSync(filepath, 'utf8')
    store = obj.data or {}
    ttls = obj.ttls or {}
  catch e
    store = {}
    ttls = {}

# Remove expired keys from the store and TTLs hash
purgeExpired = ->
  now = Date.now() / 1000
  toDelete = []
  for own k, exp of ttls
    if exp <= now
      toDelete.push k
  for k in toDelete
    delete store[k]
    delete ttls[k]
  if toDelete.length > 0 then save()

# Set a key with optional TTL (in seconds)
exports.set = (key, val, ttl) ->
  purgeExpired()
  store[key] = val
  if ttl  # if ttl provided, set expiration (now + ttl)
    ttls[key] = (Date.now() / 1000) + parseInt(ttl)
  else
    delete ttls[key]
  save()

# Get a key, handle expiration if needed
exports.get = (key) ->
  purgeExpired()
  if ttls[key]? and ttls[key] <= Date.now() / 1000
    delete store[key]
    delete ttls[key]
    save()
    return null
  store[key] or null

# Delete a key and its TTL, return true if deleted
exports.del = (key) ->
  purgeExpired()
  deleted = false
  if store[key]?
    delete store[key]
    deleted = true
  if ttls[key]?
    delete ttls[key]
    deleted = true
  if deleted then save()
  deleted

# Return a shallow copy of the store (all key-value pairs)
exports.all = ->
  purgeExpired()
  Object.assign {}, store

# Clear the store & TTLs and persist to disk
exports.clear = ->
  store = {}
  ttls = {}
  save()

# Return stats: key count, list of keys, uptime, data file path
exports.stats = ->
  purgeExpired()
  {
    count: Object.keys(store).length,
    keys: Object.keys(store),
    uptime: Math.round((Date.now() - process.uptime()*1000) / 1000),
    file: filepath
  }

# Load store and TTLs from disk when module is first required
load()
