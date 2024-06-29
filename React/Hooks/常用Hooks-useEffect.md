### useEffect
### 最初的理解
最初理解useEeffect是处理副作用的  
旧版文档地址：https://zh-hans.legacy.reactjs.org/docs/hooks-effect.html
这样理解的话，有一些困惑：
1. 为什么要用useEffect去模拟生命周期，而不直接把组件的生命周期给出对应的hook呢？
2. 为什么useEffect要传递空数组来表示did mounted，不传递任何监听参数，每次渲染都会调用？  
问题1，2的思考，显然说明 useEffect 不是为了模拟生命周期和发送数据请求而设计的  

react在逐步更新文档，新版文档给出useEffect的定义，更贴切些。  
- useEffect Hook 是为了让组件和外部系统同步。我理解为，暴露的一个方法，使外部系统可以通过这个方法与 react 组件的渲染机制进行交互（同步）。  

这个角度定义，上文提到的问题1，2就不必纠结了。
- 问题1解释：useEffect是为了更广泛与 react 组件渲染进行互动，模拟生命周期只是一隅。
- 至于问题2: 传递和不传递空数组作为依赖项，才表现出，不传递任何参数才是它的本真（初始）状态。传空数组仅仅是为了特殊场景，虽然这个特殊场景，在组件中非常常用，却不见得是 useEffect 的设计初衷。

react新版文档中，提出甚至不必在useEffect中请求数据

### 关于 useEffect 传递空数组执行两次的问题