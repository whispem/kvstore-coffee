fs = require 'fs'
data = JSON.parse(fs.readFileSync('kvstore_data.json', 'utf8'))
store = data.data or {}
ttls = data.ttls or {}

console.log "All keys and TTLs:"
for key of store
  ttl = if ttls[key]? then "#{Math.max(Math.floor(ttls[key] - Date.now() / 1000), 0)}s left" else "(no TTL)"
  console.log "#{key}: #{store[key]} [#{ttl}]"
