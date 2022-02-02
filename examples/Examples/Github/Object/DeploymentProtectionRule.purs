module Examples.Github.Object.DeploymentProtectionRule where

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
  (Scope__DeploymentProtectionRule, Scope__DeploymentReviewerConnection)
import Data.Maybe (Maybe)
import Type.Row (type (+))
import Examples.Github.Enum.DeploymentProtectionRuleType
  (DeploymentProtectionRuleType)

databaseId :: SelectionSet Scope__DeploymentProtectionRule (Maybe Int)
databaseId = selectionForField
             "databaseId"
             []
             graphqlDefaultResponseScalarDecoder

type ReviewersInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type ReviewersInput = { | ReviewersInputRowOptional + () }

reviewers
  :: forall r
   . ReviewersInput
  -> SelectionSet Scope__DeploymentReviewerConnection r
  -> SelectionSet Scope__DeploymentProtectionRule r
reviewers input = selectionForCompositeField
                  "reviewers"
                  (toGraphQLArguments
                   input)
                  graphqlDefaultResponseFunctorOrScalarDecoderTransformer

timeout :: SelectionSet Scope__DeploymentProtectionRule Int
timeout = selectionForField "timeout" [] graphqlDefaultResponseScalarDecoder

type_
  :: SelectionSet
     Scope__DeploymentProtectionRule
     DeploymentProtectionRuleType
type_ = selectionForField "type" [] graphqlDefaultResponseScalarDecoder
