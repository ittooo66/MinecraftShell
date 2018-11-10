#!/bin/bash

#設定ファイル読み込み
. /sf/shells/MCConf.sh

#nochkファイルがあれば監視しない
if [ -e ${MC_SHELL}/${MC_NOCHK} ]; then
  exit 0
fi

#Minecraftプロセスの存在確認
MC_PROC_CHECK=`ps -ef | grep ${MC_PROC_NAME} | grep -v grep`

#Minecraftプロセスが存在しない場合、起動する
if [[ -z ${MC_PROC_CHECK} ]] ; then
  echo "minecraft server is down. : starting server..."
  sh ${MC_SHELL}/MCStart.sh
else
  echo "minecraft server is alive."
fi
