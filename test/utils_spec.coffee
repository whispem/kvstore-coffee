assert = require 'assert'
Utils = require '../src/utils'

assert.equal Utils.isValidKey('k1_abc-99'), true
assert.equal Utils.isValidKey(''), false
assert.equal Utils.isValidKey('not$valid'), false
assert.equal Utils.isValidVal('hello'), true
assert.equal Utils.isValidVal(''), false
console.log "utils_spec tests passed."
