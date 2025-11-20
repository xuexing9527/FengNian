// server.js

// 1. 导入 Node.js 内置的 'http' 模块
const http = require('http');

// 2. 导入内置的 'url' 模块，用于解析 URL
const url = require('url');

// 3. 定义服务器监听的端口号
const port = 3000;

// 4. 创建服务器
//    createServer 方法接收一个回调函数，该函数会在每次有请求到达时被执行
const server = http.createServer((req, res) => {
  // req (request) 对象包含了所有请求信息
  // res (response) 对象用于构建和发送响应

  // 设置响应头，告诉客户端返回的数据是 JSON 格式，并且使用 UTF-8 编码
  res.setHeader('Content-Type', 'application/json; charset=utf-8');

  // 解析请求的 URL，获取查询参数
  const parsedUrl = url.parse(req.url, true);
  const queryParameters = parsedUrl.query;

  // 获取 'name' 参数的值
  const name = queryParameters.name;

  // 设置响应状态码为 200 (OK)
  let statusCode = 200;
  let responseBody = {};

  // 业务逻辑处理
  if (name) {
    // 如果成功获取到 'name' 参数
    const randomNumber = Math.floor(Math.random() * 101); // 生成 0-100 的随机数
    responseBody = {
      status: "success",
      message: `你好, ${name}!`,
      random_number: randomNumber
    };
  } else {
    // 如果没有提供 'name' 参数
    statusCode = 400; // 设置状态码为 400 (Bad Request)
    responseBody = {
      status: "error",
      message: "请在 URL 中提供 'name' 参数，例如：/?name=张三"
    };
  }

  // 将响应状态码写入响应头
  res.writeHead(statusCode);

  // 将 JavaScript 对象转换为 JSON 字符串，并发送给客户端
  res.end(JSON.stringify(responseBody));
});

// 5. 启动服务器，开始监听指定端口
server.listen(port, () => {
  console.log(`服务器已启动，请访问 http://localhost:${port}`);
});