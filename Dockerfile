# Используем базовый образ с установленным Node.js
FROM node:latest

# Устанавливаем необходимые зависимости
RUN apt-get update && apt-get install -y git

# Устанавливаем рабочую директорию
WORKDIR /app

# Инициализируем новый репозиторий Git
RUN git init

# Добавляем удаленный репозиторий
RUN git remote add origin https://github.com/Ladvik/fitn.git

# Получаем последние изменения из репозитория
RUN git fetch

# Сбрасываем рабочую директорию и индекс на последний коммит из origin/master
RUN git reset --hard origin/main

# Копируем скрипт проверки и обновления версии
COPY check_update.sh /app/check_update.sh

# Запускаем скрипт при запуске контейнера
CMD ["sh", "/app/check_update.sh"]

