assert = require 'assert'
Storage = require '../src/storage'

# Clear store before test
Storage.clear()
Storage.set 'x', '123', 1
assert.equal Storage.get('x'), '123'
Storage.set 'y', 'abc'
assert.equal Storage.get('y'), 'abc'
assert.deepEqual Storage.all(), { x: '123', y: 'abc' }
assert.equal Storage.del('x'), true
assert.equal Storage.get('x'), null

# Test TTL (expiration): should delete after 1 second
Storage.set 'ttltest', 'foo', 1
setTimeout (-> 
  assert.equal Storage.get('ttltest'), null
  console.log "All kvstore tests passed after TTL."
), 1100
