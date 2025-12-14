# electron
## 脚手架
Electron + React（Vite）

目录结构：
```
your-project/
├─ electron/            # Electron 主进程
│  ├─ main.ts
│  ├─ preload.ts
│  └─ tsconfig.json
├─ src/                 # React 渲染进程
│  ├─ App.tsx
│  ├─ main.tsx
│  └─ components/
├─ index.html
├─ package.json
└─ vite.config.ts
```

Electron 只负责“壳”（窗口、透明、置顶、快捷键）

React 负责“一切界面和逻辑”