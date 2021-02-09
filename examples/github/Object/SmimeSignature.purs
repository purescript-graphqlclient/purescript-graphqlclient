module Examples.Github.Object.SmimeSignature where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes (Scope__SmimeSignature, Scope__User)
import Data.Maybe (Maybe)
import Examples.Github.Enum.GitSignatureState (GitSignatureState)

email :: SelectionSet Scope__SmimeSignature String
email = selectionForField "email" [] graphqlDefaultResponseScalarDecoder

isValid :: SelectionSet Scope__SmimeSignature Boolean
isValid = selectionForField "isValid" [] graphqlDefaultResponseScalarDecoder

payload :: SelectionSet Scope__SmimeSignature String
payload = selectionForField "payload" [] graphqlDefaultResponseScalarDecoder

signature :: SelectionSet Scope__SmimeSignature String
signature = selectionForField "signature" [] graphqlDefaultResponseScalarDecoder

signer
  :: forall r
   . SelectionSet Scope__User r
  -> SelectionSet Scope__SmimeSignature (Maybe r)
signer = selectionForCompositeField
         "signer"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

state :: SelectionSet Scope__SmimeSignature GitSignatureState
state = selectionForField "state" [] graphqlDefaultResponseScalarDecoder

wasSignedByGitHub :: SelectionSet Scope__SmimeSignature Boolean
wasSignedByGitHub = selectionForField
                    "wasSignedByGitHub"
                    []
                    graphqlDefaultResponseScalarDecoder
