#!/bin/bash

while :
do

echo `ps -aux | grep spigot | grep -v grep | awk '{print $3}'`
sleep 1

done

