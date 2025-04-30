# CSS 样式隔离方案

## BEM（Block Element Modifier）命名规范  
BEM 是一种命名约定，用于保证样式的模块化和可重用性。通过特定的命名规则，避免全局样式冲突，确保不同组件样式的作用范围清晰。

## Atomic CSS (原子CSS)
2012 年，由 Jonathan Snook 提出，Tailwind CSS 于 2017 年发布并广泛流行。  
原子 CSS 是一种理念，每个类表示一种具体的样式（如字体大小、颜色、间距等），通过组合这些类来完成组件的样式。Tailwind CSS 是目前最流行的原子 CSS 框架。

- Tailwind CSS

优点：开发效率高（直接写 CSS 类组合，高效）
缺点：灵活性较差

## Shadow DOM

- CSS Module
```css
/* styles.module.css */
.title { color: red; }
```
``` js
import styles from "./styles.module.css";
<h1 className={styles.title}>Hello</h1>
```

构建(build)后 `.title` 可能变成 `.title_xh23cs`，避免全局污染。

缺点：JS 中管理 CSS 样式，相对不够直观

## CSS in JS  
2015 年，Styled Components 和 Emotion 开始流行  
主流 CSS-in-JS 库：
- Styled Components  
    基于模板字符串，允许编写直观的 CSS 样式。
    ```
    import styled from 'styled-components';

    const Button = styled.button`
    background: red;
    color: white;
    font-size: 16px;
    `;
    ```
- Emotion

其他:
- Scoped CSS（Vue 特性）
