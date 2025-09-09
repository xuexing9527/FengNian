# 性能优化 - HTTP 缓存
- Cache-Control
- Etag 和 last-Modified

- Cache-Control 参数
    - max-age
    - no-cache
    - no-store
    - public
    - private

- 原则：尽可能给每种资源都指定一个明确的缓存时间
    - 指定缓存时间
        - 防止不必要的验证。`每次都在没有更新的情况下重发相同内容`
    - 验证方法
        - 指定缓存时间到期后，执行验证。`每次使用资源时都多余地执行验证检查`


- 关于 Cache-Control 的配置策略
    - HTML页面：设置不缓存，确保每次请求都获取最新的页面。
    - 带版本号的CSS和JS文件：设置永久缓存，通过版本号控制更新。