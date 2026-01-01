assert = require 'assert'
Storage = require '../src/storage'

Storage.clear()
Storage.set 'x', '123'
assert.equal Storage.get('x'), '123'
Storage.set 'y', 'abc'
assert.equal Storage.get('y'), 'abc'
assert.deepEqual Storage.all(), { x: '123', y: 'abc' }
Storage.clear()
assert.equal Storage.get('x'), null
console.log "All kvstore tests passed."
