#!/bin/bash

# делаем бэкап базы данных в папку проекта
sudo mysqldump -u`head -1 mysql.txt | tail -1` -p`head -2 mysql.txt | tail -1` `head -1 mysql.txt | tail -1` > `head -1 mysql.txt | tail -1`.sql

# декодируем базу в нормальную кодировку
sudo grep -rl utf8mb4 `head -1 mysql.txt | tail -1`.sql | xargs perl -p -i -e 's/utf8mb4/utf8/g'

# меняем права и владельца на конечный файл
sudo chown sergey:sergey -R `head -1 mysql.txt | tail -1`.sql
sudo chmod -R 644 `head -1 mysql.txt | tail -1`.sql

# добавляем изменения в git
git add --ignore-removal .
git commit -a -m "$(date +"%Y-%m-%d %H:%M")"
git push origin master
