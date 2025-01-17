# keep-alive

缓存组件的 vNode
侧重操作优化，而非性能优化
缓存动态组件
- 多页签组件切换
- 路由缓存

生命周期钩子
- activated
- deactivated

## LRU 策略
Last Recently used
内存管理、数据库缓存和浏览器缓存等，保留较为活跃的对象
实现方式：
双向链表和哈希表