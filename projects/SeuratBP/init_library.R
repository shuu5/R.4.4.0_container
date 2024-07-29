# renvをactivate
renv::restore()

# BPCells をインストール
remotes::install_github("bnprks/BPCells/r")

# 環境を保存
renv::snapshot()