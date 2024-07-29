# declare

declare 用来告诉 TS，某些类型是“已经”存在，并不是由我们来声明实现的。经典使用场景如，声明全局变量、引入外部库或模块。

用途：
- 用于集成外部库。第三方引入的 js 文件。  
    因为外部库，实现了一些方法或工具类，这些方法或工具类并不是由我们来声明，而是直接来用。此时用 declare。比如引入 jQuary，可以这么写：  
    `declare const $: JQueryStatic;`
- 全局声明


参考链接：
https://github.com/wangdoc/typescript-tutorial/blob/main/docs/declare.md