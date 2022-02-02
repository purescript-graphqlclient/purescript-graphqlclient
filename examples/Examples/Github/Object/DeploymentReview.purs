module Examples.Github.Object.DeploymentReview where

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
  (Scope__DeploymentReview, Scope__EnvironmentConnection, Scope__User)
import Data.Maybe (Maybe)
import Type.Row (type (+))
import Examples.Github.Scalars (Id)
import Examples.Github.Enum.DeploymentReviewState (DeploymentReviewState)

comment :: SelectionSet Scope__DeploymentReview String
comment = selectionForField "comment" [] graphqlDefaultResponseScalarDecoder

databaseId :: SelectionSet Scope__DeploymentReview (Maybe Int)
databaseId = selectionForField
             "databaseId"
             []
             graphqlDefaultResponseScalarDecoder

type EnvironmentsInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    | r
    )

type EnvironmentsInput = { | EnvironmentsInputRowOptional + () }

environments
  :: forall r
   . EnvironmentsInput
  -> SelectionSet Scope__EnvironmentConnection r
  -> SelectionSet Scope__DeploymentReview r
environments input = selectionForCompositeField
                     "environments"
                     (toGraphQLArguments
                      input)
                     graphqlDefaultResponseFunctorOrScalarDecoderTransformer

id :: SelectionSet Scope__DeploymentReview Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

state :: SelectionSet Scope__DeploymentReview DeploymentReviewState
state = selectionForField "state" [] graphqlDefaultResponseScalarDecoder

user
  :: forall r
   . SelectionSet Scope__User r
  -> SelectionSet Scope__DeploymentReview r
user = selectionForCompositeField
       "user"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
