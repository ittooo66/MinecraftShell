#!/bin/bash

# 設定読み込み
. /sf/shells/MC_Conf.sh

# =====メッセージ送信シェル=====
#  オプションに応じてメッセージをDiscordに送信する。オプションは以下。
#  -i : INFOメッセージを送信
#  -w : WARNメッセージを送信
#  -e : ERRORメッセージを送信
#  利用例：sh ${MC_SHELL}/SendMessageToDiscord.sh -i "プロセスの起動を完了しました"
# =====================================

while getopts e:w:i: OPT
do
    case $OPT in
        "e" ) curl -s -X POST -H 'Content-Type: application/json' -d '{"content": "'"$OPTARG"'"}' ${WEBHOOK_ERROR} ;;
        "w" ) curl -s -X POST -H 'Content-Type: application/json' -d '{"content": "'"$OPTARG"'"}' ${WEBHOOK_WARN} ;;
        "i" ) curl -s -X POST -H 'Content-Type: application/json' -d '{"content": "'"$OPTARG"'"}' ${WEBHOOK_INFO} ;;
    esac
done
