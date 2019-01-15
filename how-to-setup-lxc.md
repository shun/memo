# for http
sudo iptables -t nat -A PREROUTING -m tcp -p tcp --dst host_ipv4 --dport 10080 -j DNAT --to-destination container_ipv4:80

# for ssh
sudo iptables -t nat -A PREROUTING -m tcp -p tcp --dst host_ipv4 --dport 10022 -j DNAT --to-destination container_ipv4:22

# set proxy for lxc
lxc config set core.proxy_http http://localhost:3128  
lxc config set core.proxy_https http://localhost:3128

# set port forwarding
lxc config device add 'container name' 'device name' proxy listen=tcp:0.0.0.0:'host port' connect=tcp:localhost:'container port'

# Trouble shooting

* if fail to start docker container

```
lxc launch ubuntu:x mydockers -c security.nesting=true
```
```
lxc config set mydockers security.nesting true
lxc restart mydockers
```

* if missing unix socket file for lxd

```
# search lxd or lxc package by dpkg command  
dpkg -l | egrep 'lxd|lxc'

# remove package by dpkg command, you might purge the package
dpkg -r lxd
dpkg -P lxd
```
