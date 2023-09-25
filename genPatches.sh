#!/bin/bash

source .bach

CACHED_COMMIT=$(cat .commitcache)
COMMIT_ID=$1

if [ $# -eq 0 ] && [ -z "$CACHED_COMMIT" ]; then
    echo "Usage: <commit-id>"
    exit 1
elif [ $# -eq 0 ]; then
    COMMIT_ID=$CACHED_COMMIT
fi

mkdir -p "$PATCH_DIR"
rm -f "$PATCH_DIR"/*.patch

cd $MODULE_DIR

INDEX=0

git format-patch -1 "$COMMIT_ID" -o "../$PATCH_DIR" --start-number $INDEX --subject-prefix $INDEX

for COMMIT in $(git log --pretty=format:"%h" "$COMMIT_ID..HEAD"); do
    COMMIT_HASH="$COMMIT"
    ((INDEX++))
    git format-patch -1 "$COMMIT_HASH" -o "../$PATCH_DIR" --start-number $INDEX --subject-prefix $INDEX
done

