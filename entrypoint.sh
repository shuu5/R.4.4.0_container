#!/bin/bash

# RStudio Serverを起動
sudo rstudio-server start

# /workspace内の全プロジェクトディレクトリを検索し、renv::restore()を実行
for project_dir in /workspace/project_*/; do
    if [ -f "${project_dir}renv.lock" ]; then
        echo "Restoring renv for ${project_dir}"
        cd "${project_dir}"
        sudo -u vscode R -e "renv::restore()"
    fi
done

# 作業ディレクトリを/workspaceに戻す
cd /workspace

# 渡されたコマンドを実行
exec "$@"