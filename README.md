# purescript-graphql-client

### TODO:

1. circular input objects? do we want that? (use newtype if we want)
2. subscriptions

### Inspiration

- port of https://github.com/dillonkearns/elm-graphql/
- was based originally on https://github.com/dyerw/purescript-fernet

### How to run generator

```
yarn install

# check ./regenerate-examples.sh file
spago run \
  --main GraphqlClientGenerator.Main \
  --node-args "--input-url .... --output .... --api .... --custom-scalars-module ...."
```
