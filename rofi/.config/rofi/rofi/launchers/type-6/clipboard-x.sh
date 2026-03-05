#!/usr/bin/env bash

## Путь к теме оформления
dir="$HOME/.config/rofi/launchers/type-6"
theme='style-11'

## Команда для отображения истории буфера обмена
cliphist list | rofi -dmenu -theme ${dir}/${theme}.rasi -p "Clipboard History" | cliphist decode | xclip -selection clipboard
