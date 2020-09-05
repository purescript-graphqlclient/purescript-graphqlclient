#!/usr/bin/env bash

set -euxo pipefail

rm -fdR examples/schema-swapi.graphql
rm -fdR examples/schema-swapi.json

apollo-codegen introspect-schema https://elm-graphql.herokuapp.com --output examples/schema-swapi.json

apollo-codegen print-schema --schema examples/schema-swapi.json --output examples/schema-swapi.graphql
