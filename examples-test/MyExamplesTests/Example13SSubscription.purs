module MyExamplesTests.Example13SSubscription where

import Protolude

import MyExamplesTests.Util (inlineAndTrim)
import Examples.Swapi.Scopes (Scope__ChatMessage)

import Examples.Swapi.Interface.Character as Examples.Swapi.Interface.Character
import Examples.Swapi.Object.ChatMessage as Examples.Swapi.Object.ChatMessage
import Examples.Swapi.Mutation as Mutation
import Examples.Swapi.Subscription as Subscription
import Examples.SwapiCustomScalars (Id(..))
import Examples.Swapi.Enum.Phrase (Phrase(..))
import GraphQLClient (GraphQLError, Scope__RootMutation, Scope__RootSubscription, SelectionSet, graphqlMutationRequest, printGraphQLError, writeGraphQL)
import GraphQLClient as GraphQLClient
import Test.Spec (Spec, it) as Test.Spec
import Test.Spec.Assertions (shouldEqual) as Test.Spec

chatMessage :: SelectionSet Scope__ChatMessage MutationResponse
chatMessage = ado
  character <- Examples.Swapi.Object.ChatMessage.character Examples.Swapi.Interface.Character.id
  phrase <- Examples.Swapi.Object.ChatMessage.phrase
  in { character, phrase }

-------------------------

type MutationResponse =
  { character :: Maybe Id
  , phrase :: Phrase
  }

mutation :: SelectionSet Scope__RootMutation MutationResponse
mutation = Mutation.sendMessage { characterId: Id 1, phrase: Father } chatMessage
  # GraphQLClient.nonNullOrFail

expectedMutation :: String
expectedMutation = inlineAndTrim """
mutation {
  sendMessage1125234857: sendMessage(characterId: "1", phrase: FATHER) {
    character {
      id
    }
    phrase
  }
}
"""

-------------------------

type SubscriptionResponse =
  { character :: Maybe Id
  , phrase :: Phrase
  }

subscription :: SelectionSet Scope__RootSubscription SubscriptionResponse
subscription = Subscription.newMessage chatMessage

expectedSubscription :: String
expectedSubscription = inlineAndTrim """
subscription {
  newMessage {
    character {
      id
    }
    phrase
  }
}
"""

spec :: Test.Spec.Spec Unit
spec = Test.Spec.it "Example13SSubscription" do
  writeGraphQL mutation `Test.Spec.shouldEqual` expectedMutation
  writeGraphQL subscription `Test.Spec.shouldEqual` expectedSubscription

  ----------------

  (response :: Either (GraphQLError MutationResponse) MutationResponse) <- graphqlMutationRequest "https://elm-graphql.herokuapp.com" [] mutation

  response' <- (throwError <<< error <<< printGraphQLError) \/ pure $ response

  response'.character `Test.Spec.shouldEqual` Nothing

  (response'.phrase == Father) `Test.Spec.shouldEqual` true

  ----------------

  -- | websocket <- liftEffect $ Web.Socket.WebSocket.create "wss://elm-graphql.herokuapp.com/socket" []

  -- | traceM "starting"
  -- | liftEffect $ Web.Socket.WebSocket.readyState websocket >>= traceM

  -- | void $ forkAff do
  -- |    delay (Milliseconds 3000.0)
  -- |    traceM "killing"
  -- |    liftEffect $ Web.Socket.WebSocket.readyState websocket >>= traceM
  -- |    liftEffect $ Web.Socket.WebSocket.close websocket
