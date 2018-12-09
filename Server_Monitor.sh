#!/bin/bash

# 設定ファイル読み込み
. /sf/scripts/Server_Config.sh

# サーバプロセスの存在確認
PROC_CHECK=`ps -ef | grep Server_Monitor.py | grep -v grep`

# プロセスが存在しない場合、起動する
if [[ -z ${PROC_CHECK} ]] ; then
  ${MCS_SCRIPTS}/Server_SendMessageToDiscord.sh -w "サーバBOTが未起動のため、これより起動します"
  python3.5 ${MCS_SCRIPTS}/Server_Monitor.py &
fi
