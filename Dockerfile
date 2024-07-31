# Используем официальный образ Java
FROM openjdk:11-jdk-slim

# Устанавливаем необходимые пакеты
RUN apt-get update && apt-get install -y git

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем локальные файлы проекта в контейнер
COPY src /app/src

# Указываем команду для генерации документации
RUN javadoc -d /app/docs -sourcepath /app/src -subpackages ru.gb.jcore

# Указываем рабочую директорию для документации
VOLUME /app/docs

# Определяем команду по умолчанию для контейнера
CMD ["sh", "-c", "echo 'Documentation generated in /app/docs' && tail -f /dev/null"]
