# React 中的最小堆算法
- 本节所需前置知识
    - 局部到整体的理解 React 源码，小示例展示局部到全局的一个认知
        - 可不可以直接从总体到局部认知，可以，需要更多的前置知识和基础
        - 最好是从局部到全局，学完之后，就明白了原来是这么个全局的模样（心急而基础不足的同学，静下心来慢慢从局部认识到总体认知）
    - Scheduler 包，为什么会有 Scheduler？
- 最小堆算法在 React 中的意义
    - 解决 Scheduler 过程中任务优先级问题

相关代码：https://github.com/facebook/react/blob/main/packages/scheduler/src/SchedulerMinHeap.js