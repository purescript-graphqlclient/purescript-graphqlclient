module Examples.Github.Interface.PackageOwner where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , Optional
  , selectionForCompositeField
  , toGraphqlArguments
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , exhaustiveFragmentSelection
  , buildFragment
  )
import Examples.Github.Scopes
  ( Scope__PackageOwner
  , Scope__PackageConnection
  , Scope__Organization
  , Scope__Repository
  , Scope__User
  )
import Examples.Github.Scalars
  ( Id
  )
import Data.Maybe
  ( Maybe(..)
  )
import Examples.Github.Enum.PackageType
  ( PackageType
  )
import Examples.Github.InputObject
  ( PackageOrder
  ) as Examples.Github.InputObject
import Type.Row
  ( type (+)
  )
import Prelude
  ( pure
  )

id :: SelectionSet Scope__PackageOwner Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

type PackagesInputRowOptional r = ( after :: Optional String
                                  , before :: Optional String
                                  , first :: Optional Int
                                  , last :: Optional Int
                                  , names :: Optional (Array (Maybe String))
                                  , repositoryId :: Optional Id
                                  , packageType :: Optional PackageType
                                  , orderBy :: Optional Examples.Github.InputObject.PackageOrder
                                  | r
                                  )

type PackagesInput = { | PackagesInputRowOptional + () }

packages :: forall r . PackagesInput -> SelectionSet Scope__PackageConnection r -> SelectionSet Scope__PackageOwner r
packages input = selectionForCompositeField "packages" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type Fragments decodesTo = { onOrganization :: SelectionSet Scope__Organization decodesTo
                           , onRepository :: SelectionSet Scope__Repository decodesTo
                           , onUser :: SelectionSet Scope__User decodesTo
                           }

fragments :: forall decodesTo . Fragments decodesTo -> SelectionSet Scope__PackageOwner decodesTo
fragments selections = exhaustiveFragmentSelection [buildFragment "Organization" selections.onOrganization, buildFragment "Repository" selections.onRepository, buildFragment "User" selections.onUser]

maybeFragments :: forall decodesTo . Fragments (Maybe decodesTo)
maybeFragments = { onOrganization: pure Nothing, onRepository: pure Nothing, onUser: pure Nothing }
