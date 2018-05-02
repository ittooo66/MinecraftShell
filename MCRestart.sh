#!/bin/bash

#設定ファイル読み込み
. ./MCConf.sh

#再起動通知
screen -p 0 -S ${SCREEN_NAME} -X eval 'stuff "say 30秒後にサーバーを再起動します\015"'
screen -p 0 -S ${SCREEN_NAME} -X eval 'stuff "say すぐに再接続可能になるので、しばらくお待ち下さい\015"'
sleep 30

#Monitor停止用ファイル作成
touch ${MC_SHELL}/${MC_NOCHK}

#サーバ停止
screen -p 0 -S ${SCREEN_NAME} -X eval 'stuff "stop\015"'

#サーバの停止が完了するまで待つ
while [ -n "$(screen -list | grep -o "${SCREEN_NAME}")" ]
do
  sleep 1
done

#バックアップの実施
cp -rp ${MC_HOME} ${MC_BACKUP}/`date +%Y_%m%d_%H%M`

#Monito停止用ファイルの削除
if [ ! -z ${MC_SHELL} && ! -z ${MC_NOCHK}] ; then
  rm -f ${MC_SHELL}/${MC_NOCHK}
fi

#Monitor開始
sh ${MC_SHELL}/MCMonitor.sh
