FROM rocker/rstudio:4.4.0

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

# ユーザーのホームディレクトリにRパッケージをインストールするように設定
RUN mkdir -p /home/rstudio/R/x86_64-pc-linux-gnu-library/4.4
ENV R_LIBS_USER=/home/rstudio/R/x86_64-pc-linux-gnu-library/4.4

# renvをインストール
RUN R -e "install.packages('renv', repos='https://cloud.r-project.org')"

# vscodeユーザーを作成
RUN useradd -m vscode && \
    mkdir -p /home/vscode/.cursor-server && \
    chown -R vscode:vscode /home/vscode/.cursor-server \
    && echo "vscode ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/vscode \
    && chmod 0440 /etc/sudoers.d/vscode

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