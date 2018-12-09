#!/bin/bash

# 設定読み込み
. /sf/scripts/Server_Config.sh

# =====Minecraft起動シェル=====
#  1. nochkファイルの削除
#  2. tmpfsが空の場合（サーバ再起動後）はリストア
#  3. サーバ起動
#  4. 起動完了のメッセージを送信
# ============================

# nochkファイルの削除
if [[ ! -z ${MCS_SCRIPTS} && ! -z ${MCS_NOCHK} ]] ; then
  rm -f ${MCS_SCRIPTS}/${MCS_NOCHK}
fi

# tmpfsが空の場合（サーバ再起動後）はリストア
if [[ ! -d  ${MCS_HOME} ]] ; then
  ${MCS_SCRIPTS}/MCS_Restore.sh
fi

# サーバ起動
cd ${MCS_HOME}
screen -AmdS ${MCS_SCREEN_NAME} java -Xms8G -Xmx8G -jar ${MCS_JAR}

# サーバ起動完了通知
${MCS_SCRIPTS}/Server_SendMessageToDiscord.sh -i "サーバの起動を完了しました"
