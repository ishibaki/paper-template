#!/bin/bash

git init
mv pre-push ./.git/hooks/pre-push
mv post-commit ./.git/hooks/post-commit
.bin/logger.sh
mkdir figs
mkdir out
mkdir release
rm init.sh
