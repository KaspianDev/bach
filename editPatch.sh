#!/bin/bash

source .bach

cd $MODULE_DIR
git rebase --interactive $ORIGIN_BRANCH

