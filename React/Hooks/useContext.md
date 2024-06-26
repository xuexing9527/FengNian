## useContext
- context（上下文）的概念，是软件开发中一种通用的设计模式。储存一组特定的环境信息和数据状态，以便在其他（类似）操作中共享和传递。比如：
    - 服务端处理http请求，常包含上一次请求的信息。常有req和res作为context上下文的一部分。
    - 数据库操作中，connect之后，查询数据。储存并共享登陆认证，或在上次查询的基础下继续查询等的一些共享信息及状态的传递。（也是一种上下文的概念）。
    - 前端框架中，组件化开发，调和各组件间数据传递的环境信息和数据状态。比如 react 中的 context 。（我理解，前端概念中的 context 更加松散，不像请求 context 和数据库 connect 这些 context 那么特定）  
- redux中使用了context来传递store
- context 用来跨组件传递数据。react 通过 context 机制，将 context 引用的数据进行保存，并传递到 provider 对应子组件的 props 中。（思考：这种方式是否简化了手动每层级传递 context 数据的性能？还是仅仅是操作优化，和手动层级传递 props 没有性能区别呢？）

### useContext 官方解释
- 让你读取和订阅组件中的 context

### 关于context的使用：
- 为什么要设计成 new context, context provider, context consumer？而不是直接 new context， context consumer 呢？
    - 思考这里 new context 和 provider 应该是同级，或者 new context 在 provider 的上级。这样 provider 可以选择让谁有 context。  
- *`context consumer 似乎不在 useContext hook 的使用中，context consumer 是 context 的旧用法。useContext hook 的用法是用 import 进来 context 的声明，这里目前不是很了解。24.04.30 批注`*

- context 弊端：
    - 慎用，context 包装的数据，容易嵌套混乱，导致增加维护复杂度。

关于 context 的优化：
- provider 嵌套的子组件尽量精准，不要包含太多不需要传递的子项。（个人认为这项不是很关键，redux 就是在根组件嵌套的。
- 必要组件，再去连接 provider 提供的数据。
- useMemo, shouldComponentUpdate 去优化(待研究)

思考：为什么我总是记不出 useContext 的用法呢？究竟是不了解这种设计方式，还是这种设计本身就的确绕呢？我需要寻找一种能记住的方法，死记硬背是不科学的。到底这个设计遵循了什么？