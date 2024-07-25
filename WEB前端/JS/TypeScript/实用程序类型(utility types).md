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