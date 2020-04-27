module Fernet.Introspection.Queries where

import Protolude
import Data.Maybe (Maybe(..))
import Fernet.GraphQL.SelectionSet (SelectionSet, (<|>))
import Fernet.Introspection.Schema.Field as Field
import Fernet.Introspection.Schema.InputValue as InputValue
import Fernet.Introspection.Schema.Query (schema)
import Fernet.Introspection.Schema.Schema (types)
import Fernet.Introspection.Schema.Type as Type
import Fernet.Introspection.Schema.EnumValue as EnumValue
import Fernet.Introspection.Schema.Types as Types
import Fernet.Introspection.Schema.TypeKind as TypeKind

fullTypeSelection ::
  SelectionSet
    ( description :: String
    , enumValues ::
      Array
        { deprecationReason :: Maybe String
        , description :: Maybe String
        , isDeprecated :: Boolean
        , name :: String
        }
    , fields ::
      Maybe
        ( Array
            { args ::
              Array
                { defaultValue :: Maybe String
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
                }
            , deprecationReason :: Maybe String
            , description :: String
            , isDeprecated :: Boolean
            , name :: String
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
            }
        )
    , inputFields ::
      Array
        { defaultValue :: Maybe String
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
        }
    , interfaces ::
      Array
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
    , kind :: TypeKind.TypeKind
    , name :: Maybe String
    )
    Types.Type
fullTypeSelection =
  Type.kind
    <|> Type.name
    <|> Type.description
    <|> Type.fields
        (Just true)
        ( Field.name
            <|> Field.description
            <|> Field.args (Just true) inputValueSelection
            <|> Field.type' typeRefSelection
            <|> Field.isDeprecated
            <|> Field.deprecationReason
        )
    <|> Type.inputFields inputValueSelection
    <|> Type.interfaces typeRefSelection
    <|> Type.enumValues
        (Just true)
        ( EnumValue.name
            <|> EnumValue.description
            <|> EnumValue.isDeprecated
            <|> EnumValue.deprecationReason
        )

type TypeSelection r
  = ( kind :: TypeKind.TypeKind, name :: Maybe String | r )

type TypeSelectionNested a
  = Record (TypeSelection ( ofType :: a ))

type TypeSelectionBase
  = Record (TypeSelection ())

type SixNestedTypeSelection = TypeSelectionNested <<< TypeSelectionNested <<< TypeSelectionNested <<< TypeSelectionNested <<< TypeSelectionNested $ TypeSelectionBase

typeRefSelection ::
  SelectionSet
    ( kind :: TypeKind.TypeKind
    , name :: Maybe String
    , ofType :: SixNestedTypeSelection
    )
    Types.Type
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
      Record
        ( kind :: TypeKind.TypeKind
        , name :: Maybe String
        , ofType :: SixNestedTypeSelection
        )
    )
    Types.InputValue
inputValueSelection =
  InputValue.name
    <|> InputValue.description
    <|> (InputValue.type' typeRefSelection)
    <|> InputValue.defaultValue
