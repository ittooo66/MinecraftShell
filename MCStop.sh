#!/bin/bash

#設定読み込み
. /sf/shells/MCConf.sh

#Monitor停止用ファイル作成
touch ${MC_SHELL}/${MC_NOCHK}

#停止通知
screen -p 0 -S ${SCREEN_NAME} -X eval 'stuff "say 10秒後にサーバーを停止します\015"'
sleep 10

#サーバ停止
screen -p 0 -S ${SCREEN_NAME} -X eval 'stuff "stop\015"'

#サーバの停止が完了するまで待つ
while [ -n "$(screen -list | grep -o "${SCREEN_NAME}")" ]
do
  sleep 1
done
