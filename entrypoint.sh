#cd /v2raybin
#echo -e "$CONFIG_JSON" > config.json
#if [ "$CERT_PEM" != "$KEY_PEM" ]; then
#  echo -e "$CERT_PEM" > cert.pem
#  echo -e "$KEY_PEM"  > key.pem
#fi

cd /ct
wget -O http://github.com/jpillora/cloud-torrent/releases/download/$VER/cloud-torrent_linux_amd64.gz

unzip v2ray.zip 
if [ ! -f "v2ray" ]; then
  mv /v2ray/v2ray-v$VER-linux-64/v2ray .
  mv /v2ray/v2ray-v$VER-linux-64/v2ctl .
  mv /v2ray/v2ray-v$VER-linux-64/geoip.dat .
  mv /v2ray/v2ray-v$VER-linux-64/geosite.dat .
fi

cp -f /config.json .
chmod +x v2ray v2ctl
sed -i "s/your_uuid/$UUID/g" config.json
./v2ray
