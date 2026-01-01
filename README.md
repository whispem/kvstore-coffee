# kvstore-coffee

A minimalist HTTP key-value store in CoffeeScript (multi-files version).

## Features

- `SET`, `GET`, `ALL`, `CLEAR` via HTTP requests
- Modular code: storage, utils, server split in `src/`

## Install & Run

Install [CoffeeScript](https://coffeescript.org/#installation) globally :
```bash
npm install -g coffeescript
```

**Pour lancer le serveur :**
```bash
npm start
# ou:
coffee src/kvstore.coffee
```

**Pour lancer les tests :**
```bash
npm test
# ou:
coffee test/kvstore_spec.coffee
```

## API Examples

```bash
curl "http://127.0.0.1:3000/set?key=foo&val=bar"
curl "http://127.0.0.1:3000/get?key=foo"
curl "http://127.0.0.1:3000/all"
curl "http://127.0.0.1:3000/clear"
```
