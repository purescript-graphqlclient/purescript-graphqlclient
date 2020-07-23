#!/usr/bin/env bash

set -euxo pipefail

function retry()
{
        local n=0
        local try=$1
        local cmd="${@: 2}"
        [[ $# -le 1 ]] && {
        echo "Usage $0 <retry_number> <Command>"; }

        until [[ $n -ge $try ]]
        do
                $cmd && break || {
                        echo "Command Fail.."
                        ((n++))
                        echo "retry $n ::"
                        sleep 1;
                        }

        done
}

retry 1 yarn run test

./regenerate-examples.sh

echo 'Confirming that generated code has been commited...'
changed_files=$(git diff --name-only)

if [[ -n $changed_files ]]; then
  echo 'FAILURE'
  echo 'Generated code has changed. Commit changes to approve.'
  echo $changed_files
  exit 1;
fi

retry 1 yarn run examples:test

echo 'SUCCESS'
