module Examples.Github.Union.SearchResultItem where

import GraphQLClient (SelectionSet, exhaustiveFragmentSelection, buildFragment)
import Examples.Github.Scopes
  ( Scope__App
  , Scope__Discussion
  , Scope__Issue
  , Scope__MarketplaceListing
  , Scope__Organization
  , Scope__PullRequest
  , Scope__Repository
  , Scope__User
  , Scope__SearchResultItem
  )
import Data.Maybe (Maybe(..))
import Prelude (pure)

type Fragments decodesTo
  = { onApp :: SelectionSet Scope__App decodesTo
    , onDiscussion :: SelectionSet Scope__Discussion decodesTo
    , onIssue :: SelectionSet Scope__Issue decodesTo
    , onMarketplaceListing :: SelectionSet Scope__MarketplaceListing decodesTo
    , onOrganization :: SelectionSet Scope__Organization decodesTo
    , onPullRequest :: SelectionSet Scope__PullRequest decodesTo
    , onRepository :: SelectionSet Scope__Repository decodesTo
    , onUser :: SelectionSet Scope__User decodesTo
    }

fragments
  :: forall decodesTo
   . Fragments decodesTo
  -> SelectionSet Scope__SearchResultItem decodesTo
fragments selections = exhaustiveFragmentSelection
                       [ buildFragment "App" selections.onApp
                       , buildFragment "Discussion" selections.onDiscussion
                       , buildFragment "Issue" selections.onIssue
                       , buildFragment
                         "MarketplaceListing"
                         selections.onMarketplaceListing
                       , buildFragment "Organization" selections.onOrganization
                       , buildFragment "PullRequest" selections.onPullRequest
                       , buildFragment "Repository" selections.onRepository
                       , buildFragment "User" selections.onUser
                       ]

maybeFragments :: forall decodesTo. Fragments (Maybe decodesTo)
maybeFragments = { onApp: pure
                          Nothing
                 , onDiscussion: pure
                                 Nothing
                 , onIssue: pure
                            Nothing
                 , onMarketplaceListing: pure
                                         Nothing
                 , onOrganization: pure
                                   Nothing
                 , onPullRequest: pure
                                  Nothing
                 , onRepository: pure
                                 Nothing
                 , onUser: pure
                           Nothing
                 }
