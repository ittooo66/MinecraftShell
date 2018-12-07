#!/bin/bash

#設定読み込み
. /sf/shells/MC_Conf.sh

#Monitor停止用ファイル削除
if [[ ! -z ${MC_SHELL} && ! -z ${MC_NOCHK} ]] ; then
  rm -f ${MC_SHELL}/${MC_NOCHK}
fi

#tmpfs初期化時は直近のtar.gzからリストア
if [[ ! -d  ${MC_HOME} ]] ; then
  ${MC_SHELL}/MC_Restore.sh
fi

#Minecraft起動
cd ${MC_HOME}
screen -AmdS ${SCREEN_NAME} java -Xms8G -Xmx8G -jar ${MC_JAR}

#起動完了MSG送信
MSG=$(date '+%Y-%m-%d-%H:%M:%S')"_[INFO]_MinecraftServer_started"
${MC_SHELL}/MC_SendMessageToDiscord.sh "${MSG}"
