#!/bin/bash

# 設定読み込み
. /sf/shells/MC_Conf.sh

# =====CPU使用率監視シェル=====
#  1. 10秒おきにCPU使用率をログ出力
# ============================

while :
do

# 10秒おきにCPU使用率をログ出力
CPUPER=`ps -aux | grep ${MC_PROC_NAME} | grep -v grep | grep -v SCREEN | awk '{print $3}'`
echo `date` CPU使用率 ${CPUPER}% >> ${MC_LOGDIR}/cpu.log
sleep 10

done

