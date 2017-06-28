FROM ubuntu:16.04
MAINTAINER endokai
ENV pass endokai
ENV ssrport 8080
ENV kcpport 1000
ENV obfs  tls1.2_ticket_auth
ENV method  aes-128-ctr
ENV protocol auth_aes128_md5
ADD https://github.com/shadowsocksr/shadowsocksr/archive/manyuser.zip /root/manyuser.zip
ADD https://github.com/xtaci/kcptun/releases/download/v20170525/kcptun-linux-amd64-20170525.tar.gz /root/kcptun.tar.gz
ADD user-config.json /root/user-config.json
ADD run.sh /usr/sbin/run.sh
EXPOSE 8080
RUN set -ex \
   && cd /root \
   && apt update && apt install zip python -y \
   && unzip /root/manyuser.zip && cd /root/shadowsocksr-manyuser/shadowsocks \
   && cp /root/user-config.json /root/shadowsocksr-manyuser/shadowsocks/user-config.json \
   && tar -zxvf /root/kcptun.tar.gz && cp server_linux_amd64 /usr/sbin/kcptunserver \
   && chmod +x /usr/sbin/run.sh && chmod +x /usr/sbin/kcptunserver
ENTRYPOINT ["run.sh"]
