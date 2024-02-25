### 自定义 Hooks
#### 该如何理解自定义 Hooks ？
关于自定义 Hooks 的思考：

从 hooks 出现之后，对自定义 hooks 理解有限。一下子想到的自定义hooks 有两处：  
1. 自定义一些生命周期 hooks，比如useMount, useUnMount。这是两个最容易想到的生命周期 hook。示例如下：
    ````js
        useMounted
    ````
    但是，又觉得上述示例中两个 hooks, 不封装用着也不麻烦，封装了似乎又有些多此一举。
2. 数据请求的 hooks，看示例:
    ````js
   // 比如之前请求数据需要
   requestSomeDataApi().then((msg) => {
       // 处理获取的 msg 数据
       console.log(msg);
   })
   // hooks 改写
   // useRequestSomeData = 
   const data = useRequestSomeData()
    ````

官方解释 hooks 就是一个个函数，公共逻辑都可以写成自定义 hook。如此广泛，哪些场景合适自定义 hooks ，哪些场景用自定义 hook 是画蛇添足，一时难以分辨。  
深知需深入理解 hooks 概念原理，及 hooks 和 class 组件的区别，才能更好的理解自定义 hooks 究竟适用于哪些场景