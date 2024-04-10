# 定义类型用“逗号”还是“分号”
- 逗号是为了兼容 js 语法，一般应为分号。逗号分号指的是 interface 内，各属性间的分隔。如下面示例中，string 和 number 后的 ";"。TS中替换成 ',' 也不报错。
```TS
    interface demoType {
        demoAttrs: string;
        demoAttrs2: number;
    }
```