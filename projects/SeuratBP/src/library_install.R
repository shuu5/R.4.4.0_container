renv::init()

renv::install("tidyverse")
renv::snapshot()
library(tidyverse)

renv::install("Seurat")
renv::snapshot()
library(Seurat)

remotes::install_github("bnprks/BPCells/r")
renv::snapshot()
library(BPCells)
