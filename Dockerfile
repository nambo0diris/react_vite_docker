# Используем Node.js в качестве базового образа для сборки React приложения
FROM node:alpine as build-stage

# Устанавливаем рабочую директорию в контейнере
WORKDIR /app

# Копируем файлы package.json и package-lock.json для установки зависимостей
COPY package*.json /app/

# Устанавливаем зависимости
RUN npm install --force

# Копируем все файлы проекта в контейнер
COPY . /app/

# Собираем React приложение для production
RUN npm run build

# Создаем новый образ для production
FROM nginx:1.21

# Копируем собранные файлы React приложения из предыдущего образа
COPY --from=build-stage /app/dist/ /usr/share/nginx/html

# Открываем порт 80, чтобы Nginx мог обрабатывать входящие запросы
EXPOSE 80

# Команда CMD запускает Nginx сервер при старте контейнера
CMD ["nginx", "-g", "daemon off;"]