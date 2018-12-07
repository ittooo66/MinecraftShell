#!/bin/bash

# 設定値のロード
. /sf/shells/MC_Conf.sh

# $1を送信
curl -s -X POST -H 'Content-Type: application/json' -d '{"content": "'$1'"}' ${MC_WEBHOOK}
