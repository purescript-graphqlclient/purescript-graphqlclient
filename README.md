# purescript-fernet

*Extremely WIP*

A purescript GQL client library taking inspiration from
Dillon Kearn's work on (https://github.com/dillonkearns/elm-graphql)[elm-graphql]
which can be considered as two parts:

- a GQL library that allows for the expression of all valid GQL queries
and guarantees any given query is valid at compile time
- a code generation CLI tool that generates a library for a given endpoint
that guarantees all queries are valid for a given endpoint

Why "Fernet"? I dunno, we use the Elixir library Absinthe at work and it seemed
cute to name it after another spirit.

Feel free to open an issue or message me \@liam on the
(https://fpchat-invite.herokuapp.com/)[functional programming slack]
