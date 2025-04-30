# 关于单页应用的 carsh 兜底

## ErrorBoundary

ErrorBoundary 只能捕获渲染过程中的错误
- 事件处理函数中的错误
- 异步代码（如 setTimeout、fetch）
- 服务端渲染（SSR）中的错误

window.onerror & window.onunhandledrejection
可以捕获运行时 JavaScript 错误，包括异步错误：

```js
window.onerror = function (message, source, lineno, colno, error) {
  console.error("Uncaught error:", { message, source, lineno, colno, error });
};

window.onunhandledrejection = function (event) {
  console.error("Unhandled Promise Rejection:", event.reason);
};
```

##  保证 SPA 可恢复