# 不同仓库配置各自 git 账号 - app1 仓库用 git账号 user1 维护，app2 仓库用 git 账号 user2 维护
- 有说 SSH key 的，有些绕。尝试梳理总结直观一些的  

## 遇到的问题：
- 配置过 global，如： `git config --global user.name "xx"`，再配置单个仓库 user.name 和 user.email 的时候，仍然是用的 global 配置的信息。**（2025年1月24日 09点32分评：此问题发生时，应该是操作失误导致的，local 确实会覆盖 global 配置，是生效的）**
    - 如果是 global 信息优先级大于私有仓库的定制配置信息，那么设计初衷是什么？不应该是私有的覆盖全局的，才是更合理的方式吗？
    - 肯定不想因为单个仓库的不同账号配置，轻易去更改全局的配置，如何优雅的处理这个情况？

## 关于 git 配置
Git 配置的优先级是从 低到高 的，具体规则如下：

- 系统级配置（system）：这是 Git 安装时的默认配置，一般存储在 Git 安装目录下的配置文件中。它影响所有用户和所有仓库。  
配置文件路径：/etc/gitconfig

- 用户级配置（global）：这是与用户相关的配置，通常存储在当前用户的主目录下。所有该用户创建的 Git 仓库都将继承这些配置。  
配置文件路径：~/.gitconfig 或 ~/.config/git/config

- 仓库级配置（local）：这是特定项目（仓库）级别的配置，它只会影响当前仓库。通常存储在 Git 仓库的 .git/config 文件中。  
配置文件路径：<repository>/.git/config

## 单个项目配置问题
在仓库根目录执行&nbsp;&nbsp;`git config user.email "xx"`&nbsp;&nbsp;，不加 `--global` 即可

