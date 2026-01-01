http = require 'http'
url  = require 'url'
Storage = require './storage'
Utils = require './utils'

handleRequest = (req, res) ->
  q = url.parse req.url, true
  key = q.query.key
  val = q.query.val
  ttl = q.query.ttl or null
  cmd = q.pathname[1..].toUpperCase()

  # All responses are sent in JSON for consistency
  res.writeHead 200, {'Content-Type': 'application/json; charset=utf-8'}

  # Route: /set?key=foo&val=bar[&ttl=30]
  if cmd == 'SET' and Utils.isValidKey(key) and Utils.isValidVal(val)
    Storage.set(key, val, ttl)
    res.end JSON.stringify(ok: true)

  # Route: /get?key=foo
  else if cmd == 'GET' and Utils.isValidKey(key)
    result = Storage.get(key)
    res.end JSON.stringify(val: result)

  # Route: /del?key=foo
  else if cmd == 'DEL' and Utils.isValidKey(key)
    status = Storage.del(key)
    res.end JSON.stringify(deleted: status)

  # Route: /all (returns whole store)
  else if cmd == 'ALL'
    res.end JSON.stringify(Storage.all())

  # Route: /clear (empties the store)
  else if cmd == 'CLEAR'
    Storage.clear()
    res.end JSON.stringify(ok: true, msg: "Store cleared")

  # Route: /stats (metadata/stats)
  else if cmd == 'STATS'
    res.end JSON.stringify(Storage.stats())

  # Route: /latte (hipster-only Easter egg)
  else if cmd == 'LATTE'
    recipe =
      beverage: "Caffè Latte"
      ingredients: ["espresso", "steamed milk", "a touch of foam"]
      size: "Grande"
      caffeine: "enough to fuel your hackathon"
      vibes: "hipster-certified"
    res.end JSON.stringify(recipe)

  # Any other route: show usage error
  else
    res.end JSON.stringify(
      error: "Usage: /set?key=foo&val=bar[&ttl=30] | /get?key=foo | /del?key=foo | /all | /clear | /stats | /latte"
    )

server = http.createServer handleRequest

port = 3000
server.listen port, ->
  console.log "kvstore CoffeeScript running on http://127.0.0.1:#{port}/"
  console.log "Try:"
  console.log "  curl 'http://127.0.0.1:3000/set?key=mykey&val=myval&ttl=10'"
  console.log "  curl 'http://127.0.0.1:3000/get?key=mykey'"
  console.log "  curl 'http://127.0.0.1:3000/all'"
  console.log "  curl 'http://127.0.0.1:3000/clear'"
  console.log "  curl 'http://127.0.0.1:3000/del?key=mykey'"
  console.log "  curl 'http://127.0.0.1:3000/stats'"
  console.log "  curl 'http://127.0.0.1:3000/latte'    # Get your barista JSON (Easter egg!)"
