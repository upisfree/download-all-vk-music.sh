#!/bin/bash
# Зависимости: jq (https://github.com/stedolan/jq/)

# смотрим аргументы
LINKS=$1

DIR=$(pwd)
if [ -n "$2" ]
then
  DIR=$2
fi

# начинаем
json=$(cat $1)
count=$(cat $1 | jq '.response.count') # $json?

for (( i = 0; i < $count; i++ ))
do
  artist=$(cat $1 | jq ".response.items[$i].artist" | cut -c 2- | rev | cut -c 2- | rev) # берём файл, вычленяем нужное поле, режем первую кавычку (первый символ), режем вторую кавычку (второй символ)
  title=$(cat $1 | jq ".response.items[$i].title" | cut -c 2- | rev | cut -c 2- | rev)
  url=$(cat $1 | jq ".response.items[$i].url" | cut -c 2- | rev | cut -c 2- | rev)

  wget $url -O "$DIR/$artist — $title" # -P $DIR не работает, так как использую -O
  
  info=$(($i + 1))
  echo "Загрузил $artist — $title! Это $info из $count"
done