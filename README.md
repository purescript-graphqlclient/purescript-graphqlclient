# purescript-graphql-client

### TODO:

1. Circular input objects? Do we want that? (use `Newtype` if we want)
2. Subscriptions

### Inspiration

- port of https://github.com/dillonkearns/elm-graphql/
- was based originally on https://github.com/dyerw/purescript-fernet

- - -

### How to install

```sh
npm install "git+https://github.com/purescript-graphql-client/purescript-graphql-client#COMMIT_HASH"
# or
yarn add "git+https://github.com/purescript-graphql-client/purescript-graphql-client#COMMIT_HASH"
```

### How to run generator

```sh
purescript-graphql-client-generator --input-url … --output … --api … --custom-scalars-module …
```

- - -

## Requirements on the `$PATH` to build (see `package.json`’s `optionalDependencies`)

- `purescript`
- `spago`

### How to bundle a new build

```sh
yarn bundle
```

### How to run generator from source

```sh
yarn install

# or for nix

yarn install --ignore-optional

# check ./regenerate-examples.sh file
spago --config generator-spago.dhall run \
  --main GraphqlClientGenerator.Main \
  --node-args "--help"
```
