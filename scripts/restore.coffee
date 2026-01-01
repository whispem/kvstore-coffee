fs = require 'fs'
backup_file = process.argv[2]
if not backup_file
  console.error "Usage: coffee scripts/restore.coffee path/to/backup.json"
  process.exit(1)

fs.copyFileSync backup_file, 'kvstore_data.json'
console.log "Restored kvstore_data.json from #{backup_file}"
