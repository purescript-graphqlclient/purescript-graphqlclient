# purescript-graphql-client

### TODO:

1. circular input objects? do we want that? (use newtype if we want)
2. subscriptions

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

### How to run

```sh
purescript-graphql-client --input-url … --output … --api … --custom-scalars-module …
```

- - -

### How to bundle a new build

```sh
yarn bundle
```

### How to run generator

```sh
yarn install

# check ./regenerate-examples.sh file
spago run \
  --main GraphqlClientGenerator.Main \
  --node-args "--input-url … --output … --api … --custom-scalars-module …"
```
