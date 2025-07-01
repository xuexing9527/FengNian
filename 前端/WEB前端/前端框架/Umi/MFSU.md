# MFSU 方案
Micro Frontend Single Use

MFSU 是 Umi 在构建和运行时性能优化的一种解决方案，它的目的是：

加快构建速度：通过预构建和缓存依赖，减少重复编译。

模块化：将前端应用分割为多个微模块，独立部署，降低不同模块之间的耦合性。

优化共享依赖：减少重复的包依赖，节省空间，提升加载性能。

``` bash
# 清理缓存
rm -rf node_modules/.umi/.mfsu
```