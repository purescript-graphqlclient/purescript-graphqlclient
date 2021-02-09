#!/usr/bin/env bash

set -euxo pipefail

# helpers

function retry()
{
  eval "$1" || eval "$1"
}

function check_no_diff()
{
  echo 'Confirming that generated code has been committed...'
  changed_files=$(git diff --name-only)

  if [[ -n $changed_files ]]; then
    echo 'FAILURE'
    echo 'Generated code has changed. Commit changes to approve.'
    echo $changed_files
    exit 1;
  fi
}

# tests

yarn run lib:test --no-install

########

# retry because external servers are served on heroku and it needs time to start
retry "yarn run generator:test --no-install"

########

./regenerate-examples.sh

check_no_diff

echo 'SUCCESS with ./regenerate-examples.sh'

########

retry "yarn run examples:test --no-install"

echo 'SUCCESS with examples:test'

########

# because it cannot write if dir exists
rm -fdR examples/Dillonkearns/Examples/Swapi

spago --config generator-spago.dhall run --no-install \
  --main Dillonkearns.GraphQLClientGenerator.Main \
  --node-args "--input-schema ./examples/schema-swapi.graphql --output examples/Dillonkearns/Examples/Swapi --api Dillonkearns.Examples.Swapi --custom-scalars-module Dillonkearns.Dillonkearns.Examples.SwapiCustomScalars"

check_no_diff

echo 'SUCCESS with --input-schema xxxx.graphql test'

########

# because it cannot write if dir exists
rm -fdR examples/Dillonkearns/Examples/Swapi

spago --config generator-spago.dhall run --no-install \
  --main Dillonkearns.GraphQLClientGenerator.Main \
  --node-args "--input-json ./examples/schema-swapi.json --output examples/Dillonkearns/Examples/Swapi --api Dillonkearns.Examples.Swapi --custom-scalars-module Dillonkearns.Dillonkearns.Examples.SwapiCustomScalars"

check_no_diff

echo 'SUCCESS with --input-json xxxx.json test'

########

echo 'SUCCESS'
