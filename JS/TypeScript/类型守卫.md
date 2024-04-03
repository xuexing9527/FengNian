# 类型守卫
类型守卫没有查到官方文档的介绍，两个相关名词
- Type Guard 类型守卫
- Type Predicates 类型谓语

```TS
function showTypeGuardAndTypePredicates (someone: Person | Teacher) {
    // 这里访问 someone 的 subject 属性会编译报错，因为 subject 属性不同时存在两个类型中。那我们想要用 subject 怎么办呢？就需要类型守卫
    // This place to visite someone's subject attribute will be Throw error, cause subject attribute is not in each types. So how can we do if we want subject attribute? We need Type Guard. 
    console.log(someone.subject)

    // Teacher Type Guard
    function isTeacherTypeGurad (p: Person | Teacher): p is Teacher {
        return (p as Teacher).subject !== undefined
    }

    // visite someone.subject
    if (isTeacherTypeGurad(someone)) {
        console.log(someone.subject)
    }
}
```

- 什么是 Type Predicate 类型谓语 ?  
    - 上述示例 类型守卫( Type Guard )，isTeacherTypeGuard 中，函数返回值类型 p is Teacher 就是类型谓语  
    - 思考：p is Teacher 应该是个 boolean 值，函数返回值应该是个类型，这里写了语句，还是返回 Boolean 值的语句。简单查询，并没有找到官方关于类型谓语的讲解，推断 TypeScript 在借鉴某种语言的写法。GPT回答 java，C# 有类似的写法。
    - 再思考：
        - TS编译器，如何去判断遇到的是类型谓语( Type Predicate )还是类型( Type )呢？
        - 为什么类型谓语( Type Predicate )会以语句的形式出现，造成一定的歧义呢？是借鉴了某种语言？还是杂生的混合体呢？
        - Type Predicate 都用在那些地方，只是用来类型守卫(Type Guard)时用吗？