module Fernet.Introspection.IntrospectionSchema where

import Protolude
import Fernet.Graphql.SelectionSet
import Fernet.Introspection.Schema.Fields
import Type.Row

type InstorpectionQueryResult
  = { __schema ::
      { queryType :: { name :: String }
      , mutationType :: Maybe { name :: String }
      , subscriptionType :: Maybe { name :: String }
      , types :: Array InstorpectionQueryResult__FullType
      }
    }

type InstorpectionQueryResult__FullType
  = { kind :: String
    , name :: String
    , description :: String
    , enumValues :: Maybe <<< Array $
      { name :: String
      , description :: String
      , isDeprecated :: Boolean
      , deprecationReason :: Maybe String
      }
    , possibleTypes :: Maybe <<< Array $ InstorpectionQueryResult__TypeRef
    }

type InstorpectionQueryResult__TypeRef_shared r = ( kind :: String, name :: String | r )

-- 7 ofType's
type InstorpectionQueryResult__TypeRef
  = Record
    (InstorpectionQueryResult__TypeRef_shared
    + (ofType :: Maybe $ Record
        (InstorpectionQueryResult__TypeRef_shared
        + (ofType :: Maybe $ Record
            (InstorpectionQueryResult__TypeRef_shared
            + (ofType :: Maybe $ Record
                (InstorpectionQueryResult__TypeRef_shared
                + (ofType :: Maybe $ Record
                    (InstorpectionQueryResult__TypeRef_shared
                    + (ofType :: Maybe $ Record
                        (InstorpectionQueryResult__TypeRef_shared
                        + (ofType :: Maybe $ Record
                            (InstorpectionQueryResult__TypeRef_shared
                            + (ofType :: Maybe $ Record (InstorpectionQueryResult__TypeRef_shared + ())
                              )
                            )
                          )
                        )
                      )
                    )
                  )
                )
              )
            )
          )
        )
      )
    )

introspectionQuery :: Boolean -> SelectionSet RootQuery InstorpectionQueryResult
introspectionQuery includeDeprecated =
  __schema ado
    queryType'        <- queryType $ { name: _ } <$> queryType_name
    mutationType'     <- mutationType $ { name: _ } <$> mutationType_name
    subscriptionType' <- subscriptionType $ { name: _ } <$> subscriptionType_name
    types'            <- types ado
      types_kind'          <- types_kind
      types_name'          <- types_name
      types_description'   <- (types_description <#> fromMaybe "")
      types_enumValues'    <- types_enumValues ({ includeDeprecated: false }) $
        { name: _
        , description: _
        , isDeprecated: _
        , deprecationReason: _
        } <$> types_enumValues_name
          <*> types_enumValues_description
          <*> types_enumValues_isDeprecated
          <*> types_enumValues_deprecationReason
      types_possibleTypes' <-
        let
            ofTypeStop :: SelectionSet InstorpectionQueryResult_PossibleTypes { kind :: String, name :: String }
            ofTypeStop = { kind: _, name: _ } <$> types_possibleTypes_kind <*> types_possibleTypes_name

            ofTypeNest :: ∀ r . SelectionSet InstorpectionQueryResult_PossibleTypes r -> SelectionSet InstorpectionQueryResult_PossibleTypes { kind :: String, name :: String, ofType :: Maybe r }
            ofTypeNest other = { kind: _, name: _, ofType: _ } <$> types_possibleTypes_kind <*> types_possibleTypes_name <*> types_possibleTypes_ofType other
         in types_possibleTypes $ ofTypeNest $ ofTypeNest $ ofTypeNest $ ofTypeNest $ ofTypeNest $ ofTypeNest $ ofTypeNest ofTypeStop
      in { kind: types_kind'
         , name: types_name'
         , description: types_description'
         , enumValues: types_enumValues'
         , possibleTypes: types_possibleTypes'
         }
    in { __schema:
          { queryType: queryType'
          , mutationType: mutationType'
          , subscriptionType: subscriptionType'
          , types: types'
          }
       }

  -- (queryType $ { name: _, description: _ } <$> queryType_name <*> queryType_description)

  -- __schema $
  --   queryType queryType_name
  --   <|> mutationType mutationType_name
  --   <|> subscriptionType subscriptionType_name
  --   <|> (types $ types_kind <|> types_name <|> types_description)

