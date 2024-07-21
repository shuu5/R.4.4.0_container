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
    pkg-config \
    libharfbuzz-dev \
    libfribidi-dev \
    libpng-dev \
    libtiff5-dev \
    libjpeg-dev \
    libcairo2-dev \
    libgeos-dev \
    libgsl0-dev \
    libgl1-mesa-dev \
    libglu1-mesa-dev \
    libhdf5-dev \
    libsqlite3-dev \
    libboost-all-dev \
    libssh-dev \
    libxtst6 \
    libxt6 \
    python3-dev \
    python3-pip \
    zlib1g-dev \
    libbz2-dev \
    liblzma-dev \
    libpcre3-dev \
    libicu-dev \
    net-tools \
    iproute2 \
    curl \
    psmisc

# RのGPGキーを追加
RUN wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc

# CRANリポジトリを追加
RUN add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"

# Rのインストール
RUN apt-get update && apt-get install -y r-base r-base-dev

# renvをインストール
RUN R -e "install.packages('renv', repos='https://cloud.r-project.org')"

# RStudio Serverをインストール（オプション）
RUN wget https://download2.rstudio.org/server/jammy/amd64/rstudio-server-2023.06.0-421-amd64.deb && \
    gdebi -n rstudio-server-2023.06.0-421-amd64.deb && \
    rm rstudio-server-2023.06.0-421-amd64.deb

# RStudio Serverの設定を変更
RUN echo "www-address=0.0.0.0" | sudo tee -a /etc/rstudio/rserver.conf

# RStudio Server の設定ファイルのパーミッションを設定
RUN mkdir -p /etc/rstudio && \
    echo "www-address=0.0.0.0" > /etc/rstudio/rserver.conf && \
    echo "auth-none=1" >> /etc/rstudio/rserver.conf && \
    echo "server-user=vscode" >> /etc/rstudio/rserver.conf && \
    echo "server-data-dir=/usr/local/share/rocker-devcontainer-features/rstudio-server/data" >> /etc/rstudio/rserver.conf && \
    echo "database-config-file=/usr/local/share/rocker-devcontainer-features/rstudio-server/data/dbconf.conf" >> /etc/rstudio/rserver.conf && \
    echo "log-dir=/var/log/rstudio/rstudio-server" >> /etc/rstudio/rserver.conf && \
    chown -R vscode:vscode /etc/rstudio && \
    chmod 644 /etc/rstudio/rserver.conf

# ログディレクトリの作成
RUN mkdir -p /var/log/rstudio/rstudio-server && \
    chown -R vscode:vscode /var/log/rstudio

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
