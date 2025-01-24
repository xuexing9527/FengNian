# 不同仓库配置各自 git 账号 - app1 仓库用 git账号 user1 维护，app2 仓库用 git 账号 user2 维护
- 有说 SSH key 的，有些绕。尝试梳理总结直观一些的  

#### 遇到的问题：
- 配置过 global，如： `git config --global user.name "xx"`，再配置单个仓库 user.name 和 user.email 的时候，仍然是用的 global 配置的信息。
    - 如果是 global 信息优先级大于私有仓库的定制配置信息，那么设计初衷是什么？不应该是私有的覆盖全局的，才是更合理的方式吗？
    - 肯定不想因为单个仓库的不同账号配置，轻易去更改全局的配置，如何优雅的处理这个情况？

- 单个项目配置
    `git config user.email "xx"`