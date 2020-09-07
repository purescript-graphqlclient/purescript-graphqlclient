module Examples.Swapi.Mutation where

import GraphQLClient
  ( SelectionSet
  , Scope__RootMutation
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , toGraphQLArguments
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.SwapiCustomScalars (Id)
import Examples.Swapi.Enum.Phrase (Phrase)
import Type.Row (type (+))
import Examples.Swapi.Scopes (Scope__ChatMessage)
import Data.Maybe (Maybe)

increment :: SelectionSet Scope__RootMutation Int
increment = selectionForField "increment" [] graphqlDefaultResponseScalarDecoder

type SendMessageInputRowRequired r = ( characterId :: Id, phrase :: Phrase | r )

type SendMessageInput = { | SendMessageInputRowRequired + () }

sendMessage :: forall r . SendMessageInput -> SelectionSet
                                              Scope__ChatMessage
                                              r -> SelectionSet
                                                   Scope__RootMutation
                                                   (Maybe
                                                    r)
sendMessage input = selectionForCompositeField
                    "sendMessage"
                    (toGraphQLArguments
                     input)
                    graphqlDefaultResponseFunctorOrScalarDecoderTransformer
