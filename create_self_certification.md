$ openssl genrsa 2048 > server.key

$ openssl req -new -key server.key > server.csr

$ cat v3.ext 
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:TRUE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
subjectAltName = @alt_names

[alt_names]
IP.1=192.168.1.159
IP.2=127.0.0.1

$ openssl x509 -req -in server.csr -signkey server.key -out server.crt -days 3650 -extfile v3.ext
