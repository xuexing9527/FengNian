### React中的Fiber
- Fiber直译为纤维，读/ˈfaɪbər/。在计算机术语中，有纤程（纤程调度），纤维数据结构（Fiber Data Structure），纤维图（Fiber Graph）等相关概念。  
纤程，线程，进程  
理解react的执行过程  

- 细节初探：  
背景：抛开其他，有一个核心是，我们要把 Virtual DOM Tree 和 Actural DOM Tree 进行对比，然后进行差异更新（这是 diff 算法，与 fiber 无关，24.04.29批注）。  
对比两棵树的差异，时间复杂度常规及优化
react因此采用了哪些？  

- 咨询GPT后的认知：  
对比 Virtual DOM Tree 的递归过程没有变化，这个过程是 reconciliation（协调）过程  
fiber 架构只是将之前执行更新的过程变成了可中断的执行过程。  
fiber 之前的更新过程，react 将需要更新的任务放入一个队列，对队列进行按序批量更新，这个过程持续占用主线程  
fiber 引入之后，react 将需要更新的任务，设计成具有优先级对 fiber 数据结构，将更新队列设计成链表结构（单向）。利用浏览器关键帧的空闲时间去更新 fiber 任务。更新过程可中断。这种情况下，间接提升了性能。（实际上并没有实质的改变，相当于把任务切碎，后台悄悄运行去了。优化执行方式 + 合理利用浏览器资源，间接提升了 react 应用的性能）  

- 继续查找：将 stack reconciler 改成 fiber reconciler
    - stack reconciler
        - 占用主线程
        - 不可中断
    - fiber reconciler
        - 不占用主线程
        - 可中断
    
- 关于requestIdleCallback API的一些参考链接：  
    - 概念和用法：https://developer.mozilla.org/zh-CN/docs/Web/API/Background_Tasks_API
- 关于 requestAnimationFrame API的一些参考：  
    - 链接：https://developer.mozilla.org/zh-CN/docs/Web/API/window/requestAnimationFrame  
    文中有许多参考链接