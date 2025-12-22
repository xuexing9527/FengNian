# nvm 如何管理 node 版本
## 概念
NVM 全称 Node.js Version Manager，用于管理 Node.js 版本的工具。
## nvm 做了什么？

### 1. 目录结构与文件隔离（核心基石）
nvm 会在用户根目录（~/.nvm）建立严格的目录隔离体系，这是它能实现多版本无冲突的核心：

```
~/.nvm/
├── versions/          # 所有 Node 版本的核心存储目录（隔离核心）
│   ├── node/
│   │   ├── v16.20.2/  # 每个版本独立目录，包含完整的 Node 运行时
│   │   ├── v18.19.1/
│   │   └── v20.11.1/
│   └── npm/           # 不同 Node 版本对应的 npm 版本隔离（自动关联）
├── alias/             # 版本别名配置（default/system 等）
├── nvm.sh             # 核心 Shell 脚本（环境变量劫持逻辑）
└── settings.txt       # 全局配置（如 node_mirror、npm_mirror 等）
```

- 每个 Node 版本目录下包含完整的独立运行时：bin/node、bin/npm、lib/node_modules 等，完全不共享任何文件；
- 全局 npm 包也按版本隔离：~/.nvm/versions/node/v18.19.1/lib/node_modules 仅属于该版本，避免不同版本全局包冲突（这是手动切换版本做不到的）

### 2. 环境变量劫持（版本切换的核心逻辑）
nvm 并非修改系统级的 Node 软链接，而是在 Shell 会话层面劫持 PATH 环境变量，这是它支持 “终端级版本隔离” 的关键：

1. 当执行 nvm use <version> 时，nvm 会：
- 从 ~/.nvm/versions/node/<version>/bin 中读取该版本的 Node/npm 可执行文件路径；
- 将该路径插入到 PATH 环境变量的最前端（优先级最高），覆盖系统原有 Node 路径；
- 同时重置 NODE_PATH、NPM_CONFIG_PREFIX 等核心环境变量，指向当前版本的目录。

2. 终端会话隔离：每个终端窗口的 PATH 是独立的，因此你可以在终端 A 用 v16、终端 B 用 v20，完全不冲突（这是 n/fnm 等工具部分场景下做不到的）；
无侵入性：退出 nvm 环境（nvm deactivate）后，PATH 会恢复为系统原始状态，不会污染全局环境。

### 3. Shell 钩子与自动加载（无缝体验的核心）
nvm 会通过修改 Shell 配置文件（~/.bashrc/~/.zshrc/~/.profile）注入核心钩子：

``` bash
# 自动加载 nvm 核心脚本（每次终端启动执行）
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# 可选：自动切换项目 Node 版本（基于 .nvmrc）
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
```
- 钩子作用：无需手动执行 source ~/.nvm/nvm.sh，终端启动时自动加载 nvm 环境；

- 补全机制：bash_completion 提供命令补全（如 nvm use v 按 Tab 自动补全版本号），提升开发效率。

### 4. 版本下载与校验（稳定性保障）
nvm 并非简单下载 Node 二进制包，而是：
- 从 Node 官方镜像（或自定义镜像）拉取对应平台（darwin-x64/arm64、linux-x64 等）的二进制包；
- 验证 SHA256 哈希值（避免包篡改或下载损坏）；
- 自动解压并建立目录结构，同时关联对应版本的 npm（Node 内置 npm 版本与 Node 版本强绑定）。

### 什么是环境变量
