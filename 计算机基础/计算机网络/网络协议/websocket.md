# websocket
## 概念
WebSocket 在 HTML5 标准中引入，核心是解决“浏览器与服务器之间的实时双向通信”问题

## HTTP
HTTP 是应用层协议，它运行在 TCP 之上。  
HTTP 的设计是：短连接，无状态，每个请求都是一次性的交易
```
GET /data HTTP/1.1
Host: example.com
Authorization: Bearer abc123
```
→ 发一次请求，就带一次认证、每次都要重新握手 TCP（三次握手）

当然 HTTP 是支持 Keep-Alive 长连接的，避免每次都进行 TCP 三次握手，减少服务器 CPU， IO 开销，我们来看下长短连接。

例子对比： 普通短连接（每次都三次握手）：
```
客户端：SYN
服务端：SYN-ACK
客户端：ACK → 发送请求A
服务端：响应A → close 四次挥手关闭 TCP 连接
```

下一次请求B再重新 TCP 握手一遍...

Keep-Alive 长连接：
```
客户端：SYN
服务端：SYN-ACK
客户端：ACK   -->  TCP连接建立完成（三次握手）

客户端：发送 HTTP 请求 A
服务端：响应 A

客户端：发送 HTTP 请求 B
服务端：响应 B

连接空闲 or 超时 or 主动关闭 --> FIN/ACK 四次挥手 close TCP 连接
```

其实运输层 TCP 本身不关注长短链接，这是应用层通信模式的描述。它只关心这几件事：

- 建立连接（3 次握手）
- 传输数据（按序、重传、流控、拥塞控制）
- 关闭连接（4 次挥手）

是否用一次就关掉，完全由上层（HTTP/WebSocket/数据库协议）决定，TCP 不但不关注长短链接。

HTTP 不便于实现 即时通讯，服务端内容推送等形式的交互，虽然可以通过轮询等方式勉强实现，终归显得牵强。

WebSocket 的设计是：
- 长连接（建立一次连接后持续存在）
- 握手一次，持续通信（通过 HTTP 协议升级建立连接）
- 低开销通信（无需重复发送认证信息、Header 等）

WebSocket 的连接过程是这样：

客户端发一个 HTTP 请求：
```
GET /chat HTTP/1.1
Host: server.com
Upgrade: websocket
Connection: Upgrade
Sec-WebSocket-Key: dGhlIHNhbXBsZSBub25jZQ==
Sec-WebSocket-Version: 13
```
服务器返回：
```
HTTP/1.1 101 Switching Protocols
Upgrade: websocket
Connection: Upgrade
Sec-WebSocket-Accept: s3pPLMBiTxaQ9kYGzzhZRbK+xOo=
```
连接过程做了什么？

- 利用 HTTP 协议，穿透各种代理、防火墙
- 完成 WebSocket 协议升级，验证客户端合法性
- 建立 TCP 长连接通道

从此以后双方就说 WebSocket 的“话”，不再说 HTTP 的“话”了。
