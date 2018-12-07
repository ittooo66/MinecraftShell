#!/bin/bash

# 設定読み込み
. /sf/shells/MC_Conf.sh

# バックアップの実施
cd /
tar cvfz ${MC_BACKUP}/`date +%Y_%m%d_%H%M`.tar.gz .${MC_HOME}

# バックアップ完了通知
