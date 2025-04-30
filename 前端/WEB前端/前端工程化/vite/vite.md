# vite

## 开发模式与生产模式
- 开发模式基于 esbuild，速度快
- 生产模式基于 rollup

## AMD、CMD 混用问题
Vite 生产模式使用 rollup，默认输出 ESM（foramt: 'es'）。如果项目中有 旧版 AMD、CMD 模块（如 RequireJs、SeaJs），会导致打包问题。

## import
ES Modules (ESM) 语法的一部分，与 AMD、CMD、CJS 无关。
- 由 ECMAScript 官方规范定义（ES2015+）
- 浏览器和 Node.js 原生支持
- 静态分析（import 语句不能放在 if 语句中）
- 支持 Tree Shaking

## require
CommonJs (CJS)

## define
AMD、CMD
