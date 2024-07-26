# R.4.4.1_SeuratBP

## 概要
このリポジトリは、R.4.4.1, Seurat, BPCells, (tidyverse)環境をDockerコンテナでセットアップするためのものです。

## セットアップ手順

1. リポジトリをローカルにクローンする:
    ```bash
    git clone https://github.com/shuu5/R.4.4.1_container.git
    ```
2. VSCodeでクローンしたフォルダを開く。
3. `.env`ファイルの`RENV_PATHS_CACHE_HOST="../renv/cache"`を適切なパスに書き換える。
4. コマンドパレットを開く (Ctrl + Shift + P)。
5. 「Remote-Containers: Open Folder in Container」を選択する。
6. RStudio-serverを使用する場合は、[http://localhost:8787](http://localhost:8787)にアクセスする。
7. 各projectディレクトリに移動し、Rで`renv::restore()`を実行しrenv.lockに記載されたパッケージをインストールする。

## 新しいパッケージのインストール

- 新しいパッケージをインストールしたい場合は、`Dockerfile`の`RUN apt-get update && apt-get install -y \`に追記する必要があります。
- コンテナ内でインストールしても、イメージを一旦閉じると元に戻ります。