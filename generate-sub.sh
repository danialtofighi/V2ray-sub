#!/bin/bash

OUT="/tmp/V2ray-sub/sub"
TMP="/tmp/V2ray-sub/sub.tmp"

IP=$(dig d.danialshakib.ir A +short | head -1)
DOMAIN="d.danialshakib.ir"
PORT="443"
PATH_X="/assets/css/v4/main"

ECH=$(grep 'echConfigList' /tmp/V2ray-sub/config.json | sed 's/.*echConfigList": "\(.*\)".*/\1/')

# URL encode ECH
ECH_ENCODED=$(python3 -c "import urllib.parse; print(urllib.parse.quote('''$ECH'''))")

rm -f "$TMP"

add_user () {

UUID=$1
NAME=$2

echo "vless://$UUID@$IP:$PORT?encryption=none&security=tls&type=xhttp&host=$DOMAIN&path=$PATH_X&sni=$DOMAIN&alpn=h2&fp=chrome&echConfigList=$ECH_ENCODED#$NAME" >> "$TMP"

}

add_user "ea58684d-a6e0-4947-8954-8835516db533" "danial"
add_user "28f14230-41bf-4b0b-ad02-03fa3c884981" "danesh"
add_user "b9fc1dc8-db21-4d85-a264-55600ed80841" "neda"
add_user "157cc75a-7aa4-42e3-b03c-e99364ae2ee7" "mohsen"
add_user "6445f91f-b618-422e-b8ca-dad0bbddf56f" "maede"

base64 -w 0 "$TMP" > "$OUT"

rm -f "$TMP"

echo "Subscription generated"
