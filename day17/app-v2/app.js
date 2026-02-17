const http = require('http');

http.createServer((req, res) => {
  res.end('Green version');
}).listen(3000);
