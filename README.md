# purescript-GraphqlClient

*Extremely WIP*

A purescript GQL client library taking inspiration from
Dillon Kearn's work on [elm-graphql](https://github.com/dillonkearns/elm-graphql)
which can be considered as two parts:

- a GQL library that allows for the expression of all valid GQL queries
and guarantees any given query is valid at compile time
- a code generation CLI tool that generates a library for a given endpoint
that guarantees all queries are valid for a given endpoint

Why "GraphqlClient"? I dunno, we use the Elixir library Absinthe at work and it seemed
cute to name it after another spirit.

Feel free to open an issue or message me \@liam on the
[functional programming slack](https://fpchat-invite.herokuapp.com/)
