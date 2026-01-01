# Usage Guide

1. Start the server:  
   `npm start`

2. Set a key (optionally with TTL):  
   `curl "http://localhost:3000/set?key=foo&val=bar&ttl=20"`

3. Get a value:  
   `curl "http://localhost:3000/get?key=foo"`

4. Delete a value:  
   `curl "http://localhost:3000/del?key=foo"`

5. Retrieve all data:  
   `curl "http://localhost:3000/all"`

6. See stats:  
   `curl "http://localhost:3000/stats"`
