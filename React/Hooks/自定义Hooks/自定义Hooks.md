### 自定义 Hooks
#### 该如何理解自定义 Hooks ？
关于自定义 Hooks 的思考：

从 hooks 出现之后，对自定义 hooks 理解有限。一下子想到的自定义hooks 有两处：  
1. 自定义一些生命周期 hooks，比如useMount, useUnMount。这是两个最容易想到的生命周期 hook。示例如下：
    ````js
    export default useMount = (callback) => {
        useEffect(() => { callback && callback() }, [])
    }
    ````
    但是，又觉得上述示例中两个 hooks, 不封装用着也不麻烦，封装了似乎又有些多此一举。【react后续文档的确强调：尽量摒弃生命周期思维去写 hooks。官方点名这个 useMount hook 不很适合 react 范式，参考来源：https://zh-hans.react.dev/learn/reusing-logic-with-custom-hooks 】
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

hooks 就是一个个函数，理论上讲，公共逻辑都可以写成自定义 hook。这样就会令自定义 hooks 如此泛泛而变得扑朔迷离。哪些场景合适自定义 hooks ？哪些场景用自定义 hook 是画蛇添足？一时难以分辨。  
深知需深入理解 hooks 概念原理，及 hooks 和 class 组件的区别，才能更好的理解自定义 hooks 究竟适用于哪些场景

官方再版的文档给出指导建议：
- 好的自定义 Hook 通过限制功能使代码调用更具声明性【关于声明和命令的区别】

自从 class 组件可以用 hooks 实现之后，react 的代码变成了有 UI 部分的 hooks，及没有 UI 部分的 hooks 的组合。

class 组件时代，想要包装组件需要用 HOC 来改变并装饰内容。hooks 不需要 HOC 了，hook 本身就是函数，js 中，函数作为一等公民，函数嵌套函数是很常见的。