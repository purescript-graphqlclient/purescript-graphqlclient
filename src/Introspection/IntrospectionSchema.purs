module Fernet.Introspection.IntrospectionSchema where

import Protolude hiding ((<|>))

import Fernet.GraphQL.SelectionSet

type InstorpectionQueryResult
  = ( __schema ::
      { queryType :: { name :: String }
      , mutationType :: Maybe { name :: String }
      , subscriptionType :: Maybe { name :: String }
      , types :: Array InstorpectionQueryResult__FullType
      }
    )

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

__schema :: ∀ r.  SelectionSet r InstorpectionQueryResult_Schema -> SelectionSet ( __schema :: Record r ) RootQuery
__schema (SelectionSet fields) = SelectionSet [ Composite "__schema" [] fields ]

queryType :: ∀ r.  SelectionSet r InstorpectionQueryResult_QueryType -> SelectionSet ( queryType :: Record r ) InstorpectionQueryResult_Schema
queryType (SelectionSet fields) = SelectionSet [ Composite "queryType" [] fields ]

queryType_name :: SelectionSet ( name :: String ) InstorpectionQueryResult_QueryType
queryType_name = noArgs "name"

mutationType :: ∀ r.  SelectionSet r InstorpectionQueryResult_MutationType -> SelectionSet ( mutationType :: Maybe (Record r) ) InstorpectionQueryResult_Schema
mutationType (SelectionSet fields) = SelectionSet [ Composite "mutationType" [] fields ]

mutationType_name :: SelectionSet ( name :: String ) InstorpectionQueryResult_MutationType
mutationType_name = noArgs "name"

subscriptionType :: ∀ r.  SelectionSet r InstorpectionQueryResult_SubscriptionType -> SelectionSet ( subscriptionType :: Maybe (Record r) ) InstorpectionQueryResult_Schema
subscriptionType (SelectionSet fields) = SelectionSet [ Composite "subscriptionType" [] fields ]

subscriptionType_name :: SelectionSet ( name :: String ) InstorpectionQueryResult_SubscriptionType
subscriptionType_name = noArgs "name"

types :: ∀ r.  SelectionSet r InstorpectionQueryResult_Types -> SelectionSet ( types :: Array (Record r) ) InstorpectionQueryResult_Schema
types (SelectionSet fields) = SelectionSet [ Composite "types" [] fields ]

types_kind :: SelectionSet ( kind :: String ) InstorpectionQueryResult_Types
types_kind = noArgs "kind"

types_name :: SelectionSet ( name :: String ) InstorpectionQueryResult_Types
types_name = noArgs "name"

types_description :: SelectionSet ( description :: String ) InstorpectionQueryResult_Types
types_description = noArgs "description"

introspectionQuery :: Boolean -> SelectionSet InstorpectionQueryResult RootQuery
introspectionQuery includeDeprecated =
  __schema $
    queryType queryType_name
    <|> mutationType mutationType_name
    <|> subscriptionType subscriptionType_name
    <|> (types $ types_kind <|> types_name <|> types_description)
