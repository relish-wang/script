#!/usr/bin/env bash

for tagName in `git tag`
do
    echo "delete tag:$tagName"
    git tag -d $tagName
    git push origin :refs/tags/${tagName}
done