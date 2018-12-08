#!/bin/bash

# 設定読み込み
. /sf/shells/MC_Conf.sh

# =====Minecraft起動シェル=====
#  1. nochkファイルの削除
#  2. tmpfsが空の場合（サーバ再起動後）はリストア
#  3. サーバ起動
#  4. 起動完了のメッセージを送信
# ============================

# nochkファイルの削除
if [[ ! -z ${MC_SHELL} && ! -z ${MC_NOCHK} ]] ; then
  rm -f ${MC_SHELL}/${MC_NOCHK}
fi

# tmpfsが空の場合（サーバ再起動後）はリストア
if [[ ! -d  ${MC_HOME} ]] ; then
  ${MC_SHELL}/MC_Restore.sh
fi

# サーバ起動
cd ${MC_HOME}
screen -AmdS ${SCREEN_NAME} java -Xms8G -Xmx8G -jar ${MC_JAR}

# サーバ起動完了通知
${MC_SHELL}/MC_SendMessageToDiscord.sh -i "サーバの起動を完了しました"
