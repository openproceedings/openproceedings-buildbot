#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR
REPOSITORY_NAME=$1
git clone --depth 1 https://github.com/openproceedings/$REPOSITORY_NAME.git content
ln -s content/images images
ls images/
make html
