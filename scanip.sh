#!/bin/bash

IP=`nmap -sn 192.168.219.0/24 | sed -nE 's/.+mini.+\((.+)\)/\1/p'`
if [ $IP = "" ]; then echo failed 
else ssh -X zeta@${IP}
fi
