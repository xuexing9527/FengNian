## JavaScript中的constructor(构造函数)

### 阅读前提：
- 熟悉`ES6，JavaScript`

### 文章相关：
- `JavaScript`中的`constructor`，`super`
- `JavaScript`中的类(`class`)，构造函数，工厂函数
- `JavaScript`中`this，new`关键字,原型链`prototype`
- `ES`规范概述（2024年1月）

### 其它：
- 本文中所说`class`，如未其它明确标注，均表示`js`语言中的类

#### `JavaScript`中`constructor`的“前世今生”

`constructor`“今生”：`js`中在`class`中调用的构造函数，由`ECMAScript 6`制定，在`class`的定义中调用。示例1：
````js
class aJsClass {
    constructor () {}
}
````
`constructor`用来初始化`calss`的状态，初始化`class`的默认值。说人话就是：`constructor`来设计`class`生出来的对象的样子。

`constructor`的用法，示例2:
````js
class aJsClass {
    constructor (gebo, tui, otherOptions) {
        this.gebo = gebo || '大众胳膊'
        this.tui = tui || '大众腿'
        Object.assign(this, otherOptions)
    }
}

const xiaoHua = new aJsClass()
const daHua = new aJsClass(gebo: '精致胳膊', tui: '一米五腿')

console.log(xiaoHua) // 控制台输出小花： { "gebo": "大众胳膊", "tui": "大众腿" }
console.log(daHua)   // 控制台输出大花： { "gebo": "精致胳膊", "tui": "一米五腿", "opts": { "IQ": 998 } } 
````
`constructor`“前世”相关：独立的**构造函数**，不依赖class而存在的函数方法，一般函数名开头字母大写，非强制要求。
示例2的构造函数写法，示例3：
````js
function AConstructorFunction (gebo, tui, otherOptions) {
    this.gebo = gebo || '大众胳膊'
    this.tui = tui || '大众腿'
    Object.assign(this, otherOptions)
}
const xiaoHua = new AConstructorFunction()
console.log(xiaoHua) // 控制台输出小花： { "gebo": "大众胳膊", "tui": "大众腿" }
````
示例3注意：
1. 构造函数，AConstructorFunction首字母大写了（不强制，首小写一样用，只是便于阅读。看到首字母大写的函数，可能是个构造函数）
2. 调用构造函数使用了`new`关键字。函数`AConstructorFunction`没有返回值，所以不直接调用`AConstructorFunction()`，直接调用返回`undefined`。（*提问1：那么为什么不直接`return`个`object`呢？又是`this`，又是`new`的，想干啥？*）





super和minxins


这里我是有个疑问，为什么class中方法不放到`constructor`中呢？