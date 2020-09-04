module Examples.Github.Object.GitActor where

import GraphqlClient
  ( Optional
  , SelectionSet
  , selectionForField
  , toGraphqlArguments
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Type.Row
  ( type (+)
  )
import Examples.Github.Scopes
  ( Scope__GitActor
  , Scope__User
  )
import Examples.Github.Scalars
  ( Uri
  , GitTimestamp
  )
import Data.Maybe
  ( Maybe
  )

type AvatarUrlInputRowOptional r = ( size :: Optional Int
                                   | r
                                   )

type AvatarUrlInput = { | AvatarUrlInputRowOptional + () }

avatarUrl :: AvatarUrlInput -> SelectionSet Scope__GitActor Uri
avatarUrl input = selectionForField "avatarUrl" (toGraphqlArguments input) graphqlDefaultResponseScalarDecoder

date :: SelectionSet Scope__GitActor (Maybe GitTimestamp)
date = selectionForField "date" [] graphqlDefaultResponseScalarDecoder

email :: SelectionSet Scope__GitActor (Maybe String)
email = selectionForField "email" [] graphqlDefaultResponseScalarDecoder

name :: SelectionSet Scope__GitActor (Maybe String)
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

user :: forall r . SelectionSet Scope__User r -> SelectionSet Scope__GitActor (Maybe r)
user = selectionForCompositeField "user" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer
