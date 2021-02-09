module Examples.Github.Object.SponsorsListing where

import GraphQLClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , Optional
  , selectionForCompositeField
  , toGraphQLArguments
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__SponsorsListing, Scope__SponsorsTierConnection)
import Examples.Github.Scalars (DateTime, Html, Id)
import Examples.Github.InputObject (SponsorsTierOrder) as Examples.Github.InputObject
import Type.Row (type (+))
import Data.Maybe (Maybe)

createdAt :: SelectionSet Scope__SponsorsListing DateTime
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

fullDescription :: SelectionSet Scope__SponsorsListing String
fullDescription = selectionForField
                  "fullDescription"
                  []
                  graphqlDefaultResponseScalarDecoder

fullDescriptionHTML :: SelectionSet Scope__SponsorsListing Html
fullDescriptionHTML = selectionForField
                      "fullDescriptionHTML"
                      []
                      graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__SponsorsListing Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

name :: SelectionSet Scope__SponsorsListing String
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

shortDescription :: SelectionSet Scope__SponsorsListing String
shortDescription = selectionForField
                   "shortDescription"
                   []
                   graphqlDefaultResponseScalarDecoder

slug :: SelectionSet Scope__SponsorsListing String
slug = selectionForField "slug" [] graphqlDefaultResponseScalarDecoder

type TiersInputRowOptional r
  = ( after :: Optional String
    , before :: Optional String
    , first :: Optional Int
    , last :: Optional Int
    , orderBy :: Optional Examples.Github.InputObject.SponsorsTierOrder
    | r
    )

type TiersInput = { | TiersInputRowOptional + () }

tiers
  :: forall r
   . TiersInput
  -> SelectionSet Scope__SponsorsTierConnection r
  -> SelectionSet Scope__SponsorsListing (Maybe r)
tiers input = selectionForCompositeField
              "tiers"
              (toGraphQLArguments
               input)
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer
