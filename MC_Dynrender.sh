#!/bin/bash

# 設定読み込み
. /sf/shells/MC_Conf.sh

# =====Dynmap レンダリングシェル=====
# 1.レンダリングを実行
# =================================

# Render開始
screen -p 0 -S ${SCREEN_NAME} -X eval 'stuff "dynmap fullrender world\015"'
