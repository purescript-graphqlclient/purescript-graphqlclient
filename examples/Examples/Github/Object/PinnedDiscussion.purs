module Examples.Github.Object.PinnedDiscussion where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__PinnedDiscussion, Scope__Discussion, Scope__Actor, Scope__Repository)
import Examples.Github.Scalars (DateTime, Id)
import Data.Maybe (Maybe)
import Examples.Github.Enum.PinnedDiscussionPattern (PinnedDiscussionPattern)
import Examples.Github.Enum.PinnedDiscussionGradient (PinnedDiscussionGradient)

createdAt :: SelectionSet Scope__PinnedDiscussion DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

databaseId :: SelectionSet Scope__PinnedDiscussion (Maybe Int)
databaseId = selectionForField
             "databaseId"
             []
             graphqlDefaultResponseScalarDecoder

discussion
  :: forall r
   . SelectionSet Scope__Discussion r
  -> SelectionSet Scope__PinnedDiscussion r
discussion = selectionForCompositeField
             "discussion"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

gradientStopColors :: SelectionSet Scope__PinnedDiscussion (Array String)
gradientStopColors = selectionForField
                     "gradientStopColors"
                     []
                     graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__PinnedDiscussion Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

pattern :: SelectionSet Scope__PinnedDiscussion PinnedDiscussionPattern
pattern = selectionForField "pattern" [] graphqlDefaultResponseScalarDecoder

pinnedBy
  :: forall r
   . SelectionSet Scope__Actor r
  -> SelectionSet Scope__PinnedDiscussion r
pinnedBy = selectionForCompositeField
           "pinnedBy"
           []
           graphqlDefaultResponseFunctorOrScalarDecoderTransformer

preconfiguredGradient
  :: SelectionSet
     Scope__PinnedDiscussion
     (Maybe PinnedDiscussionGradient)
preconfiguredGradient = selectionForField
                        "preconfiguredGradient"
                        []
                        graphqlDefaultResponseScalarDecoder

repository
  :: forall r
   . SelectionSet Scope__Repository r
  -> SelectionSet Scope__PinnedDiscussion r
repository = selectionForCompositeField
             "repository"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

updatedAt :: SelectionSet Scope__PinnedDiscussion DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder
