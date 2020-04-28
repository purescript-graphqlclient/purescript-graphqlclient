module Fernet.Introspection.IntrospectionSchema where

import Fernet.Graphql.SelectionSet
import Protolude hiding ((<|>))

type InstorpectionQueryResult
  = { __schema ::
      { queryType :: { name :: String, description :: String }
      }
    }
  --     -- , mutationType :: Maybe { name :: String }
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

__schema :: ∀ r . SelectionSet InstorpectionQueryResult_Schema r -> SelectionSet RootQuery { __schema :: r }
__schema s = selectionForCompositeField "__schema" [] s (map $ map $ { __schema: _ })

queryType :: ∀ r . SelectionSet InstorpectionQueryResult_QueryType r -> SelectionSet InstorpectionQueryResult_Schema { queryType :: r }
queryType s = selectionForCompositeField "queryType" [] s (map $ map $ { queryType: _ })

queryType_name :: SelectionSet InstorpectionQueryResult_QueryType String
queryType_name = noArgs "name"

queryType_description :: SelectionSet InstorpectionQueryResult_QueryType String
queryType_description = noArgs "description"

-- mutationType :: ∀ r.  SelectionSet r InstorpectionQueryResult_MutationType -> SelectionSet InstorpectionQueryResult_Schema ( mutationType :: Maybe (Record r) )
-- mutationType (SelectionSet fields) = SelectionSet [ Composite "mutationType" [] fields ]

-- mutationType_name :: SelectionSet InstorpectionQueryResult_MutationType ( name :: String )
-- mutationType_name = noArgs "name"

-- subscriptionType :: ∀ r.  SelectionSet r InstorpectionQueryResult_SubscriptionType -> SelectionSet InstorpectionQueryResult_Schema ( subscriptionType :: Maybe (Record r) )
-- subscriptionType (SelectionSet fields) = SelectionSet [ Composite "subscriptionType" [] fields ]

-- subscriptionType_name :: SelectionSet InstorpectionQueryResult_SubscriptionType ( name :: String )
-- subscriptionType_name = noArgs "name"

-- types :: ∀ r.  SelectionSet r InstorpectionQueryResult_Types -> SelectionSet InstorpectionQueryResult_Schema ( types :: Array (Record r) )
-- types (SelectionSet fields) = SelectionSet [ Composite "types" [] fields ]

-- types_kind :: SelectionSet InstorpectionQueryResult_Types ( kind :: String )
-- types_kind = noArgs "kind"

-- types_name :: SelectionSet InstorpectionQueryResult_Types ( name :: String )
-- types_name = noArgs "name"

-- types_description :: SelectionSet RootQuery String
-- types_description = noArgs "description"

introspectionQuery :: Boolean -> SelectionSet RootQuery InstorpectionQueryResult
introspectionQuery includeDeprecated = __schema $ queryType $ map2 (\x y -> { name: x, description: y }) queryType_name queryType_description
  -- __schema $
  --   queryType queryType_name
  --   <|> mutationType mutationType_name
  --   <|> subscriptionType subscriptionType_name
  --   <|> (types $ types_kind <|> types_name <|> types_description)
