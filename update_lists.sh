#!/bin/sh
# Скрипт для обновления списков Zapret — форсированная перезапись в /opt/zapret/ipset

BASE_DIR="/opt/zapret/ipset"

mkdir -p "$BASE_DIR"

# Список файлов и их URL на GitHub
FILES="cust1.txt"
BASE_URL="https://raw.githubusercontent.com/elagor1996/Zapret-list-txt/main"

for FILE in $FILES; do
    echo "Обновляем $FILE..."
    wget -q -O "$BASE_DIR/$FILE" "$BASE_URL/$FILE"
    if [ $? -eq 0 ]; then
        echo "$FILE успешно обновлён."
    else
        echo "Ошибка при загрузке $FILE."
    fi
done

echo "Все списки обновлены."
