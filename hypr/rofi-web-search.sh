#!/usr/bin/env bash

# -----------------------------------------------------------------------------
# Info:
#   author:    Miroslav Vidovic
#   file:      web-search.sh
#   created:   24.02.2017.-08:59:54
#   revision:  ---
#   version:   1.0
# -----------------------------------------------------------------------------
# Requirements:
#   rofi
# Description:
#   Use rofi to search the web.
# Usage:
#   web-search.sh
# -----------------------------------------------------------------------------
# Script:

declare -A URLS

URLS=(
  ["farside"]="https://farside.link/whoogle/search?q="
  ["youtube"]="https://www.youtube.com/results?search_query="
  ["duckduckgo"]="https://www.duckduckgo.com/?q="
  ["imdb"]="http://www.imdb.com/find?ref_=nv_sr_fn&q="
  ["google"]="https://www.google.com/search?q="
  ["github"]="https://github.com/search?q="
  ["seslisözlük"]="https://www.seslisozluk.net/"
  ["wikipedia (en)"]="https://en.wikipedia.org/w/index.php?search="
  ["wikipedia (tr)"]="https://tr.wikipedia.org/w/index.php?search="
  ["youtube music"]="https://music.youtube.com/search?q="
  ["chordify"]="https://chordify.net/search/"
  ["ultimate guitar tab"]="https://www.ultimate-guitar.com/search.php?search_type=title&value="
)

# List for rofi
gen_list() {
    for i in "${!URLS[@]}"
    do
      echo "$i"
    done
}

main() {
  # Pass the list to rofi
  platform=$( (gen_list) | rofi -dmenu -matching fuzzy -no-custom -location 0 -p "Search > " )

  if [[ -n "$platform" ]]; then
    query=$( (echo ) | rofi  -dmenu -matching fuzzy -location 0 -p "Query > " )

    if [[ -n "$query" ]]; then
      url=${URLS[$platform]}$query
      xdg-open "$url"
    else
      exit
    fi

  else
    exit
  fi
}

main

exit 0
