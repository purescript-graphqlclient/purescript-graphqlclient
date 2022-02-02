# purescript-graphqlclient

### TODO:

1. Circular input objects? Do we want that? (use `Newtype` if we want)
2. Subscriptions

### Inspiration

- port of https://github.com/dillonkearns/elm-graphql/
- was based originally on https://github.com/dyerw/purescript-fernet

- - -

### How to install

```sh
npm install "git+https://github.com/purescript-graphqlclient/purescript-graphqlclient#COMMIT_HASH"
# or
yarn add "git+https://github.com/purescript-graphqlclient/purescript-graphqlclient#COMMIT_HASH"
```

### How to run generator

```sh
purescript-graphqlclient-generator --input-url … --output … --api … --custom-scalars-module …
```

- - -

## Requirements on the `$PATH` to build (should be installed globally)

- `purescript`: `~0.14.0`
- `spago`: `~0.20.0`

### How to bundle a new build

```sh
yarn generator:bundle
# test with
node bin/purescript-graphqlclient-generator --help
```

### How to regenerate examples

```sh
spago install
spago --config generator-spago.dhall install
spago --config examples-spago.dhall install

# How to create "Personal access tokens"
# 1. (optional) check https://docs.github.com/en/graphql/guides/forming-calls-with-graphql#authenticating-with-graphql
# 2. go to https://github.com/settings/tokens
# 3. create with only "public repos" permissions and name "ps-graphqlclient"

export MY_GITHUB_GRAPHQL_ENDPOINT_TOKEN=xxxx

./regenerate-examples.sh
yarn run examples:test --watch
git push
```

### How to run generator from source

```sh
yarn install

# check ./regenerate-examples.sh file
spago --config generator-spago.dhall run \
  --main GraphQLClientGenerator.Main \
  --node-args "--help"
```

### How to run tests locally

```sh
yarn install
spago install
spago --config generator-spago.dhall install
spago --config examples-spago.dhall install
./ci-approve.sh
```
