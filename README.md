# R.4.4.0_SeuratBP

## 概要
このリポジトリは、R.4.4.0, Seurat, BPCells, tidyverse環境をDockerコンテナでセットアップするためのものです。

## セットアップ手順

1. リポジトリをローカルにクローンする:
    ```bash
    git clone https://github.com/shuu5/R.4.4.0_container.git
    ```
2. VSCodeでクローンしたフォルダを開く。
3. `.env`ファイルの`RENV_PATHS_CACHE_HOST="../renv/cache"`を適切なパスに書き換える。
4. コマンドパレットを開く (Ctrl + Shift + P)。
5. 「Remote-Containers: Open Folder in Container」を選択する。
6. 自動で/project/init.Rが実行されるので足りないパッケージをインストールする。
7. (RStudio-serverを使用する場合は、[http://localhost:8787](http://localhost:8787)にアクセスする。)


## 新しいRパッケージのインストール

- renv::install()を使います。
- githubから直接ダウンロードするなど特殊なインストール方法の場合、library("パッケージ名")をどこかのRファイルに記載してからrenv::snapshot()を実行して依存関係を記録してください。

## 新しいlinuxパッケージのインストール

- 新しいパッケージをインストールしたい場合は、`Dockerfile`の`RUN apt-get update && apt-get install -y \`に追記する必要があります。
- コンテナ内でインストールしても、コンテナを一旦閉じると元に戻ることがあります。
