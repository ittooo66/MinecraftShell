#!/bin/bash

# 設定読み込み
. /sf/scripts/Server_Config.sh

# =====Minecraft監視シェル=====
#  1. nochkファイルが存在していればプロセス監視を終了
#  2. プロセス存在確認
#  3. プロセスがない場合、サーバの起動(MC_Start.sh)
#
# ※cron登録有:分おき実行
# ============================

# nochkファイルが存在していればプロセス監視を終了
if [ -e ${MCS_SCRIPTS}/${MCS_NOCHK} ]; then
  exit 0
fi

# プロセス存在確認
MCS_PROC_CHECK=`ps -ef | grep ${MCS_PROC_NAME} | grep -v grep`

# プロセスがない場合、サーバの起動(MC_Start.sh)
if [[ -z ${MCS_PROC_CHECK} ]] ; then
  # プロセスが存在しない場合
  ${MCS_SCRIPTS}/Server_SendMessageToDiscord.sh -w "Minecraftが未起動のため、これより起動します"
  ${MCS_SCRIPTS}/MCS_Start.sh
else
  echo server is active
fi
