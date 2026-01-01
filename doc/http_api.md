# HTTP API Reference

## Set Key
`GET /set?key=foo&val=bar[&ttl=30]`  
→ Sets the key "foo" to "bar", optionally expiring in 30 seconds.

## Get Key
`GET /get?key=foo`  
→ Returns value for "foo" (or null).

## Delete Key
`GET /del?key=foo`  
→ Deletes "foo" from the store.

## All Keys
`GET /all`  
→ Returns the entire store as JSON.

## Stats
`GET /stats`  
→ Info about key count, keys, uptime, data file.

## Clear store
`GET /clear`  
→ Deletes all keys.
