module Fernet.Introspection.IntrospectionSchema where

import Data.Identity
import Fernet.Graphql.SelectionSet
import Protolude hiding ((<|>))

import Data.Argonaut.Core (Json) as ArgonautCore
import Data.Argonaut.Decode as ArgonautCodec

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
    }

data InstorpectionQueryResult_Schema
data InstorpectionQueryResult_QueryType
data InstorpectionQueryResult_MutationType
data InstorpectionQueryResult_SubscriptionType
data InstorpectionQueryResult_Types
data InstorpectionQueryResult_EnumValues

__schema :: ∀ r . SelectionSet InstorpectionQueryResult_Schema r -> SelectionSet RootQuery r
__schema = selectionForCompositeField "__schema" []

queryType :: ∀ r . SelectionSet InstorpectionQueryResult_QueryType r -> SelectionSet InstorpectionQueryResult_Schema r
queryType = selectionForCompositeField "queryType" []

queryType_name :: SelectionSet InstorpectionQueryResult_QueryType String
queryType_name = selectionForField "name"

queryType_description :: SelectionSet InstorpectionQueryResult_QueryType String
queryType_description = selectionForField "description"

mutationType :: ∀ r . SelectionSet InstorpectionQueryResult_MutationType r -> SelectionSet InstorpectionQueryResult_Schema (Maybe r)
mutationType = selectionForCompositeField "mutationType" []

mutationType_name :: SelectionSet InstorpectionQueryResult_MutationType String
mutationType_name = selectionForField "name"

subscriptionType :: ∀ r . SelectionSet InstorpectionQueryResult_SubscriptionType r -> SelectionSet InstorpectionQueryResult_Schema (Maybe r)
subscriptionType = selectionForCompositeField "subscriptionType" []

subscriptionType_name :: SelectionSet InstorpectionQueryResult_SubscriptionType String
subscriptionType_name = selectionForField "name"

types :: ∀ r . SelectionSet InstorpectionQueryResult_Types r -> SelectionSet InstorpectionQueryResult_Schema (Array r)
types = selectionForCompositeField "types" []

types_kind :: SelectionSet InstorpectionQueryResult_Types String
types_kind = selectionForField "kind"

types_name :: SelectionSet InstorpectionQueryResult_Types String
types_name = selectionForField "name"

types_description :: SelectionSet InstorpectionQueryResult_Types (Maybe String)
types_description = selectionForField "description"

type Types_EnumValues_Input = { includeDeprecated :: Optional (Maybe Boolean) }

types_enumValues
  :: ∀ r
   . Types_EnumValues_Input
  -> SelectionSet InstorpectionQueryResult_EnumValues r
  -> SelectionSet InstorpectionQueryResult_Types (Maybe <<< Array $ r)
types_enumValues { includeDeprecated } = selectionForCompositeField "enumValues" [ (OptionalArgument "includeDeprecated" (includeDeprecated <#> (map ArgBoolean >>> ArgMaybeEmpty))) ]

-- type StringQueryOperatorInput =
--   { eq    :: String -- required
--   , ne    :: Maybe String -- required, can be null or string
--   , regex :: Optional (Maybe String) -- required, can be null or string or absent
--   , glob  :: Optional String -- required, can be string or absent
--   }

-- type ContinentFilterInput = (code :: StringQueryOperatorInput)

-- type PropsOptional = (filter :: ContinentFilterInput)

types_enumValues_name :: SelectionSet InstorpectionQueryResult_EnumValues String
types_enumValues_name = selectionForField "name"

types_enumValues_description :: SelectionSet InstorpectionQueryResult_EnumValues String
types_enumValues_description = selectionForField "description"

types_enumValues_isDeprecated :: SelectionSet InstorpectionQueryResult_EnumValues Boolean
types_enumValues_isDeprecated = selectionForField "isDeprecated"

types_enumValues_deprecationReason :: SelectionSet InstorpectionQueryResult_EnumValues (Maybe String)
types_enumValues_deprecationReason = selectionForField "deprecationReason"

introspectionQuery :: Boolean -> SelectionSet RootQuery InstorpectionQueryResult
introspectionQuery includeDeprecated =
  __schema ado
    queryType'        <- queryType $ { name: _ } <$> queryType_name
    mutationType'     <- mutationType $ { name: _ } <$> mutationType_name
    subscriptionType' <- subscriptionType $ { name: _ } <$> subscriptionType_name
    types'            <- types ado
      types_kind'        <- types_kind
      types_name'        <- types_name
      types_description' <- (types_description <#> fromMaybe "")
      types_enumValues'  <- types_enumValues ({ includeDeprecated: Present Nothing }) $
        { name: _
        , description: _
        , isDeprecated: _
        , deprecationReason: _
        } <$> types_enumValues_name
          <*> types_enumValues_description
          <*> types_enumValues_isDeprecated
          <*> types_enumValues_deprecationReason
      in { kind: types_kind'
         , name: types_name'
         , description: types_description'
         , enumValues: types_enumValues'
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

