# 定义类型用“逗号”还是“分号”
- 个人推测，逗号应该是为了兼容 js 语法，一般应为分号。逗号分号指的是 interface 内，各属性间的分隔。如下面示例中，string 和 number 后的 ";"。TS中替换成 ',' 也不报错。
```TS
    interface demoType {
        demoAttrs: string;
        demoAttrs2: number;
    }
```
思考这个问题是因为写逗号分隔，不报错。但是理解起来有些不伦不类。比如写逗号分隔属性，理解成了对象分隔属性。就会觉得里面不能写语句。比如