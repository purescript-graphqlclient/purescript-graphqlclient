#!/usr/bin/env bash

set -euxo pipefail

# helpers

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

function check_no_diff()
{
  echo 'Confirming that generated code has been commited...'
  changed_files=$(git diff --name-only)

  if [[ -n $changed_files ]]; then
    echo 'FAILURE'
    echo 'Generated code has changed. Commit changes to approve.'
    echo $changed_files
    exit 1;
  fi
}

# tests

yarn run lib:test

########

# retry because external servers are served on heroku and it needs time to start
retry 2 yarn run generator:test

########

./regenerate-examples.sh

check_no_diff

########

retry 2 yarn run examples:test

########

# or it cannot write if dir exists
rm -fdR examples/swapi

spago --config generator-spago.dhall run \
  --main GraphqlClientGenerator.Main \
  --node-args "--input-schema ./examples/schema-swapi.graphql --output examples/swapi --api Examples.Swapi --custom-scalars-module Examples.SwapiCustomScalars"

check_no_diff

########

# or it cannot write if dir exists
rm -fdR examples/swapi

spago --config generator-spago.dhall run \
  --main GraphqlClientGenerator.Main \
  --node-args "--input-json ./examples/schema-swapi.json --output examples/swapi --api Examples.Swapi --custom-scalars-module Examples.SwapiCustomScalars"

check_no_diff

########

echo 'SUCCESS'
