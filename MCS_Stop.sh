#!/bin/bash

# 設定読み込み
. /sf/scripts/Server_Config.sh

# =====Minecraft停止シェル=====
#  1. nochkファイルの作成
#  2. 停止する旨をサーバに通知
#  3. サーバ停止
#  4. サーバの停止を確認
# ============================

# nochkファイルの作成
touch ${MCS_SCRIPTS}/${MCS_NOCHK}

# 停止する旨をサーバに通知
screen -p 0 -S ${MCS_SCREEN_NAME} -X eval 'stuff "say 10秒後にサーバーを停止します\015"'
sleep 10

# サーバ停止
screen -p 0 -S ${MCS_SCREEN_NAME} -X eval 'stuff "stop\015"'

# サーバの停止を確認
while [ -n "$(screen -list | grep -o "${MCS_SCREEN_NAME}")" ]
do
  sleep 1
done

# サーバ停止完了通知
${MCS_SCRIPTS}/Server_SendMessageToDiscord.sh -i "サーバの停止を完了しました"
