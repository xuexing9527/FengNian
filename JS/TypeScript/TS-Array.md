# TypeScript Array写法

### 普通js写数组
```javascript
const arr = []
```
### ts写数组
#### 普通数组：
```TS
// 数组 - 装的都是 number 类型元素的 数组，长度任意
const arr:number[] = []
// 元组 - 装的是 只有一个元素，这个元素是 number 类型元素的 数组
const arr:[number] = []
// 元组 - 装的是 只有2个元素，第一个元素是 number 类型，第二个元素是 string 类型的数组
const arr:[number, string] = []
```
#### 带对象的数组
```TS
// ** interface 定义类型，强调结构，注意没有 “=” 号
interface PersonInterface {
    name: string,
    age: number
}

// ** type 定义 类型 别名，注意 type 定义中有 “=” 号，type Xx = ...，type 定义更灵活，强调别名
type PersonType = {
    name: string,
    age: number
}

type PersonT = PersonInterface
interface P = PersonInterface

const arr1: PersonType[] = [{ name: 'zs', age: 18, salary: 9999 }]
const arr2: PersonInterface[] = [{ name: 'zs', age: 18, salary: 9999  }]
const arr3: (PersonInterface & { age: number }) [] = [{ name: 'zs', age: 18 }]
// Partial 可选
const arr4: Partial<PersonInterface>[] = [{ name: 'xx' }, {}]

```


较真：如果想要声明 100 个元素的元组，难道要写100个 string 或者 number 类型吗？该如何实现？
```

```