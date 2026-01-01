fs = require 'fs'
backup = ->
  src = '../kvstore_data.json'
  dest = '../backup_' + Date.now() + '.json'
  fs.copyFileSync src, dest
  console.log "Backup to #{dest} done."

backup()
