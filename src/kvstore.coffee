http = require 'http'
url  = require 'url'
Storage = require './storage'
Utils = require './utils'

handleRequest = (req, res) ->
  q = url.parse req.url, true
  key = q.query.key
  val = q.query.val
  cmd = q.pathname[1..].toUpperCase()

  res.writeHead 200, {'Content-Type': 'text/plain'}

  if cmd == 'SET' and Utils.isValidKey(key) and Utils.isValidVal(val)
    Storage.set key, val
    res.end "OK"
  else if cmd == 'GET' and Utils.isValidKey(key)
    result = Storage.get(key) or ""
    res.end result
  else if cmd == 'ALL'
    res.end JSON.stringify(Storage.all())
  else if cmd == 'CLEAR'
    Storage.clear()
    res.end "Store cleared"
  else
    res.end "Usage: /set?key=foo&val=bar | /get?key=foo | /all | /clear"

server = http.createServer handleRequest

port = 3000
server.listen port, ->
  console.log "kvstore CoffeeScript running on http://127.0.0.1:#{port}/"
  console.log "Try: curl 'http://127.0.0.1:3000/set?key=mykey&val=myval'"
  console.log "     curl 'http://127.0.0.1:3000/get?key=mykey'"
  console.log "     curl 'http://127.0.0.1:3000/all'"
  console.log "     curl 'http://127.0.0.1:3000/clear'"
