#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR
REPOSITORY_NAME=$1
git clone --quiet https://${GH_TOKEN_CONTENT}@github.com/$REPOSITORY_NAME.git content > /dev/null
ln -s content/images images
ls images/
make html
