#!/bin/bash
warp-cli connect
ip1=$(curl -s ifconfig.me)
if [ -n "ip1" ]
then
	echo "Warp is connected. IP is : " $ip1
else
	echo "warp is not Connected"
	exit 1
fi
openvpn --config /home/kali/Downloads/omarredaammar.ovpn
ip2=$(curl -s ifconfig.me)
if [ -n "$ip2" ]
then
	echo "Open Vpn is connected. IP is : " $ip2
else
	echo "Open Vpn is not connected"
	exit 1
fi
ping -c 3 10.10.10.10
echo"Pinging is Done"
warp-cli disconnect
echo "Warp is disconnected"
