# directive
## 指令语法图
![指令语法图](./img/image.png)

## 函数式风格
``` js
bind('click', handleClick, { stop: true, prevent: true });
```
## 路径式命名
```html
<div @on:click.stop.prevent="handleClick"></div>
```
## 指令的前世今生
### jQuery 时代
### AngularJS 指令

## 对象写法和路径式命名的取舍
## 规范度高点的项目，是否考虑弱化指令，是否考虑 JSX？
如果希望指令规范可读，考虑写成参数对象形式

写成参数对象形式，则牺牲了指令的简洁写法

还有既然写成对象形式的指令，是不是不如直接上 JSX
## Vue3 拥抱 hooks 的情况下，会不会弱化指令？