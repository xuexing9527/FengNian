# CSS 样式隔离方案

- CSS Modules

- CSS in JS  
库支持（主流 CSS-in-JS 库）
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
- Shadow DOM

- Scoped CSS（Vue 特性）

- BEM（Block Element Modifier）命名规范

- Atomic CSS  
如 Tailwind CSS

