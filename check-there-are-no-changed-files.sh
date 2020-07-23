#!/usr/bin/env bash

set -euxo pipefail

yarn run test

./regenerate-examples.sh

echo 'Confirming that generated code has been commited...'
changed_files=$(git diff --name-only)

if [[ -n $changed_files ]]; then
  echo 'FAILURE'
  echo 'Generated code has changed. Commit changes to approve.'
  echo $changed_files
  exit 1;
fi

yarn run examples:test

echo 'SUCCESS'
