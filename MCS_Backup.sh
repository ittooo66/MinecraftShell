#!/bin/bash

# 設定読み込み
. /sf/scripts/Server_Config.sh

# =====Minecraftバックアップシェル=====
#  1. tarアーカイブの実施
# ===================================

# tarアーカイブの実施
cd /
tar cvfz ${MCS_BACKUP}/`date +%Y_%m%d_%H%M`.tar.gz .${MCS_HOME}

# バックアップ完了報告
${MCS_SCRIPTS}/Server_SendMessageToDiscord.sh  -i "Minecraftのバックアップを完了しました"
