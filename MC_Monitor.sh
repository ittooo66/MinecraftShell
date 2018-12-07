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

# nochkファイルがあれば監視しない
if [ -e ${MC_SHELL}/${MC_NOCHK} ]; then
  exit 0
fi

# Minecraftプロセスの存在確認
MC_PROC_CHECK=`ps -ef | grep ${MC_PROC_NAME} | grep -v grep`

# Minecraftプロセスが存在しない場合、起動する
if [[ -z ${MC_PROC_CHECK} ]] ; then
  echo "minecraft server is down. : starting server..."
  sh ${MC_SHELL}/MC_Start.sh
else
  echo "minecraft server is alive."
fi
