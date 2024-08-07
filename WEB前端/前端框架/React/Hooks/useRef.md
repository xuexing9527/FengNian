### useRef  
引子：  
这个useRef总被问，我看过，后来经常会忘。很多时候，不用它也不耽误写业务。到底来理解记一下这个hook  
知其然，ref是reference的缩写，引用的意思。这个钩子就是用来保存数据的引用。官方解释，useRef保存一个数据，更新这个数据不会引发render。  
乍一听，好像是useState的反向操作。useState的使用场景比较容易理解，更新state引发render渲染。那么useRef的场景呢？数据变化，不引发组件render？那么这是一种什么实际场景？react为什么要这么设计？除他之外，别的什么方式可以这么做（不给这个方法，我们不能手动实现吗？为什么要给这个方法）？

核心：储存一个**非state**数据，更改这个数据不主动触发 react 更新

useRef的几大实用场景:  
- 场景一：储存DOM
    - 测量DOM尺寸
    - 绕过 React 事件代理机制
        - 处理焦点 focus  
        - 绑定需要 绕过 react 事件代理机制的其他事件
- 场景二：定时器ID
    - 也可以把定时器 ID 放入组件外部声明(这里我不太能明白为什么要用ref，反倒是直接放组件外部声明更简洁)
- 场景三：保存更新之前的状态
    - 与更新后状态做对比，优化或者其他特殊场景

       
- 关于 useRef 的思考：  
    - 变量不需要随着更新而改变的场景有很多，我们完全可以用js的其他方式储存这个变量(比如，组件外部声明变量等），为什么要用useRef呢？
        - 一致性(用react的方式）， useRef 会使保存的变量更安全，确保不会在组件更新的时候改变这个数据
    - 什么时候，我不用 useRef 而用 js 的方式，比如组件外部声明变量呢？
        - 这些变量与 react 逻辑（不参与 react 生命周期，状态管理）完全不想干。

    - 关于不要在渲染过程中读取和写入 ref，因为渲染过程中会多次触发render，导致多次读取和写入 ref ,除非你确定不影响（但脱离渲染机制的 ref，往往不需要在渲染过程中读取或写入，而多半在脱围机制下操作）。否则，避免这种情况。官方说：这使你的组件难以预测。（我理解为一个本来说话利索的 ref ,放到渲染过程中用,不停的赋值或读取，好像成了结巴。结结巴巴，不知道说的哪个字是我们想要的了，所以就复杂，而难以预测了）