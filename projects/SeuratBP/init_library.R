# リポジトリを明示的に設定
options(repos = c(CRAN = "https://cloud.r-project.org/"))

# renv をインストール
install.packages("renv")

# remotes をインストール
install.packages("remotes")

# BPCells をインストール
remotes::install_github("bnprks/BPCells/r")
