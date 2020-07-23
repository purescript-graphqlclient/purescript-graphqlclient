module Examples.Github.Interface.Actor where

import GraphqlClient
  ( Optional
  , SelectionSet
  , selectionForField
  , toGraphqlArguments
  , graphqlDefaultResponseScalarDecoder
  , exhaustiveFragmentSelection
  , buildFragment
  )
import Type.Row
  ( type (+)
  )
import Examples.Github.Scopes
  ( Scope__Actor
  , Scope__Bot
  , Scope__EnterpriseUserAccount
  , Scope__Mannequin
  , Scope__Organization
  , Scope__User
  )
import Examples.Github.Scalars
  ( Uri
  )
import Data.Maybe
  ( Maybe(..)
  )
import Prelude
  ( pure
  )

type AvatarUrlInputRowOptional r = ( size :: Optional Int
                                   | r
                                   )

type AvatarUrlInput = { | AvatarUrlInputRowOptional + () }

avatarUrl :: AvatarUrlInput -> SelectionSet Scope__Actor Uri
avatarUrl input = selectionForField "avatarUrl" (toGraphqlArguments input) graphqlDefaultResponseScalarDecoder

login :: SelectionSet Scope__Actor String
login = selectionForField "login" [] graphqlDefaultResponseScalarDecoder

resourcePath :: SelectionSet Scope__Actor Uri
resourcePath = selectionForField "resourcePath" [] graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__Actor Uri
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder

type Fragments decodesTo = { onBot :: SelectionSet Scope__Bot decodesTo
                           , onEnterpriseUserAccount :: SelectionSet Scope__EnterpriseUserAccount decodesTo
                           , onMannequin :: SelectionSet Scope__Mannequin decodesTo
                           , onOrganization :: SelectionSet Scope__Organization decodesTo
                           , onUser :: SelectionSet Scope__User decodesTo
                           }

fragments :: forall decodesTo . Fragments decodesTo -> SelectionSet Scope__Actor decodesTo
fragments selections = exhaustiveFragmentSelection [buildFragment "Bot" selections.onBot, buildFragment "EnterpriseUserAccount" selections.onEnterpriseUserAccount, buildFragment "Mannequin" selections.onMannequin, buildFragment "Organization" selections.onOrganization, buildFragment "User" selections.onUser]

maybeFragments :: forall decodesTo . Fragments (Maybe decodesTo)
maybeFragments = { onBot: pure Nothing, onEnterpriseUserAccount: pure Nothing, onMannequin: pure Nothing, onOrganization: pure Nothing, onUser: pure Nothing }
