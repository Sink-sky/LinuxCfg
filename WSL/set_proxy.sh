#!/bin/bash
host_ip=$(cat /etc/resolv.conf | grep "nameserver" | cut -f 2 -d " " | head -1)
export ALL_PROXY="http://$host_ip:10808"
