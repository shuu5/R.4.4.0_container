FROM ubuntu:22.04

# タイムゾーンの設定を非対話的に行う
ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Tokyo

# 日本語ロケールの設定
RUN apt-get update && apt-get install -y locales
RUN locale-gen ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8

# パッケージリストを更新し、必要なパッケージをインストール
RUN apt-get update && apt-get install -y \
    software-properties-common \
    dirmngr \
    gnupg \
    wget \
    git \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    sudo \
    gdebi-core \
    fonts-ipafont \
    libfontconfig1-dev \
    libfreetype6-dev \
    pkg-config

# RのGPGキーを追加
RUN wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc

# CRANリポジトリを追加
RUN apt-get update && apt-get install -y software-properties-common
RUN add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"

# R 4.4.1をインストール
RUN apt-get update && apt-get install -y r-base=4.4.1* r-base-dev=4.4.1*

# Rのバージョンを確認
RUN R --version

# renvをインストール
RUN R -e "install.packages('renv', repos='https://cloud.r-project.org')"

# RStudio Serverをインストール
RUN wget https://download2.rstudio.org/server/jammy/amd64/rstudio-server-2023.06.0-421-amd64.deb && \
    gdebi -n rstudio-server-2023.06.0-421-amd64.deb && \
    rm rstudio-server-2023.06.0-421-amd64.deb

# vscodeユーザーを作成
RUN useradd -m vscode \
    && echo "vscode ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/vscode \
    && chmod 0440 /etc/sudoers.d/vscode

# vscodeユーザーのパスワードを設定（RStudio Serverログイン用）
RUN echo "vscode:password" | chpasswd

# 作業ディレクトリを設定
WORKDIR /workspace

# renvの設定
ENV RENV_PATHS_CACHE="/renv/cache"
RUN mkdir -p ${RENV_PATHS_CACHE} && chown vscode:vscode ${RENV_PATHS_CACHE}

# entrypointスクリプトを追加
COPY ../entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# entrypointを設定
ENTRYPOINT ["/entrypoint.sh"]

# デフォルトのコマンドをbashに設定
CMD ["/bin/bash"]
