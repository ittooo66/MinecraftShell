#!/bin/bash

# 設定読み込み
. /sf/scripts/Server_Config.sh

# =====Minecraft再起動シェル=====
#  1. サーバに再起動を周知
#  2. サーバ停止(MC_Stop.sh)
#  3. サーバのバックアップ(MC_Backup.sh)
#  4. サーバの起動(MC_Start.sh)
#
# ※cron登録有：日時実行
# ==============================

# サーバに再起動を周知
screen -p 0 -S ${MCS_SCREEN_NAME} -X eval 'stuff "say 30秒後にサーバーを再起動します\015"'
screen -p 0 -S ${MCS_SCREEN_NAME} -X eval 'stuff "say すぐに再接続可能になるので、しばらくお待ち下さい\015"'
sleep 30

# サーバ停止
${MCS_SCRIPTS}/MCS_Stop.sh
# サーバのバックアップ
${MCS_SCRIPTS}/MCS_Backup.sh
# サーバの起動
${MCS_SCRIPTS}/MCS_Start.sh
