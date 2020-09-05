module Examples.Github.Object.Status where

import GraphqlClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , toGraphqlArguments
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  (Scope__Commit, Scope__Status, Scope__StatusContext)
import Data.Maybe (Maybe)
import Type.Row (type (+))
import Examples.Github.Scalars (Id)
import Examples.Github.Enum.StatusState (StatusState)

commit :: forall r . SelectionSet
                     Scope__Commit
                     r -> SelectionSet
                          Scope__Status
                          (Maybe
                           r)
commit = selectionForCompositeField
         "commit"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type ContextInputRowRequired r = ( name :: String | r )

type ContextInput = { | ContextInputRowRequired + () }

context :: forall r . ContextInput -> SelectionSet
                                      Scope__StatusContext
                                      r -> SelectionSet
                                           Scope__Status
                                           (Maybe
                                            r)
context input = selectionForCompositeField
                "context"
                (toGraphqlArguments
                 input)
                graphqlDefaultResponseFunctorOrScalarDecoderTransformer

contexts :: forall r . SelectionSet
                       Scope__StatusContext
                       r -> SelectionSet
                            Scope__Status
                            (Array
                             r)
contexts = selectionForCompositeField
           "contexts"
           []
           graphqlDefaultResponseFunctorOrScalarDecoderTransformer

id :: SelectionSet Scope__Status Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

state :: SelectionSet Scope__Status StatusState
state = selectionForField "state" [] graphqlDefaultResponseScalarDecoder
