#!/bin/bash

source .bach

if [ ! -d "$MODULE_DIR" ]; then
  git submodule add $REPO_URL $MODULE_DIR
fi

cd $MODULE_DIR
first_iteration=true
git reset --hard $ORIGIN_BRANCH

PATCH_DIR_REL="../$PATCH_DIR"
for PATCH_FILE in $PATCH_DIR_REL/*.patch; do
    git am -3 --ignore-whitespace $PATCH_FILE

    if [ "$first_iteration" = true ]; then
        git rev-parse --short HEAD > ../.commitcache
        first_iteration=false
    fi
done

