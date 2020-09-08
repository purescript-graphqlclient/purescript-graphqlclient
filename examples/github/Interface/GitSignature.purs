module Examples.Github.Interface.GitSignature where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , exhaustiveFragmentSelection
  , buildFragment
  )
import Examples.Github.Scopes
  ( Scope__GitSignature
  , Scope__User
  , Scope__GpgSignature
  , Scope__SmimeSignature
  , Scope__UnknownSignature
  )
import Data.Maybe (Maybe(..))
import Examples.Github.Enum.GitSignatureState (GitSignatureState)
import Prelude (pure)

email :: SelectionSet Scope__GitSignature String
email = selectionForField "email" [] graphqlDefaultResponseScalarDecoder

isValid :: SelectionSet Scope__GitSignature Boolean
isValid = selectionForField "isValid" [] graphqlDefaultResponseScalarDecoder

payload :: SelectionSet Scope__GitSignature String
payload = selectionForField "payload" [] graphqlDefaultResponseScalarDecoder

signature :: SelectionSet Scope__GitSignature String
signature = selectionForField "signature" [] graphqlDefaultResponseScalarDecoder

signer :: forall r . SelectionSet
                     Scope__User
                     r -> SelectionSet
                          Scope__GitSignature
                          (Maybe
                           r)
signer = selectionForCompositeField
         "signer"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

state :: SelectionSet Scope__GitSignature GitSignatureState
state = selectionForField "state" [] graphqlDefaultResponseScalarDecoder

wasSignedByGitHub :: SelectionSet Scope__GitSignature Boolean
wasSignedByGitHub = selectionForField
                    "wasSignedByGitHub"
                    []
                    graphqlDefaultResponseScalarDecoder

type Fragments decodesTo = { onGpgSignature :: SelectionSet
                                               Scope__GpgSignature
                                               decodesTo
                           , onSmimeSignature :: SelectionSet
                                                 Scope__SmimeSignature
                                                 decodesTo
                           , onUnknownSignature :: SelectionSet
                                                   Scope__UnknownSignature
                                                   decodesTo
                           }

fragments :: forall decodesTo . Fragments
                                decodesTo -> SelectionSet
                                             Scope__GitSignature
                                             decodesTo
fragments selections = exhaustiveFragmentSelection
                       [ buildFragment "GpgSignature" selections.onGpgSignature
                       , buildFragment
                         "SmimeSignature"
                         selections.onSmimeSignature
                       , buildFragment
                         "UnknownSignature"
                         selections.onUnknownSignature
                       ]

maybeFragments :: forall decodesTo . Fragments (Maybe decodesTo)
maybeFragments = { onGpgSignature: pure
                                   Nothing
                 , onSmimeSignature: pure
                                     Nothing
                 , onUnknownSignature: pure
                                       Nothing
                 }
