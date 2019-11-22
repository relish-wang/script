# git相关自用脚本


- 1 删除所有tag

```shell
for tagName in `git tag`
do
    echo "delete tag:$tagName"
    git tag -d $tagName
    git push origin :refs/tags/${tagName}
done
```

- 2 自定义git命令
1 配置自己喜欢的git log样式
```shell
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
```
2 使用
```shell
git lg
```

- 3 全局设置git账号
```shell
git config --global user.name "relish-wang"
git config --global user.email "relish.wang@gmail.com"
```