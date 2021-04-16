module Examples.Github.Interface.MemberStatusable where

import GraphQLClient
  ( Optional
  , SelectionSet
  , selectionForCompositeField
  , toGraphQLArguments
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , exhaustiveFragmentSelection
  , buildFragment
  )
import Examples.Github.InputObject (UserStatusOrder) as Examples.Github.InputObject
import Type.Row (type (+))
import Examples.Github.Scopes
  ( Scope__UserStatusConnection
  , Scope__MemberStatusable
  , Scope__Organization
  , Scope__Team
  )
import Data.Maybe (Maybe(..))
import Prelude (pure)

type MemberStatusesInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , orderBy :: Optional Examples.Github.InputObject.UserStatusOrder
    | r
    )

type MemberStatusesInput = { | MemberStatusesInputRowOptional + () }

memberStatuses
  :: forall r
   . MemberStatusesInput
  -> SelectionSet Scope__UserStatusConnection r
  -> SelectionSet Scope__MemberStatusable r
memberStatuses input = selectionForCompositeField
                       "memberStatuses"
                       (toGraphQLArguments
                        input)
                       graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type Fragments decodesTo
  = { onOrganization :: SelectionSet Scope__Organization decodesTo
    , onTeam :: SelectionSet Scope__Team decodesTo
    }

fragments
  :: forall decodesTo
   . Fragments decodesTo
  -> SelectionSet Scope__MemberStatusable decodesTo
fragments selections = exhaustiveFragmentSelection
                       [ buildFragment "Organization" selections.onOrganization
                       , buildFragment "Team" selections.onTeam
                       ]

maybeFragments :: forall decodesTo. Fragments (Maybe decodesTo)
maybeFragments = { onOrganization: pure Nothing, onTeam: pure Nothing }
