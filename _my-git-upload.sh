#!/usr/bin/env bash
# git add . > /dev/null && git commit -m "$(date +"%Y-%m-%d %H:%M:%S")" > /dev/null && git push origin master -q > /dev/null
# git submodule foreach 'git add . > /dev/null && git commit -am "$(date +"%Y-%m-%d %H:%M:%S")" > /dev/null'
git add . > /dev/null
git commit -m "$(date +"%Y-%m-%d %H:%M:%S")" > /dev/null
git push origin master
