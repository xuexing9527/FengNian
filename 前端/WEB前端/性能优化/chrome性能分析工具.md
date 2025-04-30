# chrome 性能分析工具
## Performance 面板
### 指标

- LCP
largest contentful paint

- INP

- CLS

- FCP
- FP
- DCL

- TTFB
- RTT
#### Long Task
https://web.dev/articles/optimize-long-tasks?utm_source=devtools&hl=zh-cn
- 概念：
主线程一次只能处理一个任务，任何超过 50 毫秒的任务都是长任务。

相关名词
- 主线程
- 阻塞阶段
对于超过 50 毫秒的任务，任务的总时间减去 50 毫秒成为任务的阻塞阶段。
为什么这么定义阻塞阶段？

```
要点：JavaScript 之所以这样工作，是因为它使用“运行到完成模型”来执行任务。这意味着，无论任务可能阻塞主线程多长时间，它都会一直运行到完成为止。
运行到完成模型 ?
https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Execution_model#run-to-completion
```
long task
让出主线程
  setTimeout
  优点
  缺点

  专用 API
  scheduler.yield()

  webworker 




https://web.dev/articles/inp?hl=zh-cn

### 栏目

### Summary
### Bottom-up
### Call tree
### Event log


## Network
### Timing 栏

## Lighthouse

## window.performance
API




显出骨架屏

代码打包拆分
静态资源合并 

long task 优化



render  bloking


目标: 
首屏 LCP 1s 以内，    LCP 最大内容绘制

