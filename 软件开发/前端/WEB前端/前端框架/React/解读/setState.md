# setState 
UI = f(state)

每次 state 改变，UI 需要重新渲染

写这个模型，要设计：

1. 批量管理 state

2. 批量管理 DOM

其它细节：

state 和 DOM 对应关系

- state 在 DOM 的哪里，如何设计二者关系？