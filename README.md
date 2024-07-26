# R.4.4.1_container


1. リポジトリをローカルにクローンする
    - git clone https://github.com/shuu5/R.4.4.1_container.git
2. VSCode(Cursor)でクローンしたフォルダを開く
3. .envのRENV_PATHS_CACHE_HOST="../renv/cache"を適切なパスに書き換える。
4. コマンドパレット(ctrl+shift+P)を開く
5. 「Remote-Containers: Open Folder in Container」を選択する
6. RStudio-serverを使う場合はhttp://localhost:8787にアクセスする


・新しいパッケージをインストールしたい場合
    - Dockerfileの"RUN apt-get update && apt-get install -y \"に追記する。
    - コンテナ内でインストールしてもイメージを一旦閉じると元に戻る
