module Dillonkearns.Examples.Github.Object.UserStatus where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__UserStatus, Scope__Organization, Scope__User)
import Dillonkearns.Examples.Github.Scalars (DateTime, Html, Id)
import Data.Maybe (Maybe)

createdAt :: SelectionSet Scope__UserStatus DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

emoji :: SelectionSet Scope__UserStatus (Maybe String)
emoji = selectionForField "emoji" [] graphqlDefaultResponseScalarDecoder

emojiHTML :: SelectionSet Scope__UserStatus (Maybe Html)
emojiHTML = selectionForField "emojiHTML" [] graphqlDefaultResponseScalarDecoder

expiresAt :: SelectionSet Scope__UserStatus (Maybe DateTime)
expiresAt = selectionForField "expiresAt" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__UserStatus Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

indicatesLimitedAvailability :: SelectionSet Scope__UserStatus Boolean
indicatesLimitedAvailability = selectionForField
                               "indicatesLimitedAvailability"
                               []
                               graphqlDefaultResponseScalarDecoder

message :: SelectionSet Scope__UserStatus (Maybe String)
message = selectionForField "message" [] graphqlDefaultResponseScalarDecoder

organization
  :: forall r
   . SelectionSet Scope__Organization r
  -> SelectionSet Scope__UserStatus (Maybe r)
organization = selectionForCompositeField
               "organization"
               []
               graphqlDefaultResponseFunctorOrScalarDecoderTransformer

updatedAt :: SelectionSet Scope__UserStatus DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder

user :: forall r. SelectionSet Scope__User r -> SelectionSet Scope__UserStatus r
user = selectionForCompositeField
       "user"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer
