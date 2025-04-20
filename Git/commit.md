# commit

## commit 指定时间
GIT_COMMITTER_DATE="2024-04-19 23:34:56" git commit --date="2024-04-19 23:34:56" -m "docs"


## 修改已经提交的 commit 日期
git rebase -i HEAD~2

```
pick d4e5f6g 添加功能
pick a1b2c3d 修复 bug
```

将你要改的那一行 pick 改成 edit：

```
edit d4e5f6g 添加功能
pick a1b2c3d 修复 bug
```
保存并退出。

设置新的提交日期
git commit --amend --no-edit --date="xxxx-xx-xx xx:00:00"

继续 rebase：

```
继续 rebase：
```

然后推送（如果之前已经推送过远程，需要强制推送）：

git push --force


