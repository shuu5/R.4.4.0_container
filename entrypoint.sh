#!/bin/bash

# RStudio Serverを起動
sudo /etc/init.d/rstudio-server start

# RStudio Serverの状態を確認
sudo /etc/init.d/rstudio-server status

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

# RStudio Serverのログを表示（デバッグ用）
echo "RStudio Server log:"
sudo cat /var/log/rstudio-server/rserver.log

# 渡されたコマンドを実行
exec "$@"