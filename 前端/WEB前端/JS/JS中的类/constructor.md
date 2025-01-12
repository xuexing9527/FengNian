## JavaScript中的constructor(构造函数)

### 阅读前提：
- 熟悉`ES6，JavaScript`

### 文章相关知识：
- `JavaScript`中的`constructor`，`constructor`中的`super`
- `JavaScript`中的类(`class`)，构造函数

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
【注：这里构造函数写法以理解为主，不拘细节。比如：严格模式，类方法是否可枚举等...】
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
1. 构造函数，`AConstructorFunction`首字母大写了（不强制，首小写一样用，只是便于阅读。看到首字母大写的函数，可能是个构造函数）
2. 调用构造函数使用了`new`关键字。函数`AConstructorFunction`没有返回值，所以不直接调用`AConstructorFunction()`，直接调用返回`undefined`。（*提问1：那么为什么不直接`return`个`object`呢？又是`this`，又是`new`的，想干啥？*）

小伙伴们应该知道，`js`中`class`写法只是构造函数加原型继承方式来生产对象的一种语法糖。所谓语法糖，通俗解释就是代码原理不变，换种即好写，又好看的写法。所以：
- `js`中`class`创建的对象，本质上等同于构造函数创建的对象，都是以原型继承的方式实现
- `class`中的`constructor`就是构造函数，用来构造对象的初始化状态
- `class`中的方法，就是在构造函数的原型链(`prototype`)上添加方法

我们再来看一个偏向`class`的写法（示例4）：
````js
class people {
    constructor ({ name, age, gender}) {
        this.name = name
        this.age = age
        this.gender = gender
    }
    codeing () {
        console.log(`${this.name}在编程...`)
    }
}
const xiaoHua = new people({ name: '小花', age: 18, gender: '女' })
xiaoHua.codeing() // 控制台输出：小花在编程...
````
我们进行改写，人分男人女人，且不是都会编程，所以（示例5）：
````js
// 基类，包含名字，年轻，性别: People
class People {
    constructor ({ name, age, gender}) {
        this.name = name
        this.age = age
        this.gender = gender
    }
}

// 女性
class Female extends People {
    constructor({ name, age }) {
        // 因为是女性，这里加了性别参数：gender: female
        super({ name, age, gender: 'female' })
    }
}

// 女程序员
// 因为是女程序员，直接继承女性，并添加codeing技能
class FemaleCoder extends Female {
    // 添加codeing技能
    codeing () {
        console.log(`女程序员${this.name}在编程...`)
    }
}

const femaleCoder = new FemaleCoder({ name: '小花', age: 18 })
console.log(femaleCoder)
femaleCoder.codeing()
````
这种情况下，`class`的写法，比构造函数版本更清晰，比工厂函数精于继承。  
这里回答示例3提示中的提问1，一顿`new`，`this`的原因：
- 不需要`new`，`this`，直接返回对象的函数，一般称为工厂函数。工厂函数生产的对象灵活度高，常见于处理比较灵活且不需要继承属性的业务数据。我们处理完数据，直接`return`一个`Object`（结果）即可。  
- 对于需要继承和封装的场景，抽象化出来类，更易于拓展，这个时候就需要`new`和`this`来构造一类对象。比如`People`这个类，也可以用于描述动物，或者任何包含姓名，年龄，性别的生物，便于继承。这样在js中实现了面向对象的编程范式(`OOP`)。 

示例5中`Female`类中出现了`super`关键字，`super`用于调用父类的`constructor`方法。  
### 关于`constructor`中`super`的主要用途：  
- 在`constructor`中调用父类的`constructor`方法。所以只能用于派生类，（也就是有父类的类）。
- 在当前类的方法中调用其父类的方法   
在看一个例子（示例6）:
````js
// 基类，包含名字，年轻，性别: People
class People {
    constructor ({ name, age, gender}) {
        this.name = name
        this.age = age
        this.gender = gender
    }
    walk () {
        console.log('走路...')
    }
}

// 女性
// 继承People，添加性别，添加购物goShopping方法
class Female extends People {
    constructor({ name, age }) {
        super({ name, age, gender: 'female' })
    }

    goShopping () {
        // goShopping需要走路，可以直接调用基类People中的walk方法
        super.walk()
        console.log('在商场购物...')
    }

}

const female = new Female({ name: '小花', age: 18 })
female.goShopping()
// 输出：
// 走路...
// 在商场购物...
````
`constructor`中`super`的注意事项：  
- 必须在使用`this`之前调用`super`