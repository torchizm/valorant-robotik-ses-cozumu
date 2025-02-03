#!/bin/bash

print_usage() {
  echo "Usage: $0 --ip <ip> --sifre <sifre>"
  echo "  --ip               : Sunucunuzun ip adresi (gerekli)"
  echo "  --sifre            : Arayüz şifresi (gerekli)"
}

if [[ $# -eq 0 ]]; then
  print_usage
  exit 1
fi

while [[ $# -gt 0 ]]; do
  case $1 in
  --ip)
    if [[ -n $2 ]]; then
      ip=$2
      shift 2
    else
      echo "Hata: --ip parametresinden sonra ip adresiniz gereklidir"
      print_usage
      exit 1
    fi
    ;;
  --sifre)
    if [[ -n $2 ]]; then
      password=$2
      shift 2
    else
      echo "Hata: --sifre parametresinden sonra şifreniz gereklidir"
      print_usage
      exit 1
    fi
    ;;
  --yardim)
    print_usage
    exit 0
    ;;
  *)
    echo "Error: Unknown parameter: $1"
    print_usage
    exit 1
    ;;
  esac
done

if [[ -z $ip ]]; then
    echo "Hata: IP adresi boş olamaz, --ip <ip> adresi şeklinde parametre ekleyiniz"
    exit 1
fi

if [[ -z $password ]]; then
    echo "Hata: Şifre boş olamaz, --sifre <sifre> şeklinde parametre ekleyiniz"
    exit 1
fi

apt update
apt upgrade -y

apt install apt-transport-https ca-certificates curl software-properties-common jq -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

apt update
apt-cache policy docker-ce

apt install docker-ce -y

hashed_output=$(curl --request POST \
     --data "password=$password&cost=10" \
     https://www.toptal.com/developers/bcrypt/api/generate-hash.json | jq -r .hash)

CONTAINERS=$(docker ps -a --filter "ancestor=ghcr.io/wg-easy/wg-easy" --format "{{.ID}}")
if [ ! -z "$CONTAINERS" ]; then
  for CONTAINER_ID in $CONTAINERS; do
    echo "Removing container ID: $CONTAINER_ID"
    docker rm -f "$CONTAINER_ID"
  done
  echo "Tüm WireGuard kurulumları kaldırıldı"
fi

docker run --detach \
  --name wg-easy \
  --env LANG=en \
  --env WG_HOST=$ip \
  --env PASSWORD_HASH=$hashed_password \
  --env PORT=51821 \
  --env WG_PORT=51820 \
  --volume ~/.wg-easy:/etc/wireguard \
  --publish 51820:51820/udp \
  --publish 51821:51821/tcp \
  --cap-add NET_ADMIN \
  --cap-add SYS_MODULE \
  --sysctl 'net.ipv4.conf.all.src_valid_mark=1' \
  --sysctl 'net.ipv4.ip_forward=1' \
  --restart unless-stopped \
  ghcr.io/wg-easy/wg-easy
