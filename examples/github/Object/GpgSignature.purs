module Examples.Github.Object.GpgSignature where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes (Scope__GpgSignature, Scope__User)
import Data.Maybe (Maybe)
import Examples.Github.Enum.GitSignatureState (GitSignatureState)

email :: SelectionSet Scope__GpgSignature String
email = selectionForField "email" [] graphqlDefaultResponseScalarDecoder

isValid :: SelectionSet Scope__GpgSignature Boolean
isValid = selectionForField "isValid" [] graphqlDefaultResponseScalarDecoder

keyId :: SelectionSet Scope__GpgSignature (Maybe String)
keyId = selectionForField "keyId" [] graphqlDefaultResponseScalarDecoder

payload :: SelectionSet Scope__GpgSignature String
payload = selectionForField "payload" [] graphqlDefaultResponseScalarDecoder

signature :: SelectionSet Scope__GpgSignature String
signature = selectionForField "signature" [] graphqlDefaultResponseScalarDecoder

signer :: forall r . SelectionSet
                     Scope__User
                     r -> SelectionSet
                          Scope__GpgSignature
                          (Maybe
                           r)
signer = selectionForCompositeField
         "signer"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

state :: SelectionSet Scope__GpgSignature GitSignatureState
state = selectionForField "state" [] graphqlDefaultResponseScalarDecoder

wasSignedByGitHub :: SelectionSet Scope__GpgSignature Boolean
wasSignedByGitHub = selectionForField
                    "wasSignedByGitHub"
                    []
                    graphqlDefaultResponseScalarDecoder
