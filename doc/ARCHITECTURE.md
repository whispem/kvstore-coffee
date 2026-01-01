# KVStore Architecture

## Modules

- **src/kvstore.coffee** : main HTTP server
- **src/storage.coffee** : handles in-memory store, TTL, persistence
- **src/utils.coffee**   : helpers for key/value validation
- **test/**              : automated tests
- **scripts/**           : admin scripts (backup, restore...)

## Data flow

1. HTTP request → server parses → calls storage functions
2. Any store change → persistent save
3. On startup, data loaded from disk.
