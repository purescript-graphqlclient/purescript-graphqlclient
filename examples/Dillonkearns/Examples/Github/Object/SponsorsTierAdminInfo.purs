module Dillonkearns.Examples.Github.Object.SponsorsTierAdminInfo where

import Dillonkearns.GraphQLClient
  ( Optional
  , SelectionSet
  , selectionForCompositeField
  , toGraphQLArguments
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Dillonkearns.Examples.Github.InputObject (SponsorshipOrder) as Dillonkearns.Examples.Github.InputObject
import Type.Row (type (+))
import Dillonkearns.Examples.Github.Scopes
  (Scope__SponsorshipConnection, Scope__SponsorsTierAdminInfo)

type SponsorshipsInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , includePrivate :: Optional Boolean
    , orderBy
      :: Optional
         Dillonkearns.Examples.Github.InputObject.SponsorshipOrder
    | r
    )

type SponsorshipsInput = { | SponsorshipsInputRowOptional + () }

sponsorships
  :: forall r
   . SponsorshipsInput
  -> SelectionSet Scope__SponsorshipConnection r
  -> SelectionSet Scope__SponsorsTierAdminInfo r
sponsorships input = selectionForCompositeField
                     "sponsorships"
                     (toGraphQLArguments
                      input)
                     graphqlDefaultResponseFunctorOrScalarDecoderTransformer
