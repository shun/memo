# for http
sudo iptables -t nat -A PREROUTING -m tcp -p tcp --dst host_ipv4 --dport 10080 -j DNAT --to-destination container_ipv4:80

# for ssh
sudo iptables -t nat -A PREROUTING -m tcp -p tcp --dst host_ipv4 --dport 10022 -j DNAT --to-destination container_ipv4:22
