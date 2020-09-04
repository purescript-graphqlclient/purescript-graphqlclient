module Examples.Github.Object.RenamedTitleEvent where

import GraphqlClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  ( Scope__Actor
  , Scope__RenamedTitleEvent
  , Scope__RenamedTitleSubject
  )
import Data.Maybe
  ( Maybe
  )
import Examples.Github.Scalars
  ( DateTime
  , Id
  )

actor :: forall r . SelectionSet Scope__Actor r -> SelectionSet Scope__RenamedTitleEvent (Maybe r)
actor = selectionForCompositeField "actor" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__RenamedTitleEvent DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

currentTitle :: SelectionSet Scope__RenamedTitleEvent String
currentTitle = selectionForField "currentTitle" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__RenamedTitleEvent Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

previousTitle :: SelectionSet Scope__RenamedTitleEvent String
previousTitle = selectionForField "previousTitle" [] graphqlDefaultResponseScalarDecoder

subject :: forall r . SelectionSet Scope__RenamedTitleSubject r -> SelectionSet Scope__RenamedTitleEvent r
subject = selectionForCompositeField "subject" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer
