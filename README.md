# R.4.4.1_container


1. リポジトリをローカルにクローンする
    - git clone https://github.com/shuu5/R.4.4.1_container.git
2. VSCodeでクローンしたフォルダを開く
3. コマンドパレット(ctrl+shift+P)を開く
4. 「Remote-Containers: Open Folder in Container」を選択する
5. RStudio-serverを使う場合はhttp://localhost:8787にアクセスする
6. ユーザー名：vscode, パスワード：password(各自Dockerfileで変更)


・新しいパッケージをインストールしたい場合は、Dockerfileの"RUN apt-get update && apt-get install -y \"に追記する。(コンテナ内でインストールしてもイメージを一旦閉じると元に戻る)
