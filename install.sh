#!/bin/bash

cat << EOF
ID = $(id)
UNAME = $(uname -a)
DOCKER_BUILDKIT = ${DOCKER_BUILDKIT}
CI = ${CI}
CI_PULL_REQUEST = ${CI_PULL_REQUEST:-None}
CI_PULL_REQUESTS = ${CI_PULL_REQUESTS:-None}
IRCLE_BRANCH = ${CIRCLE_BRANCH:-None}
CIRCLE_BUILD_NUM = ${CIRCLE_BUILD_NUM:-None}
CIRCLE_BUILD_URL = ${CIRCLE_BUILD_URL:-None}
CIRCLE_COMPARE_URL = ${CIRCLE_COMPARE_URL:-None}
CIRCLE_INTERNAL_TASK_DATA = ${CIRCLE_INTERNAL_TASK_DATA:-None}
CIRCLE_JOB = ${CIRCLE_JOB:-None}
CIRCLE_NODE_INDEX = ${CIRCLE_NODE_INDEX:-None}
CIRCLE_NODE_TOTAL = ${CIRCLE_NODE_TOTAL:-None}
CIRCLE_PR_NUMBER = ${CIRCLE_PR_NUMBER:-None}
CIRCLE_PR_REPONAME = ${CIRCLE_PR_REPONAME:-None}
CIRCLE_PR_USERNAME = ${CIRCLE_PR_USERNAME:-None}
CIRCLE_PREVIOUS_BUILD_NUM = ${CIRCLE_PREVIOUS_BUILD_NUM:-None}
CIRCLE_PROJECT_REPONAME = ${CIRCLE_PROJECT_REPONAME:-None}
CIRCLE_PROJECT_USERNAME = ${CIRCLE_PROJECT_USERNAME:-None}
CIRCLE_PULL_REQUEST = ${CIRCLE_PULL_REQUEST:-None}
CIRCLE_PULL_REQUESTS = ${CIRCLE_PULL_REQUESTS:-None}
CIRCLE_REPOSITORY_URL = ${CIRCLE_REPOSITORY_URL:-None}
CIRCLE_SHA1 = ${CIRCLE_SHA1:-None}
CIRCLE_TAG = ${CIRCLE_TAG:-None}
CIRCLE_USERNAME = ${CIRCLE_USERNAME:-None}
CIRCLE_WORKFLOW_ID = ${CIRCLE_WORKFLOW_ID:-None}
CIRCLE_WORKING_DIRECTORY = ${CIRCLE_WORKING_DIRECTORY:-None}
CIRCLECI = ${CIRCLECI:-None}
HOME = ${HOME:-None}
DISK = $(df -h)
EOF

exit 0

TPATH=~/.dotfiles

# git が使えるなら git
if has "git"; then
    git clone --recursive "$GITHUB_URL" "$DOTPATH"

# 使えない場合は curl か wget を使用する
elif has "curl" || has "wget"; then
    tarball="https://github.com/b4b4r07/dotfiles/archive/master.tar.gz"

    # どっちかでダウンロードして，tar に流す
    if has "curl"; then
        curl -L "$tarball"

    elif has "wget"; then
        wget -O - "$tarball"

    fi | tar zxv

    # 解凍したら，DOTPATH に置く
    mv -f dotfiles-master "$DOTPATH"

else
    die "curl or wget required"
fi

cd ~/.dotfiles
if [ $? -ne 0 ]; then
    die "not found: $DOTPATH"
fi

# 移動できたらリンクを実行する
for f in .??*
do
    [ "$f" = ".git" ] && continue

    ln -snfv "$DOTPATH/$f" "$HOME/$f"
done

