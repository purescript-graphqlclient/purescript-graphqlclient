#!/usr/bin/env bash

set -euxo pipefail

rm -fdR examples/swapi
spago run --main Generator.Main --node-args "--input-url https://elm-graphql.herokuapp.com/ --output examples/swapi"
