#!/bin/bash

# 設定読み込み
. /sf/shells/MCConf.sh

#バックアップの実施
cd /
tar cvfz ${MC_BACKUP}/`date +%Y_%m%d_%H%M`.tar.gz .${MC_HOME}
