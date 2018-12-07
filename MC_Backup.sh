#!/bin/bash

# 設定読み込み
. /sf/shells/MC_Conf.sh

# =====Minecraftバックアップシェル=====
#  1. tarアーカイブの実施
# ===================================

# tarアーカイブの実施
cd /
tar cvfz ${MC_BACKUP}/`date +%Y_%m%d_%H%M`.tar.gz .${MC_HOME}
