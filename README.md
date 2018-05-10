docker run --name  ssr-kcp  -itd --net=host -e pass=xiang w796933/ssr-kcp-xiang


kcptun 参数填  加密方式 AES  模式 FAST2 启用压缩，不禁用。 密码填空
# docker-ssr-kcp
Docker ShadowsocksR with kcptun server
## default variable：
ssrport : 8080 <br>
kcpport : 1000 <br>
password : endokai <br>
method : aes-128-ctr <br>
protocol : auth_aes128_md5 <br>
obfs : tls1.2_ticket_auth_compatible <br>



docker run -itd --name=kcp --restart=always -p 8855:8855 --privileged  w796933/ssr-kcp-raw
