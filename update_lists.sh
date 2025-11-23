#!/bin/sh

# Папка для списков
LIST_DIR="/opt/zapret/ipset"

# Список файлов и URL-ов для обновления
FILES="
cust1.txt https://raw.githubusercontent.com/username/repo/main/cust1.txt
cust2.txt https://raw.githubusercontent.com/username/repo/main/cust2.txt
zapret-hosts-google.txt https://raw.githubusercontent.com/username/repo/main/zapret-hosts-google.txt
zapret-hosts-user.txt https://raw.githubusercontent.com/username/repo/main/zapret-hosts-user.txt
zapret-ip-user.txt https://raw.githubusercontent.com/username/repo/main/zapret-ip-user.txt
"

for entry in $FILES; do
    FILENAME=$(echo $entry | awk '{print $1}')
    URL=$(echo $entry | awk '{print $2}')
    echo "Обновляем $FILENAME ..."
    wget -O "$LIST_DIR/$FILENAME" "$URL"
done

echo "Все файлы обновлены!"
