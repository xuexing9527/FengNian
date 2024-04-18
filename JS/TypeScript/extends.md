# extends
- 注意 extends 是继承而不是等于的陷阱

````TS
interface User {
    name: string;
    id: number;
}
function aboutExtends <T extends User>(u: T): T {
    // 报错信息：
    // Type '{ id: number; name: string; }' is not assignable to type 'T'.
    // '{ id: number; name: string; }' is assignable to the constraint of type 'T', but 'T' could be instantiated with a different subtype of constraint 'User'.
    return {
        id: u.id,
        name: '张三'
    }
}
````

传送门：
https://www.typescriptlang.org/play?#code/JYOwLgpgTgZghgYwgAgKoGdrIN4ChnLAAmAXMiAK4C2ARtANz7lxURnphSgDmjAvrhgUQCMMAD2IZHBriKYAKIAPSCCLpkAHgAqyCCohqNGaAD4AFBTLaAlNZxMoEMBShS8BAsTIUAdMQAaJgIQFjZkAHJAAn1ASDkIpgE+ZCA

这里就是错把 extends 疏忽成了等于了  
fix方法：

````TS
interface User {
    name: string;
    id: number;
}
function aboutExtends <T extends User>(u: T): T {
    // 报错信息：
    // Type '{ id: number; name: string; }' is not assignable to type 'T'.
    // '{ id: number; name: string; }' is assignable to the constraint of type 'T', but 'T' could be instantiated with a different subtype of constraint 'User'.
    return {
        // 这里添加 ...u
        ...u,
        id: u.id,
        name: '张三'
    }
}
````

### 解答：  
- 原因：返回的 T 泛型 extends User，一定包含 name 和 id 字段，但还有 T 自己的字段，所以参数 u 的属性 >= User接口类型的属性。只返回 id， name 两个属性，是错误的  
- fix：将 u 的其它属性，结构到返回值，才是继承 User 类型后 T 类型的全部属性
