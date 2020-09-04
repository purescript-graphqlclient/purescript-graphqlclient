module Examples.Github.Interface.HovercardContext where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , exhaustiveFragmentSelection
  , buildFragment
  )
import Examples.Github.Scopes
  ( Scope__HovercardContext
  , Scope__GenericHovercardContext
  , Scope__OrganizationTeamsHovercardContext
  , Scope__OrganizationsHovercardContext
  , Scope__ReviewStatusHovercardContext
  , Scope__ViewerHovercardContext
  )
import Data.Maybe
  ( Maybe(..)
  )
import Prelude
  ( pure
  )

message :: SelectionSet Scope__HovercardContext String
message = selectionForField "message" [] graphqlDefaultResponseScalarDecoder

octicon :: SelectionSet Scope__HovercardContext String
octicon = selectionForField "octicon" [] graphqlDefaultResponseScalarDecoder

type Fragments decodesTo = { onGenericHovercardContext :: SelectionSet Scope__GenericHovercardContext decodesTo
                           , onOrganizationTeamsHovercardContext :: SelectionSet Scope__OrganizationTeamsHovercardContext decodesTo
                           , onOrganizationsHovercardContext :: SelectionSet Scope__OrganizationsHovercardContext decodesTo
                           , onReviewStatusHovercardContext :: SelectionSet Scope__ReviewStatusHovercardContext decodesTo
                           , onViewerHovercardContext :: SelectionSet Scope__ViewerHovercardContext decodesTo
                           }

fragments :: forall decodesTo . Fragments decodesTo -> SelectionSet Scope__HovercardContext decodesTo
fragments selections = exhaustiveFragmentSelection [buildFragment "GenericHovercardContext" selections.onGenericHovercardContext, buildFragment "OrganizationTeamsHovercardContext" selections.onOrganizationTeamsHovercardContext, buildFragment "OrganizationsHovercardContext" selections.onOrganizationsHovercardContext, buildFragment "ReviewStatusHovercardContext" selections.onReviewStatusHovercardContext, buildFragment "ViewerHovercardContext" selections.onViewerHovercardContext]

maybeFragments :: forall decodesTo . Fragments (Maybe decodesTo)
maybeFragments = { onGenericHovercardContext: pure Nothing, onOrganizationTeamsHovercardContext: pure Nothing, onOrganizationsHovercardContext: pure Nothing, onReviewStatusHovercardContext: pure Nothing, onViewerHovercardContext: pure Nothing }
