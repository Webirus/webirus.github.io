#!/bin/bash
# добавляем изменения в git
git add --ignore-removal .
git commit -a -m "$(date +"%Y-%m-%d %H:%M")"
git push origin master
