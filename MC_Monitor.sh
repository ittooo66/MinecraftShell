#!/bin/bash

# 設定読み込み
. /sf/shells/MC_Conf.sh

# =====Minecraft監視シェル=====
#  1. nochkファイルが存在していればプロセス監視を終了
#  2. プロセス存在確認
#  3. プロセスがない場合、サーバの起動(MC_Start.sh)
#
# ※cron登録有:分おき実行
# ============================

# nochkファイルが存在していればプロセス監視を終了
if [ -e ${MC_SHELL}/${MC_NOCHK} ]; then
  exit 0
fi

# プロセス存在確認
MC_PROC_CHECK=`ps -ef | grep ${MC_PROC_NAME} | grep -v grep`

# プロセスがない場合、サーバの起動(MC_Start.sh)
if [[ -z ${MC_PROC_CHECK} ]] ; then
  # プロセスが存在しない場合
  ${MC_SHELL}/MC_SendMessageToDiscord.sh -w "Minecraftが未起動のため、これより起動します"
  sh ${MC_SHELL}/MC_Start.sh
else
  echo server is active
fi
