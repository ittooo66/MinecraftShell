#!/bin/bash

#設定ファイル読み込み
. ./MCConf.sh

#Monito停止用ファイルの削除
if [[ ! -z ${MC_SHELL} && ! -z ${MC_NOCHK} ]] ; then
  rm -f ${MC_SHELL}/${MC_NOCHK}
fi

#Monitor開始
sh ${MC_SHELL}/MCMonitor.sh
