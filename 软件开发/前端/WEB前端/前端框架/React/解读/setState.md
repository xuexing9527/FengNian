# setState 
UI = f(state)

每次 state 改变，UI 需要重新渲染

写这个模型，要设计：

1. 批量管理 state

2. 批量管理 DOM

其它细节：

state 和 DOM 对应关系

- state 在 DOM 的哪里，如何设计二者关系？

思考：

拆分组件，state 作用到全部的 DOM 太复杂，拆分为较小的组件，可以将复杂问题简单化。

原本可以自由更新的 DOM，会在组件化的过程正，变成 state 驱动。 
- 含 state 的组件
- 不含 state 的 pure 组件，相当于纯 DOM，无需监听 state