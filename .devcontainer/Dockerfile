FROM rocker/rstudio:4.4.1

# 必要なlinux パッケージをインストール(インストールするRパッケージごとに修正が必要)
RUN apt-get update \
  && apt-get install -y --no-install-recommends \
    libxt-dev \
    fonts-ipaexfont \
    libhdf5-dev \
    libglpk40 \
  && apt-get clean

# RStudio の Global Options 設定
COPY --chown=rstudio:rstudio \
  .devcontainer/.config/rstudio/rstudio-prefs.json \
  /home/rstudio/.config/rstudio/rstudio-prefs.json

# renv のパッケージキャッシュを作成
RUN mkdir -p /home/rstudio/.local/share/renv/cache \
  && chown -R rstudio:rstudio /home/rstudio

# renv をインストール
RUN R -e 'install.packages("renv")'