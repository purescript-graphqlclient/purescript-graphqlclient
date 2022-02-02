module Examples.Github.Object.Environment where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , Optional
  , selectionForCompositeField
  , toGraphQLArguments
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__Environment, Scope__DeploymentProtectionRuleConnection)
import Data.Maybe (Maybe)
import Examples.Github.Scalars (Id)
import Type.Row (type (+))

databaseId :: SelectionSet Scope__Environment (Maybe Int)
databaseId = selectionForField
             "databaseId"
             []
             graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__Environment Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

name :: SelectionSet Scope__Environment String
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

type ProtectionRulesInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type ProtectionRulesInput = { | ProtectionRulesInputRowOptional + () }

protectionRules
  :: forall r
   . ProtectionRulesInput
  -> SelectionSet Scope__DeploymentProtectionRuleConnection r
  -> SelectionSet Scope__Environment r
protectionRules input = selectionForCompositeField
                        "protectionRules"
                        (toGraphQLArguments
                         input)
                        graphqlDefaultResponseFunctorOrScalarDecoderTransformer
