# TypeScript Array写法

普通js写数组
```
const arr = []
```
ts写数组
```
// 数组 - 装的都是 number 类型元素的 数组，长度任意
const arr:number[] = []
// 元组 - 装的是 只有一个元素，这个元素是 number 类型元素的 数组
const arr:[number] = []
// 元组 - 装的是 只有2个元素，第一个元素是 number 类型，第二个元素是 string 类型的数组
const arr:[number, string] = []
```

较真：如果想要声明 100 个元素的元组，难道要写100个 string 或者 number 类型吗？该如何实现？
```

```