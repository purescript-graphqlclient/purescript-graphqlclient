module Fernet.Introspection.IntrospectionSchema where

import Protolude

import Fernet.GraphQL.SelectionSet ((<|>), SelectionSet, RootQuery)

import Fernet.Introspection.Schema.Field as Field
import Fernet.Introspection.Schema.Query (schema)
import Fernet.Introspection.Schema.Schema (types)
import Fernet.Introspection.Schema.Type as Type
import Fernet.Introspection.Schema.InputValue as InputValue
import Fernet.Introspection.Schema.Types (InputValue(..), Type(..))
import Fernet.Introspection.Schema.TypeKind as TypeKind

type FieldResult
  = { name :: String
    , type ::
      { name :: Maybe String
      , kind :: TypeKind.TypeKind
      }
    }

type TypeResult
  = { name :: Maybe String
    , kind :: TypeKind.TypeKind
    , fields :: Maybe (Array FieldResult)
    }

type Result
  = ( __schema ::
      { types ::
        Array TypeResult
      }
    )

typeRefSelection ::
  SelectionSet
    ( kind :: TypeKind.TypeKind
    , name :: Maybe String
    , ofType ::
      { kind :: TypeKind.TypeKind
      , name :: Maybe String
      , ofType ::
        { kind :: TypeKind.TypeKind
        , name :: Maybe String
        , ofType ::
          { kind :: TypeKind.TypeKind
          , name :: Maybe String
          , ofType ::
            { kind :: TypeKind.TypeKind
            , name :: Maybe String
            , ofType ::
              { kind :: TypeKind.TypeKind
              , name :: Maybe String
              , ofType ::
                { kind :: TypeKind.TypeKind
                , name :: Maybe String
                }
              }
            }
          }
        }
      }
    )
    Type
typeRefSelection =
  Type.kind
    <|> Type.name
    <|> Type.ofType
        ( Type.kind
            <|> Type.name
            <|> Type.ofType
                ( Type.kind
                    <|> Type.name
                    <|> Type.ofType
                        ( Type.kind
                            <|> Type.name
                            <|> Type.ofType
                                ( Type.kind
                                    <|> Type.name
                                    <|> Type.ofType
                                        ( Type.kind
                                            <|> Type.name
                                            <|> Type.ofType
                                                ( Type.kind
                                                    <|> Type.name
                                                )
                                        )
                                )
                        )
                )
        )

inputValueSelection ::
  SelectionSet
    ( defaultValue :: Maybe String
    , desciption :: Maybe String
    , name :: Maybe String
    , type ::
      { kind :: TypeKind.TypeKind
      , name :: Maybe String
      , ofType ::
        { kind :: TypeKind.TypeKind
        , name :: Maybe String
        , ofType ::
          { kind :: TypeKind.TypeKind
          , name :: Maybe String
          , ofType ::
            { kind :: TypeKind.TypeKind
            , name :: Maybe String
            , ofType ::
              { kind :: TypeKind.TypeKind
              , name :: Maybe String
              , ofType ::
                { kind :: TypeKind.TypeKind
                , name :: Maybe String
                , ofType ::
                  { kind :: TypeKind.TypeKind
                  , name :: Maybe String
                  }
                }
              }
            }
          }
        }
      }
    )
    InputValue
inputValueSelection =
  InputValue.name
    <|> InputValue.description
    <|> (InputValue.type' typeRefSelection)
    <|> InputValue.defaultValue

introspectionQuery :: Boolean -> SelectionSet Result RootQuery
introspectionQuery includeDeprecated =
  schema
    ( types
        ( Type.name
          <|> Type.kind
          <|> Type.fields (Just includeDeprecated)
              ( Field.name
                  <|> Field.type'
                      ( Type.name
                          <|> Type.kind
                      )
              )
        )
    )
