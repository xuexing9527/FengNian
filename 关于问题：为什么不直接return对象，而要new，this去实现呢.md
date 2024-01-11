## JavaScript中的constructor(构造函数)

### 阅读前提：
- 熟悉`ES6，JavaScript`

### 文章相关知识：
- `JavaScript`中的`constructor`
- `JavaScript`中的类(`class`)，构造函数
- `JavaScript`中`this，new`关键字,原型链`prototype`

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

小伙伴们应该知道，js中class写法只是构造函数加原型继承方式来生产对象的一种语法糖。所谓语法糖，通俗解释就是代码原理不变，换种即好写，又好看的写法。所以：
- js中class创建的对象，本质上等同于构造函数创建的对象，都是以原型继承的方式实现
- class中的constructor就是构造函数，用来构造对象的初始化状态
- class中的方法，就是在构造函数的原型链(prototype)上添加方法

一般业务中，处理数据大多用函数直接return对象即可，下面对比下一般业务中数据处理两种方式：

示例4：
````js
function aObjectIndustry (gebo, tui, otherOptions) {
    const obj = {}
    obj.gebo = gebo || '大众胳膊'
    obj.tui = tui || '大众腿'
    return Object.assign(obj, otherOptions)
}
const xiaoHua = aObjectIndustry()
console.log(xiaoHua) // 控制台输出小花： { "gebo": "大众胳膊", "tui": "大众腿" }
````
示例4也能返回对象

为了便于讲述：

此处姑且称，函数直接return对象为，**创建对象**。构造函数`new`出来的对象，称为**构造对象**

**创建对象**和**构造对象**，主要区别体现在，创建函数比较灵活，创建的对象不包含统一类规律。比如我们从服务端拿到一些数据，往往用函数创建一个对象用来处理数据，新增或者删除一些属性，进行赋值，并返回这个新对象，并不需呀构造函数来处理。  
下面来看这种情况，如示例5：
````js
// 假设这是从服务端获取的数据
const obj = {
    code: 1,
    data: {
        name: '张三',
        age: 18,
        xx1: '...',
        xx2: '...',
        xx3: '...'
    }
}

function formatData (obj) {
    const { data } = obj
    // 删除不必要的属性
    delete data.xx1
    delete data.xx2
    delete data.xx3
    // 新增一些前端属性
    data.frontEndAttrs = {
        attr1: '...' ,
        attr2: '...' 
    }
    return data
}

const data = formatData(obj)
console.log(JSON.stringify(data)) // 输出： {"name":"张三","age":18,"frontEndAttrs":{"attr1":"...","attr2":"..."}}
````
上面的代码用构造函数改写下：
````js
// 依然假设这是从服务端获取的数据
const obj = {
    code: 1,
    data: {
        name: '张三',
        age: 18,
        xx1: '...',
        xx2: '...',
        xx3: '...'
    }
}

function UserInfoConstructor (data) {
    // 此处可以 clone data，保护原始数据不被修改。本示例未做克隆
    this.data = data
}

UserInfoConstructor.prototype.addFrontEndAttrs = function (frontEndAttrs) {
    this.data.frontEndAttrs = this.data.frontEndAttrs || {}
    Object.assign(this.data.frontEndAttrs, frontEndAttrs)
}

UserInfoConstructor.prototype.deleteKeys = function (keys) {
    keys.forEach((item) => {
        delete this.data[item]
    })
}

UserInfoConstructor.prototype.getData = function (keys) {
    return this.data
}

const { data } = obj 
const uesrInfoInstance = new UserInfoConstructor(data)

// 删除指定的属性
 uesrInfoInstance.deleteKeys(['xx1', 'xx2', 'xx3'])
// 新增一些前端属性
 uesrInfoInstance.addFrontEndAttrs({ attr1: '...', attr2: '...' })
// 获取处理后的data
const userInfoData = uesrInfoInstance.getData()

console.log(JSON.stringify(userInfoData)) // {"name":"张三","age":18,"frontEndAttrs":{"attr1":"...","attr2":"..."}}
````
比较两种方式:
- 函数返回对象：显然常规业务处理数据，直接用函数操作数据，简洁方便。  
- 构造函数显的笨重。不过,构造函数这里的优势在于:
    - 隔离数据，把数据先变成实例内的私有数据，实现了隔离，处理起来更有信心。
    - 便于封装，抽离逻辑。供今后复用。  
