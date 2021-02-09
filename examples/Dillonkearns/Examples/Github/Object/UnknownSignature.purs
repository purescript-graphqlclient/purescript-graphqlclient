module Dillonkearns.Examples.Github.Object.UnknownSignature where

import Dillonkearns.GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.Scopes
  (Scope__UnknownSignature, Scope__User)
import Data.Maybe (Maybe)
import Dillonkearns.Examples.Github.Enum.GitSignatureState (GitSignatureState)

email :: SelectionSet Scope__UnknownSignature String
email = selectionForField "email" [] graphqlDefaultResponseScalarDecoder

isValid :: SelectionSet Scope__UnknownSignature Boolean
isValid = selectionForField "isValid" [] graphqlDefaultResponseScalarDecoder

payload :: SelectionSet Scope__UnknownSignature String
payload = selectionForField "payload" [] graphqlDefaultResponseScalarDecoder

signature :: SelectionSet Scope__UnknownSignature String
signature = selectionForField "signature" [] graphqlDefaultResponseScalarDecoder

signer
  :: forall r
   . SelectionSet Scope__User r
  -> SelectionSet Scope__UnknownSignature (Maybe r)
signer = selectionForCompositeField
         "signer"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

state :: SelectionSet Scope__UnknownSignature GitSignatureState
state = selectionForField "state" [] graphqlDefaultResponseScalarDecoder

wasSignedByGitHub :: SelectionSet Scope__UnknownSignature Boolean
wasSignedByGitHub = selectionForField
                    "wasSignedByGitHub"
                    []
                    graphqlDefaultResponseScalarDecoder
