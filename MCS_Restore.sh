#!/bin/bash

# 設定読み込み
. /sf/scripts/Server_Config.sh

# =====Minecraftリストアシェル=====
#  1. 直近のtar.gzファイルパスを取得
#  2. ルートからtar展開
# ================================

# 直近のtar.gzファイルパスを取得
filename=`ls -t ${MCS_BACKUP} | grep ".tar.gz" | head -n 1`

# ルートからtar展開
cd /
tar xvf ${MCS_BACKUP}/$filename

# Restore完了通知
${MCS_SCRIPTS}/Server_SendMessageToDiscord.sh -i "サーバのリストアを完了しました"
