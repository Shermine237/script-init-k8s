#!/bin/bash

if [ $# -eq 1 ]; then
	modprobe dummy;
	ip link add $1 type dummy && ifconfig $1 hw ether C8:D7:4A:4E:47:50\
		&& ip addr add 192.168.100.100/16 brd + dev $1 label $1:0\
		&& ip link set dev $1 up\
		&& echo "$1 created";
	exit 0
fi
