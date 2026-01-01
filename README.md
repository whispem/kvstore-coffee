# ☕️ kvstore-coffee

![Not Sponsored by Starbucks](https://img.shields.io/badge/Not%20Sponsored%20by-Starbucks%E2%84%A2-brightgreen?logo=starbucks)

A minimalist Key/Value Store server built in pure CoffeeScript.  
Because the name made me laugh, and sometimes that's all the reason you need.

---

> Ever dreamed of storing your data in a barista-grade backend?  
> Wanted some retro-fun fueled by JavaScript’s most aromatic cousin?  
> Welcome to kvstore-coffee !

---

## ✨ Features

- `/set`, `/get`, `/del`, `/all`, `/clear`, `/stats` – classic KV endpoints, fresh-brewed
- TTL support – keys can expire, like your energy on Monday mornings
- Persistence to disk (`kvstore_data.json`) – don't trust RAM? We got you
- `/latte` (Easter egg) – for those who crave caffeinated JSON
- Full test suite, because even meme projects deserve it

---

## ☕️ Why CoffeeScript?
- The name alone deserves a project
- No curly braces, no semicolons: pure indentation
- JavaScript, but hipster
- Retro startup HN vibes circa 2012

---

## 🚀 Quickstart

```bash
npm install -g coffeescript
git clone https://github.com/yourname/kvstore-coffee.git
cd kvstore-coffee
npm start
```

Or, if you want to go old school:
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
curl "http://127.0.0.1:3000/stats"                        # Get stats
curl "http://127.0.0.1:3000/clear"                        # Clear the store
curl "http://127.0.0.1:3000/latte"                        # Hipster JSON surprise
```

---

## 🥤 `/latte` Endpoint

Need a break? Try the `/latte` endpoint.  
Returns a special JSON recipe for a Caffè Latte — because why not?

Example:
```json
{
  "beverage": "Caffè Latte",
  "ingredients": ["espresso", "steamed milk", "a touch of foam"],
  "size": "Grande",
  "caffeine": "enough to fuel your hackathon",
  "vibes": "hipster-certified"
}
```

---

## 🧪 Testing

```bash
npm test
```
Or directly:
```bash
coffee test/kvstore_spec.coffee
```

---

## 🗃️ Architecture

- `src/kvstore.coffee` — HTTP server and routing
- `src/storage.coffee` — Internal store with TTL and persistence
- `src/utils.coffee`   — Key/value validation helpers
- `test/`              — Tests for your blend
- `scripts/`           — Backup/restore tools

---

## ⚠️ Disclaimer

☕️ *Not sponsored by Starbucks™, but open to free macchiatos.*  
All resemblance to coffee chains is purely coincidental.  
Any caffeine-fueled bugs are not endorsed (or compensated) by Starbucks, unfortunately.

> **If you are Starbucks legal and found this, please contact me — I’ll buy you a coffee.**

---

## 📄 License

MIT.  
Fork, remix, and brag about running CoffeeScript in 2026.

---

## FAQ

**Q: Is this project serious?**  
A: About as serious as a double ristretto at 3am.

**Q: Why not TypeScript?**  
A: “kvstore-typescript” doesn’t have the same flavor.

**Q: Will you maintain this in production?**  
A: Only if you bring donuts.

---

Try it, show it to your favorite hipster dev, and  
store your secrets in an artisanal, hand-crafted JS backend.  
**kvstore-coffee**: For when you want your keys fresh and your values well-roasted.
