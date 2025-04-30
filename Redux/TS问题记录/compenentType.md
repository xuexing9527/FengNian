# 在 Redux 7.x 之后：- 待整理

connect 变得更加严格，返回的组件类型不再默认匹配 React.FC。
TypeScript 现在更严格地检查 JSX 组件的返回类型，导致 connect(...) 的返回值需要手动指定。


- 自动推导 Props，避免不必要的 as 断言。
- 类型安全，不会丢失 CartSubmit 原有的 Props 类型。
- 适用于有 Props 的组件。
```ts
import { connect, InferableComponentEnhancerWithProps } from "react-redux";

const enhance: InferableComponentEnhancerWithProps<Props, IRootStore> = connect(mapStateToProps, mapDispatchToProps);
const ConnectedCartSubmit = enhance(CartSubmit);

export default ConnectedCartSubmit;
```

- 纯 Redux 组件，不带额外 props
- 可能导致 Props 丢失。如果 CartSubmit 本身带有 Props，但 connect 只注入 state，ComponentType 可能不会检查 extraProp 是否仍然可用：
```ts
import { ComponentType } from "react";

const ConnectedCartSubmit: ComponentType = connect(mapStateToProps, mapDispatchToProps)(CartSubmit);

export default ConnectedCartSubmit;
```

## 什么叫纯 redux 组件，什么情况下会丢失？
1. 无额外 props 的组件（纯 Redux 组件）  
这种情况下，组件只依赖于 Redux 的 state 和 dispatch。没有其他外部输入，因此你不需要关心额外的 props。Redux 连接后，组件只从 Redux 获取数据和 dispatch 事件。用 ComponentType 这种方式直接连接是完全合适的。

```ts
// Pure Redux Component
const CartSubmit = () => {
  // Redux 数据通过 `mapStateToProps` 注入
  return <div>Cart Information</div>;
};

const ConnectedCartSubmit = connect(mapStateToProps, mapDispatchToProps)(CartSubmit);

export default ConnectedCartSubmit;

```
2. 有额外 props 的组件  
当你需要组件既依赖 Redux 状态，又接收父组件传入的 props 时，connect 会 覆盖组件的 props，即使父组件传入了 props，这些 props 也会被 Redux 的 state 或 dispatch 替代或丢失。
```ts
type Props = { extraProp: string }; // 假设父组件会传入 `extraProp`

const CartSubmit = ({ extraProp }: Props) => {
  return <div>{extraProp}</div>;
};

const ConnectedCartSubmit = connect(mapStateToProps, mapDispatchToProps)(CartSubmit);

// 如果父组件传入 `extraProp`，那么连接后的 `CartSubmit` 会丢失
// 这个额外的 `extraProp`，因为 Redux 会直接控制 `props`。
// 这样可能会导致：
// <ConnectedCartSubmit extraProp="Hello" />
// 被丢弃，不会传递 `extraProp`。
```

问题：
cannot be used as a JSX component.
  Its return type 'ReactNode' is not a valid JSX element.
    Type 'undefined' is not assignable to type 'Element | null'.


这个错误我终于从头到尾fix了。我得出的结论是，connect 无法正确推断类型，最终可能返回 React.Node 类型。既然推断不成功。那就给 最终返回的 connect as 一个 React.FC。  
但问题是 React.FC<Props>，里面的Props 类型，只能是 父组件传递来的 props，而不必要写 所有的 props（比如不必包含store里面的类型），这样既保证父组件传递私有 props 的时候的正确性，又不至于类型全写增加复杂度。
connect 这样 推断不出类型，是 TS的锅，还是  connect的锅呢？？（待查...2025年2月10日）