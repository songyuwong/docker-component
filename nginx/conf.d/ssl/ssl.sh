#1. 生成一个自定义的CA机构，生成证书
  #C-----国家（Country Name）
  #ST----省份（State or Province Name）
  #L----城市（Locality Name）
  #O----公司（Organization Name）
  #OU----部门（Organizational Unit Name）
  #CN----产品名（Common Name）
  #emailAddress----邮箱（Email Address
openssl req -x509 -sha256 -days 35600 -nodes -newkey rsa:2048 -subj  "/CN=JHDCP/C=CN/L=Beijing/O=Goodwill Information Technology Co.,Ltd." -keyout rootCA.key -out rootCA.crt -subj "/CN=JHDCP/C=CN/L=Beijing/O=Goodwill Information Technology Co.,Ltd."

#2. 创建服务器私钥
openssl genrsa -out server.key 2048

#3. 使用服务器私钥生成证书签名请求 (CSR)
openssl req -new -key server.key -out server.csr -config csr.conf

#4. 使用自签名 CA 生成 SSL 证书
openssl x509 -req -in server.csr -CA rootCA.crt -CAkey rootCA.key -CAcreateserial -out server.crt -days 36500 -sha256 -extfile cert.conf

#cert.conf 用来生成根证书(server.crt)的配置
#csr.conf 用来生成向CA机构提申请的文件(server.csr)的配置
#rootCA.crt 生成的自定义CA机构的拥有的证书
#rootCA.key 生成的自定义CA机构的拥有的密钥
#rootCA.srl
#server.crt 服务器证书
#server.csr 证书签名请求 (CSR)，包含自己需要申请的服务器证书的配置信息
#server.key 服务器私钥，用来生成(server.csr),想CA申请 服务器证书
