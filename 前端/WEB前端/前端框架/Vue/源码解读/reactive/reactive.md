# reactive 
## 关于 reactive

### reactive 核心是依赖收集和触发更新
- 依赖收集 effect track，三种情况： get, has, ownKeys
- 触发更新 trigger，两种情况：set, deleteProperty

#### 前置问题：
- 只读问题
响应式属性值是否是只读的？处理只读逻辑。  
响应式一般常规理解，set 触发 get 对应的依赖更新。所以要考虑 set 是否能更改对应的值。所以要考虑只读属性值

#### track（追踪）
凡是需要追踪响应式值的地方（如 get，in，has），都需要 track （追踪）。所以 track 要记录多个依赖方法。
#### trigger（触发）
触发 track 方法，在 set， deleteProperty 的时候触发。

**理解起来大概是 get (还有其它情况：has iterate )这个值的时候，往往要收集这个依赖。当这个值被 set 的时候，触发那些 get 过这些值的依赖函数**

- baseHandlers.ts: baseHandlers.ts 中定义的是 Proxy 的拦截器，即 get、set、has 等操作。这些拦截器会在访问响应式对象的属性时触发，用于执行依赖收集、值的修改等操作。

- get 用于拦截读取操作；
  - 思考 get 会遇到的情况？get 的核心思想？  
  核心思想：返回对应的值 => `obj[key]` 的时候触发 get 方法
- set 用于拦截写入操作；
- has 用于判断属性是否存在。

- effect 和依赖收集: 管理依赖收集与触发逻辑。
在 Vue 3 中，effect 主要用于执行副作用（例如，更新视图、计算属性等）。effect 在执行时会通过 get 操作收集依赖，当数据发生变化时，effect 会重新运行。

- 依赖收集的逻辑通过 get 和 set 拦截器实现，effect 会在这些拦截器中触发。具体来说，effect 的触发主要是在 Vue 的响应式系统中通过 track 和 trigger 函数来完成的，而这些函数是由 get 和 set 方法调用的。

1. track （追踪）函数：
track 是依赖收集的核心函数，它会把当前的执行上下文（即 effect）注册到响应式对象的依赖中。在访问响应式对象的属性时（即 get），会调用 track 来收集依赖。

2. trigger （触发）函数：
trigger 函数则是当数据变化时（即 set），触发对应的副作用函数（即重新执行相关的 effect）。

- BaseReactiveHandler 修改
  - constructor 添加
    - _isReadonly 属性
    - _isShallow 属性
  - get 方法
    - 对获取数据进行处理  

BaseReactiveHandler 原文如下：
```ts
class BaseReactiveHandler implements ProxyHandler<Target> {
  constructor(
    // __x 受保护的只读属性
    protected readonly _isReadonly = false,
    protected readonly _isShallow = false,
  ) {}

  /**
   * __x
   * target 原始对象
   * key 访问的属性键值，这里 key 如果是 ReactiveFlags 中的几个特殊属性，返回 boolean 值
   * receiver 
   */
  get(target: Target, key: string | symbol, receiver: object): any {
    if (key === ReactiveFlags.SKIP) return target[ReactiveFlags.SKIP]

    const isReadonly = this._isReadonly,
      isShallow = this._isShallow
    if (key === ReactiveFlags.IS_REACTIVE) {
      return !isReadonly
    } else if (key === ReactiveFlags.IS_READONLY) {
      return isReadonly
    } else if (key === ReactiveFlags.IS_SHALLOW) {
      return isShallow
    } else if (key === ReactiveFlags.RAW) {
      if (
        receiver ===
          (isReadonly
            ? isShallow
              ? shallowReadonlyMap
              : readonlyMap
            : isShallow
              ? shallowReactiveMap
              : reactiveMap
          ).get(target) ||
        // receiver is not the reactive proxy, but has the same prototype
        // this means the receiver is a user proxy of the reactive proxy
        Object.getPrototypeOf(target) === Object.getPrototypeOf(receiver)
      ) {
        return target
      }
      // early return undefined
      return
    }

    const targetIsArray = isArray(target)

    if (!isReadonly) {
      let fn: Function | undefined
      if (targetIsArray && (fn = arrayInstrumentations[key])) {
        return fn
      }
      if (key === 'hasOwnProperty') {
        return hasOwnProperty
      }
    }

    const res = Reflect.get(
      target,
      key,
      // if this is a proxy wrapping a ref, return methods using the raw ref
      // as receiver so that we don't have to call `toRaw` on the ref in all
      // its class methods
      isRef(target) ? target : receiver,
    )

    if (isSymbol(key) ? builtInSymbols.has(key) : isNonTrackableKeys(key)) {
      return res
    }

    if (!isReadonly) {
      track(target, TrackOpTypes.GET, key)
    }

    if (isShallow) {
      return res
    }

    if (isRef(res)) {
      // ref unwrapping - skip unwrap for Array + integer key.
      return targetIsArray && isIntegerKey(key) ? res : res.value
    }

    if (isObject(res)) {
      // Convert returned value into a proxy as well. we do the isObject check
      // here to avoid invalid value warning. Also need to lazy access readonly
      // and reactive here to avoid circular dependency.
      return isReadonly ? readonly(res) : reactive(res)
    }

    return res
  }
}
```
