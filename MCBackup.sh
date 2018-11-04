#!/bin/bash

#設定読み込み
. /sf/shells/MCConf.sh

#バックアップの実施
cp -rp ${MC_HOME} ${MC_BACKUP}/`date +%Y_%m%d_%H%M`
