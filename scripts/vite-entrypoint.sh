#!/bin/sh
echo "YOYOYO"
set -e
echo -n "${APP_URL}:5173" > public/hot

echo "--- Successfully created public/hot file with content: $(cat public/hot) ---"
echo $(cat public/hot)
echo $(cat public/hot)

exec npm run dev