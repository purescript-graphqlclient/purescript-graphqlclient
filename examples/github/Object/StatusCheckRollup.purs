module Examples.Github.Object.StatusCheckRollup where

import GraphqlClient
  ( SelectionSet
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , Optional
  , toGraphqlArguments
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Examples.Github.Scopes
  ( Scope__Commit
  , Scope__StatusCheckRollup
  , Scope__StatusCheckRollupContextConnection
  )
import Data.Maybe (Maybe)
import Type.Row (type (+))
import Examples.Github.Scalars (Id)
import Examples.Github.Enum.StatusState (StatusState)

commit :: forall r . SelectionSet
                     Scope__Commit
                     r -> SelectionSet
                          Scope__StatusCheckRollup
                          (Maybe
                           r)
commit = selectionForCompositeField
         "commit"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type ContextsInputRowOptional r = ( after :: Optional String
                                  , before :: Optional String
                                  , first :: Optional Int
                                  , last :: Optional Int
                                  | r
                                  )

type ContextsInput = { | ContextsInputRowOptional + () }

contexts :: forall r . ContextsInput -> SelectionSet
                                        Scope__StatusCheckRollupContextConnection
                                        r -> SelectionSet
                                             Scope__StatusCheckRollup
                                             r
contexts input = selectionForCompositeField
                 "contexts"
                 (toGraphqlArguments
                  input)
                 graphqlDefaultResponseFunctorOrScalarDecoderTransformer

id :: SelectionSet Scope__StatusCheckRollup Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

state :: SelectionSet Scope__StatusCheckRollup StatusState
state = selectionForField "state" [] graphqlDefaultResponseScalarDecoder
