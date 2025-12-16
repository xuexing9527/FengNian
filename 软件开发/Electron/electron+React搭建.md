# electron + React 项目搭建
## 脚手架
### Electron + React（Vite）

#### 简介
- Electron 只负责“壳”（窗口、透明、置顶、快捷键）

- React 负责“一切界面和逻辑”

- 目录结构：

```bash
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

#### 步骤
1. 创建项目
```bash
# 创建一个 electron-vite 项目
npm create electron-vite
```

2. 选择
```bash
# 填写你的项目名
✔ Project name: your project name
# 选择一个框架
✔ Select a framework: react
...
```

3. 进目录
```bash
# 进目录
cd your project path
# 安装依赖
npm install
```

4. 启动
```bash
npm run dev
```