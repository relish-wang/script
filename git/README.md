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

