const http = require('http');

http.createServer((req, res) => {
  res.end('Blue version');
}).listen(3000);
