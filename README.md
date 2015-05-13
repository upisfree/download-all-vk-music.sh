# download-all-vk-music.sh
Маленькая программа для скачивания ВСЕХ песен из [ВК](https://vk.com).

## Что внутри?
* Скачивание
* Песни с одинаковым названием классно качаются, друг друга не мочат

## И засмеялся так неприятно...
...json с песнями придётся достать самому. Эта программа была написана за вечер и она слишком проста, в отличии от [версии на CoffeeScript](https://github.com/upisfree/download-all-vk-music.coffee.git), которая сама брала песни из API и, которая не запускается из-за отвалившегося **taglib**.

### Где достать json с песнями?
Есть несколько способов, самый простой: через [API ВК](https://vk.com/dev/audio.get), но если у тебя больше 5 000 песен, тебя ждёт сюрприз: страница грузит не более 5 000 песен. Можно загрузить первые 5 000 штук, взять json, поставить отступ, загрузить остальные, json объединить.
А можно и через [версию на CoffeeScript](https://github.com/upisfree/download-all-vk-music.coffee.git), там где-нибудь вывести скачанный список, но в первом варианте всё будет без зависимостей, а тут **node.js** тянуть надо.

## Как поставить?
```bash
# Ставим jq
wget http://stedolan.github.io/jq/download/linux32/jq (для 32-ух битных систем)
wget http://stedolan.github.io/jq/download/linux64/jq (для 64-ух битных систем)
chmod +x ./jq
sudo cp jq /usr/bin

# Ставим скачивальщик
git clone https://github.com/upisfree/download-all-vk-music.sh.git
./download.sh
