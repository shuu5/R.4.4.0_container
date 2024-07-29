options(repos = c(CRAN = "https://cloud.r-project.org"))
install.packages("renv")

renv::init()

renv::install("tidyverse")

# BPCells をインストール
install.packages("/home/rstudio/.local/share/renv/cache/bnprks-BPCells-v0.2.0-20-gb78bc83.tar.gz")