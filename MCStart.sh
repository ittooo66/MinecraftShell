#!/bin/bash

#設定読み込み
. /sf/shells/MCConf.sh

#Monitor停止用ファイル削除
if [[ ! -z ${MC_SHELL} && ! -z ${MC_NOCHK} ]] ; then
  rm -f ${MC_SHELL}/${MC_NOCHK}
fi

#tmpfs初期化時は直近のtar.gzからリストア
if [[ ! -d  ${MC_HOME} ]] ; then
  ${MC_SHELL}/MCRestore.sh
fi

#Minecraft起動
cd ${MC_HOME}
screen -AmdS ${SCREEN_NAME} java -Xms8G -Xmx8G -jar ${MC_JAR}
