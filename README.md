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
