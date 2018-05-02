#!/bin/bash

#設定ファイル読み込み
. ./MCConf.sh

#nochkファイルがあれば監視しない
if [ -e ${MC_SHELL}/${MC_NOCHK} ]; then
  exit 0
fi

#Minecraftプロセスの存在確認
MC_PROC_CHECK=`ps -ef | grep spigot | grep -v grep`

#Minecraftプロセスが存在しない場合、起動する
if [[ -z ${MC_PROC_CHECK} ]] ; then
  echo "PROCESS_DOWN"
  cd ${MC_HOME}
  screen -AmdS ${SCREEN_NAME} java -Xms8G -Xmx8G -jar ${MC_JAR}
else
  echo "PROCESS_ALIVE"
fi
