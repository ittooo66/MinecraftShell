#!/bin/bash

# 設定読み込み
. /sf/shells/MC_Conf.sh

# =====Minecraftメッセージ送信シェル=====
#  1. $1をメッセージとしてDiscordに送信
# =====================================

# $1をメッセージとしてDiscordに送信
curl -s -X POST -H 'Content-Type: application/json' -d '{"content": "'$1'"}' ${MC_WEBHOOK}
