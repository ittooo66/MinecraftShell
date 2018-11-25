#!/bin/bash

#設定ファイル読み込み
. /sf/shells/MCConf.sh

#Render開始
screen -p 0 -S ${SCREEN_NAME} -X eval 'stuff "dynmap fullrender world\015"'
