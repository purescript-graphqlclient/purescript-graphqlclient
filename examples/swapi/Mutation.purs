module Examples.Swapi.Mutation where

import Prelude
import GraphqlClient
import Data.Maybe
import Examples.Swapi.InputObject
import Type.Row
import Examples.Swapi.Enum.Episode
import Examples.Swapi.Enum.Language
import Examples.Swapi.Enum.Phrase
import Examples.Swapi.Scopes
import Examples.SwapiCustomScalars

increment :: SelectionSet Scope__RootMutation Int
increment = selectionForField "increment" [] graphqlDefaultResponseScalarDecoder

type SendMessageInputRowRequired r = ( characterId :: Id
                                     , phrase :: Phrase
                                     | r
                                     )

type SendMessageInput = { | SendMessageInputRowRequired + () }

sendMessage :: forall r . SendMessageInput -> SelectionSet Scope__ChatMessage r -> SelectionSet Scope__RootMutation (Maybe r)
sendMessage input = selectionForCompositeField "sendMessage" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer
