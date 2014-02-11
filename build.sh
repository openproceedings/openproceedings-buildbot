#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR
REPOSITORY_NAME=$1
git clone --quiet https://${GH_TOKEN_CONTENT}@github.com/$REPOSITORY_NAME.git content &> /dev/null
ln -s content/images images
ls images/
make html
if [ "$TRAVIS_PULL_REQUEST" == "false" ]; then
    if [ "$TRAVIS" == "true" ]; then
        git config --global user.email "travis@travis-ci.org"
        git config --global user.name "Travis"
    fi
    # commit json information to the repository
    cd content
    git add -f .
    git commit -m "Travis build $TRAVIS_BUILD_NUMBER: figshare metadata" -m "[ci skip]"
    git push -fq origin master &> /dev/null
    echo -e "Figshare metadata added to content repository\n"
fi
