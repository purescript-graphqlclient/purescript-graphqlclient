module Examples.Github.Interface.ProjectOwner where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , toGraphQLArguments
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , Optional
  , exhaustiveFragmentSelection
  , buildFragment
  )
import Examples.Github.Scopes
  ( Scope__ProjectOwner
  , Scope__Project
  , Scope__ProjectConnection
  , Scope__Organization
  , Scope__Repository
  , Scope__User
  )
import Examples.Github.Scalars (Id, Uri)
import Type.Row (type (+))
import Data.Maybe (Maybe(..))
import Examples.Github.InputObject (ProjectOrder) as Examples.Github.InputObject
import Examples.Github.Enum.ProjectState (ProjectState)
import Prelude (pure)

id :: SelectionSet Scope__ProjectOwner Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

type ProjectInputRowRequired r = ( number :: Int | r )

type ProjectInput = { | ProjectInputRowRequired + () }

project :: forall r . ProjectInput -> SelectionSet
                                      Scope__Project
                                      r -> SelectionSet
                                           Scope__ProjectOwner
                                           (Maybe
                                            r)
project input = selectionForCompositeField
                "project"
                (toGraphQLArguments
                 input)
                graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type ProjectsInputRowOptional r = ( orderBy :: Optional
                                               Examples.Github.InputObject.ProjectOrder
                                  , search :: Optional String
                                  , states :: Optional (Array ProjectState)
                                  , after :: Optional String
                                  , before :: Optional String
                                  , first :: Optional Int
                                  , last :: Optional Int
                                  | r
                                  )

type ProjectsInput = { | ProjectsInputRowOptional + () }

projects :: forall r . ProjectsInput -> SelectionSet
                                        Scope__ProjectConnection
                                        r -> SelectionSet
                                             Scope__ProjectOwner
                                             r
projects input = selectionForCompositeField
                 "projects"
                 (toGraphQLArguments
                  input)
                 graphqlDefaultResponseFunctorOrScalarDecoderTransformer

projectsResourcePath :: SelectionSet Scope__ProjectOwner Uri
projectsResourcePath = selectionForField
                       "projectsResourcePath"
                       []
                       graphqlDefaultResponseScalarDecoder

projectsUrl :: SelectionSet Scope__ProjectOwner Uri
projectsUrl = selectionForField
              "projectsUrl"
              []
              graphqlDefaultResponseScalarDecoder

viewerCanCreateProjects :: SelectionSet Scope__ProjectOwner Boolean
viewerCanCreateProjects = selectionForField
                          "viewerCanCreateProjects"
                          []
                          graphqlDefaultResponseScalarDecoder

type Fragments decodesTo = { onOrganization :: SelectionSet
                                               Scope__Organization
                                               decodesTo
                           , onRepository :: SelectionSet
                                             Scope__Repository
                                             decodesTo
                           , onUser :: SelectionSet Scope__User decodesTo
                           }

fragments :: forall decodesTo . Fragments
                                decodesTo -> SelectionSet
                                             Scope__ProjectOwner
                                             decodesTo
fragments selections = exhaustiveFragmentSelection
                       [ buildFragment "Organization" selections.onOrganization
                       , buildFragment "Repository" selections.onRepository
                       , buildFragment "User" selections.onUser
                       ]

maybeFragments :: forall decodesTo . Fragments (Maybe decodesTo)
maybeFragments = { onOrganization: pure
                                   Nothing
                 , onRepository: pure
                                 Nothing
                 , onUser: pure
                           Nothing
                 }
