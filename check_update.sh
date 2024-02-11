#!/bin/bash

# Переходим в директорию проекта
cd /app

# Получаем последний коммит из репозитория
latest_commit=$(git ls-remote https://github.com/Ladvik/fitn.git HEAD | awk '{print $1}')



# Получаем текущий коммит проекта
current_commit=$(git rev-parse HEAD)

# Сравниваем коммиты
if [ "$latest_commit" != "$current_commit" ]; then
    echo "Версия не актуальна. Обновляем проект..."
    git pull origin main
fi

# Запускаем сервер для проекта на HTML
# Здесь вы можете использовать команду для запуска вашего сервера, например:
# npm start
