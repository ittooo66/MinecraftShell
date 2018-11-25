#!/bin/bash

#設定読み込み
. /sf/shells/MCConf.sh

#直近のtar.gzファイルを取得
FILENAME=`ls -t ${MC_BACKUP} | grep ".tar.gz" | head -n 1`

cd /
tar xvf ${MC_BACKUP}/${FILENAME}
