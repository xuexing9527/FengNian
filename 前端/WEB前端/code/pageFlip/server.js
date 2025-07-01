// // server.js
// const http = require('http');
// const fs = require('fs');
// const path = require('path');

// const PORT = 8080;
// const MIME_TYPES = {
//   '.html': 'text/html',
//   '.js':   'text/javascript',
//   '.css':  'text/css',
//   '.jpg':  'image/jpeg',
//   '.jpeg': 'image/jpeg',
//   '.png':  'image/png',
//   '.gif':  'image/gif',
//   '.svg':  'image/svg+xml',
//   '.json': 'application/json',
//   '.ico':  'image/x-icon',
//   '.woff': 'font/woff',
//   '.ttf':  'font/ttf',
// };

// http.createServer((req, res) => {
//   let reqPath = decodeURI(req.url.split('?')[0]);
//   if (reqPath === '/') reqPath = '/index.html';
//   const filePath = path.join(process.cwd(), reqPath);
//   const ext = path.extname(filePath);

//   fs.readFile(filePath, (err, data) => {
//     if (err) {
//       res.writeHead(404, { 'Content-Type': 'text/plain' });
//       res.end('404 Not Found');
//       return;
//     }

//     res.writeHead(200, { 'Content-Type': MIME_TYPES[ext] || 'application/octet-stream' });
//     res.end(data);
//   });
// }).listen(PORT, () => {
//   console.log(`Server running at http://localhost:${PORT}/`);
// });
// minimal-server.js
require('http').createServer((req, res) =>
  require('fs').createReadStream('.' + (req.url === '/' ? '/index.html' : req.url))
    .on('error', () => { res.writeHead(404); res.end('Not found'); })
    .pipe(res)
).listen(8080, () => console.log('http://localhost:8080'));

