#!/bin/bash

#設定読み込み
. /sf/shells/MC_Conf.sh

while :
do

CPUPER=`ps -aux | grep ${MC_PROC_NAME} | grep -v grep | grep -v SCREEN | awk '{print $3}'`
echo `date` CPU使用率 ${CPUPER}% >> ${MC_LOGDIR}/cpu.log
sleep 10

done

