module Examples.Github.Object.CrossReferencedEvent where

import GraphqlClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  ( Scope__Actor
  , Scope__CrossReferencedEvent
  , Scope__ReferencedSubject
  )
import Data.Maybe
  ( Maybe
  )
import Examples.Github.Scalars
  ( DateTime
  , Id
  , Uri
  )

actor :: forall r . SelectionSet Scope__Actor r -> SelectionSet Scope__CrossReferencedEvent (Maybe r)
actor = selectionForCompositeField "actor" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

createdAt :: SelectionSet Scope__CrossReferencedEvent DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__CrossReferencedEvent Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

isCrossRepository :: SelectionSet Scope__CrossReferencedEvent Boolean
isCrossRepository = selectionForField "isCrossRepository" [] graphqlDefaultResponseScalarDecoder

referencedAt :: SelectionSet Scope__CrossReferencedEvent DateTime
referencedAt = selectionForField "referencedAt" [] graphqlDefaultResponseScalarDecoder

resourcePath :: SelectionSet Scope__CrossReferencedEvent Uri
resourcePath = selectionForField "resourcePath" [] graphqlDefaultResponseScalarDecoder

source :: forall r . SelectionSet Scope__ReferencedSubject r -> SelectionSet Scope__CrossReferencedEvent r
source = selectionForCompositeField "source" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

target :: forall r . SelectionSet Scope__ReferencedSubject r -> SelectionSet Scope__CrossReferencedEvent r
target = selectionForCompositeField "target" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

url :: SelectionSet Scope__CrossReferencedEvent Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder

willCloseTarget :: SelectionSet Scope__CrossReferencedEvent Boolean
willCloseTarget = selectionForField "willCloseTarget" [] graphqlDefaultResponseScalarDecoder
