#!/bin/bash

OUT="/tmp/V2ray-sub/sub.txt"

IP="104.21.75.193"
DOMAIN="d.danialshakib.ir"
PORT="443"
PATH_X="/assets/css/v4/main"

rm -f "$OUT"

add_user () {

UUID=$1
NAME=$2

echo "vless://$UUID@$IP:$PORT?encryption=none&security=tls&type=xhttp&host=$DOMAIN&path=$PATH_X&sni=$DOMAIN&alpn=h2&fp=chrome#$NAME" >> "$OUT"

}

add_user "ea58684d-a6e0-4947-8954-8835516db533" "danial"
add_user "28f14230-41bf-4b0b-ad02-03fa3c884981" "danesh"
add_user "b9fc1dc8-db21-4d85-a264-55600ed80841" "neda"
add_user "157cc75a-7aa4-42e3-b03c-e99364ae2ee7" "mohsen"
add_user "6445f91f-b618-422e-b8ca-dad0bbddf56f" "maede"

echo "Subscription generated"
