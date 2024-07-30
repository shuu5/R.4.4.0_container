# githubから直接ダウンロードする必要があるものは個別に設定
renv::install("remotes")
remotes::install_github("bnprks/BPCells/r")
remotes::install_github("mojaveazure/seurat-disk")

renv::restore()