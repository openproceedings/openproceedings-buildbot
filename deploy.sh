#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR
BRANCH=master
TRAVIS_REPO_SLUG_ARRAY=(${TRAVIS_REPO_SLUG//\// })
GITHUB_ORGANIZATION=${TRAVIS_REPO_SLUG_ARRAY[0]}
TARGET_REPO=$GITHUB_ORGANIZATION/$GITHUB_ORGANIZATION.github.io
# if target folder is not a single folder, change the rsync command
TARGET_FOLDER=$1
PELICAN_OUTPUT_FOLDER=output

if [ "$TRAVIS_PULL_REQUEST" == "false" ]; then

    # reconstruct the deploy key from the environment
    # https://gist.github.com/floydpink/4631240
    echo -n $id_rsa_{00..30} >> ~/.ssh/id_rsa_base64
    base64 --decode --ignore-garbage ~/.ssh/id_rsa_base64 > ~/.ssh/id_rsa
    chmod 600 ~/.ssh/id_rsa
    echo -e "Host github.com\n\tStrictHostKeyChecking no\n" >> ~/.ssh/config

    echo -e "Starting to deploy to Github Pages\n"
    if [ "$TRAVIS" == "true" ]; then
        git config --global user.email "travis@travis-ci.org"
        git config --global user.name "Travis"
    fi
    #using token clone gh-pages branch
    git clone --quiet --branch=$BRANCH git@github.com:$TARGET_REPO.git built_website &> /dev/null
    #go into directory and copy data we're interested in to that directory
    cd built_website/$TARGET_FOLDER
    rsync -rv --exclude=.git  ../../$PELICAN_OUTPUT_FOLDER/* .
    #add, commit and push files
    git add -f .
    git commit -m "Travis build $TRAVIS_BUILD_NUMBER pushed to Github Pages"
    git push -fq origin $BRANCH &> /dev/null
    echo -e "Deploy completed\n"
fi
