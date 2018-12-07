#!/bin/bash

# 設定読み込み
. /sf/shells/MC_Conf.sh

# =====Minecraftリストアシェル=====
#  1. 直近のtar.gzファイルパスを取得
#  2. ルートからtar展開
# ================================

# 直近のtar.gzファイルパスを取得
FILENAME=`ls -t ${MC_BACKUP} | grep ".tar.gz" | head -n 1`

# ルートからtar展開
cd /
tar xvf ${MC_BACKUP}/${FILENAME}
