#!/usr/bin/env bash

# Список папок, которые ДОЛЖНЫ лежать в .config
CONFIG_APPS=("scripts" "opencode" "systemd")

for app in "${CONFIG_APPS[@]}"; do
    if [ -d "$app" ]; then
        # Если папка .config внутри еще не создана
        if [ ! -d "$app/.config" ]; then
            echo "Processing $app..."
            
            # Создаем временную папку, чтобы не запутаться в путях
            mkdir -p "temp_shuttle/$app"
            
            # Перемещаем содержимое текущей папки во вложенную структуру
            # Например: kitty/* -> temp_shuttle/kitty/.config/kitty/*
            mkdir -p "temp_shuttle/$app/.config/$app"
            mv "$app"/* "temp_shuttle/$app/.config/$app/" 2>/dev/null
            
            # Возвращаем все обратно в корень репозитория
            rm -rf "$app"
            mv "temp_shuttle/$app" .
            echo "Done: $app is now stow-ready"
        fi
    fi
done

# Удаляем временную папку
rm -rf temp_shuttle
