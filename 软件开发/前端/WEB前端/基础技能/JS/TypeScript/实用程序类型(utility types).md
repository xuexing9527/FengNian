# 实用程序类型
## Record
定义对象类型的语法糖，避免冗长的索引签名写法
``` typescript
 const type User = { [key: string]: any }
```
等价于：
``` typescript
 const type User = Record<string, any>
```
## Partial
我们只需要部分属性的时候，可以使用 Partical  
``` typescript
interface AllAttrObject {
    attr1: string;
    attr2: string;
    // ...
    attrN: number;
}
// 我们只需要 AllAttrObject 部分属性
const type Sample = Partical<AllAttrObject>

// 或者
const obj: Partical<AllAttrObject> = { attr1: '只取 AllAttrObject 一个属性' }

// 原理
type Partical<T> = { [K in keyof T]?: T[K] | undefined; }
```