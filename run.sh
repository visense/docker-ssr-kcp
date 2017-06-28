#!/bin/sh
cd /root/shadowsocksr-manyuser/shadowsocks
sed -i 's/'8388/"${ssrport}"'/g' user-config.json
sed -i 's/'pass1234/"${pass}"'/g' user-config.json
sed -i 's/'auth_aes128_md5/"${protocol}"'/g' user-config.json
sed -i 's/'aes-128-ctr/"${method}"'/g' user-config.json
sed -i 's/'tls1.2_ticket_auth/"${obfs}"'/g' user-config.json
python server.py -d start
kcptunserver -t "127.0.0.1:${ssrport}" -l ":${kcpport}" -mode fast2
