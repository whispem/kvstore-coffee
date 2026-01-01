# ☕️ kvstore-coffee

### A minimalist **Key/Value Store server**... in pure CoffeeScript, *just because the name is too good to pass up.*

---

> **Ever dreamed of storing your data in a delicious, barista-grade backend?  
> Tired of boring, modern languages and wanted some retro-fun fueled by JavaScript’s most aromatic cousin?  
> Welcome to kvstore-coffee!**

---

## 🚀 Features

- 🛠 **/set, /get, /del, /all, /clear, /stats** – your classic KV endpoints, fresh-brewed.
- ⏳ *TTL support* – keys can expire, just like your energy on Monday mornings.
- 💾 *Data persists on disk* (`kvstore_data.json`) – don't trust RAM? We got you.
- 🧹 `/clear` – spill your cup, erase everything.
- 📊 `/stats` – because every barista needs to know how many keys are in the pot.
- 🤖 *Test suite* – because even joke projects deserve real tests.

## ☕️ Why CoffeeScript?
Because... CoffeeScript.
- The name is funny.
- No curly braces, no semicolons, pure indentation.
- It’s JavaScript, but hipster.  
- It smells like startup HN posts from 2012.

---

## 🏁 Quickstart

```bash
npm install -g coffeescript
git clone https://github.com/whispem/kvstore-coffee.git
cd kvstore-coffee
npm start
```

Or old school:
```bash
coffee src/kvstore.coffee
```

---

## 🔌 API Examples

```bash
curl "http://127.0.0.1:3000/set?key=foo&val=bar&ttl=10"   # Store foo=bar for 10s
curl "http://127.0.0.1:3000/get?key=foo"                  # Retrieve value for foo
curl "http://127.0.0.1:3000/del?key=foo"                  # Delete foo
curl "http://127.0.0.1:3000/all"                          # Get all keys/values
curl "http://127.0.0.1:3000/stats"                        # Some ‘productivity’ stats
curl "http://127.0.0.1:3000/clear"                        # Pour out your data
```

---

## 🧪 Testing

```bash
npm test
```
Or for unit tests:
```bash
coffee test/kvstore_spec.coffee
```

---

## 🧠 “Architecture”

- `src/kvstore.coffee` — The (coffee) server
- `src/storage.coffee` — Internal bean jar (store/TTL/persistence logic)
- `src/utils.coffee`   — Helper espresso shots (key/value validators)
- `test/` — Where we check the blend
- `scripts/` — Backup/restore tools for true connoisseurs

---

## 📝 License

MIT.  
You are free to fork, remix, and brag about running CoffeeScript in 2026.

---

## 🍩 FAQ

**Q : Is this project serious ?**  
A : About as serious as a double ristretto at 3am.

**Q : Why not TypeScript?**  
A : Because “kvstore-typescript” isn’t half as funny.

**Q : Will you maintain this in production?**  
A : Only if you bring donuts.

---

> **Try it. Show it to your favorite hipster dev.  
> Store your deepest secrets in an artisanal, hand-crafted JS backend.  
> kvstore-coffee : For when you want your keys fresh and your values well-roasted.**
