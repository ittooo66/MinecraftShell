#!/bin/bash

#設定ファイル読み込み
. /sf/shells/MC_Conf.sh

#再起動通知
screen -p 0 -S ${SCREEN_NAME} -X eval 'stuff "say 30秒後にサーバーを再起動します\015"'
screen -p 0 -S ${SCREEN_NAME} -X eval 'stuff "say すぐに再接続可能になるので、しばらくお待ち下さい\015"'
sleep 30

#Minecraft停止
sh ${MC_SHELL}/MC_Stop.sh

#バックアップの実施
sh ${MC_SHELL}/MC_Backup.sh

#Minecraft起動
sh ${MC_SHELL}/MC_Start.sh
