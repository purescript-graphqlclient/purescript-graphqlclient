module Fernet.Introspection.IntrospectionSchema where

import Fernet.Graphql.SelectionSet
import Protolude hiding ((<|>))

import Data.Argonaut.Core (Json) as ArgonautCore
import Data.Argonaut.Decode as ArgonautCodec

type InstorpectionQueryResult
  = { __schema ::
      { queryType :: { name :: String, description :: String }
      , mutationType :: Maybe { name :: String }
      }
    }
  --     --
  --     -- , subscriptionType :: Maybe { name :: String }
  --     -- , types :: Array InstorpectionQueryResult__FullType
  --     }
  --   )

type InstorpectionQueryResult__FullType
  = { kind :: String
    , name :: String
    , description :: String
    -- , enumValues ::
    --   { name :: String
    --   , description :: String
    --   , isDeprecated :: String
    --   , deprecationReason :: String
    --   }
    }

data InstorpectionQueryResult_Schema
data InstorpectionQueryResult_QueryType
data InstorpectionQueryResult_MutationType
data InstorpectionQueryResult_SubscriptionType
data InstorpectionQueryResult_Types

__schema :: ∀ r . SelectionSet InstorpectionQueryResult_Schema r -> SelectionSet RootQuery r
__schema s = selectionForCompositeField "__schema" [] s identity

queryType :: ∀ r . SelectionSet InstorpectionQueryResult_QueryType r -> SelectionSet InstorpectionQueryResult_Schema r
queryType s = selectionForCompositeField "queryType" [] s identity

queryType_name :: SelectionSet InstorpectionQueryResult_QueryType String
queryType_name = selectionForField "name"

queryType_description :: SelectionSet InstorpectionQueryResult_QueryType String
queryType_description = selectionForField "descriptio"

mutationType :: ∀ r . SelectionSet InstorpectionQueryResult_QueryType r -> SelectionSet InstorpectionQueryResult_Schema (Maybe r)
mutationType s = selectionForCompositeField "mutationType" [] s (\childDecoder -> \json -> do
  (x :: Maybe ArgonautCore.Json) <- ArgonautCodec.decodeJson json
  traverse childDecoder x
  )

mutationType_name :: SelectionSet InstorpectionQueryResult_QueryType String
mutationType_name = selectionForField "name"

-- mutationType :: ∀ r.  SelectionSet r InstorpectionQueryResult_MutationType -> SelectionSet InstorpectionQueryResult_Schema ( mutationType :: Maybe (Record r) )
-- mutationType (SelectionSet fields) = SelectionSet [ Composite "mutationType" [] fields ]

-- mutationType_name :: SelectionSet InstorpectionQueryResult_MutationType ( name :: String )
-- mutationType_name = selectionForField "name"

-- subscriptionType :: ∀ r.  SelectionSet r InstorpectionQueryResult_SubscriptionType -> SelectionSet InstorpectionQueryResult_Schema ( subscriptionType :: Maybe (Record r) )
-- subscriptionType (SelectionSet fields) = SelectionSet [ Composite "subscriptionType" [] fields ]

-- subscriptionType_name :: SelectionSet InstorpectionQueryResult_SubscriptionType ( name :: String )
-- subscriptionType_name = selectionForField "name"

-- types :: ∀ r.  SelectionSet r InstorpectionQueryResult_Types -> SelectionSet InstorpectionQueryResult_Schema ( types :: Array (Record r) )
-- types (SelectionSet fields) = SelectionSet [ Composite "types" [] fields ]

-- types_kind :: SelectionSet InstorpectionQueryResult_Types ( kind :: String )
-- types_kind = selectionForField "kind"

-- types_name :: SelectionSet InstorpectionQueryResult_Types ( name :: String )
-- types_name = selectionForField "name"

-- types_description :: SelectionSet RootQuery String
-- types_description = selectionForField "description"

introspectionQuery :: Boolean -> SelectionSet RootQuery InstorpectionQueryResult
introspectionQuery includeDeprecated =
  __schema ado
    mt <- mutationType ado
      mt_name <- mutationType_name
      in { name: mt_name }
    qt <- queryType ado
      qt_name <- queryType_name
      qt_description <- queryType_description
      in { name: qt_name, description: qt_description }
    in { __schema: { mutationType: mt, queryType: qt } }

  -- (queryType $ { name: _, description: _ } <$> queryType_name <*> queryType_description)

  -- __schema $
  --   queryType queryType_name
  --   <|> mutationType mutationType_name
  --   <|> subscriptionType subscriptionType_name
  --   <|> (types $ types_kind <|> types_name <|> types_description)
