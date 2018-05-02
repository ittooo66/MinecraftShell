#!/bin/bash

#設定ファイル読み込み
. /MinecraftServer/shells/MCConf.sh

#停止通知
screen -p 0 -S ${SCREEN_NAME} -X eval 'stuff "say 3秒後にサーバーを停止します\015"'
sleep 3

#Monitor停止用ファイル作成
touch ${MC_SHELL}/${MC_NOCHK}

#サーバ停止
screen -p 0 -S ${SCREEN_NAME} -X eval 'stuff "stop\015"'
