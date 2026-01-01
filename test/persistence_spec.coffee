assert = require 'assert'
fs = require 'fs'
Storage = require '../src/storage'

Storage.clear()
Storage.set 'persist', 'on_disk'
assert.equal Storage.get('persist'), 'on_disk'
assert(fs.existsSync('kvstore_data.json'), "Data file exists")
Storage.clear()

# Simulate module reload (you may want to re-run storage.load() directly with some tweaks)
data = JSON.parse fs.readFileSync('kvstore_data.json', 'utf8')
assert('persist' not of data.data, "Key removed after clear")
console.log "Persistence test passed."
