module Examples.Github.Object.SponsorsTierAdminInfo where

import GraphqlClient
  ( Optional
  , SelectionSet
  , selectionForCompositeField
  , toGraphqlArguments
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.InputObject (SponsorshipOrder) as Examples.Github.InputObject
import Type.Row (type (+))
import Examples.Github.Scopes
  (Scope__SponsorshipConnection, Scope__SponsorsTierAdminInfo)

type SponsorshipsInputRowOptional r = ( after :: Optional
                                                 String
                                      , before :: Optional String
                                      , first :: Optional Int
                                      , last :: Optional Int
                                      , includePrivate :: Optional Boolean
                                      , orderBy :: Optional
                                                   Examples.Github.InputObject.SponsorshipOrder
                                      | r
                                      )

type SponsorshipsInput = { | SponsorshipsInputRowOptional + () }

sponsorships :: forall r . SponsorshipsInput -> SelectionSet
                                                Scope__SponsorshipConnection
                                                r -> SelectionSet
                                                     Scope__SponsorsTierAdminInfo
                                                     r
sponsorships input = selectionForCompositeField
                     "sponsorships"
                     (toGraphqlArguments
                      input)
                     graphqlDefaultResponseFunctorOrScalarDecoderTransformer
