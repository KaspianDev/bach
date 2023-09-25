#!/bin/bash

source .bach

if [ ! -d "$MODULE_DIR" ]; then
  git submodule add $REPO_URL $MODULE_DIR
fi

git submodule update --remote

cd $MODULE_DIR
git reset --hard $ORIGIN_BRANCH

