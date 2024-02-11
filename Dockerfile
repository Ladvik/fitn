# Используем базовый образ с установленным Node.js
FROM node:latest

# Устанавливаем необходимые зависимости
RUN apt-get update && apt-get install -y git

# Устанавливаем рабочую директорию
WORKDIR /app

# Клонируем репозиторий с проектом
RUN git clone https://github.com/Ladvik/fitn.git .

# Копируем скрипт проверки и обновления версии
COPY check_update.sh /app/check_update.sh

# Запускаем скрипт при запуске контейнера
CMD ["sh", "/app/check_update.sh"]

