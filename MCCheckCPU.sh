#!/bin/bash

#設定読み込み
. /sf/shells/MCConf.sh

while :
do

CPUPER=`ps -aux | grep forge | grep -v grep | grep -v SCREEN | awk '{print $3}'`
echo `date` CPU使用率 ${CPUPER}% >> ${MC_LOGDIR}/cpu.log
sleep 10

done

