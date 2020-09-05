module Examples.Github.Object.OrganizationsHovercardContext where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , Optional
  , selectionForCompositeField
  , toGraphqlArguments
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes
  (Scope__OrganizationsHovercardContext, Scope__OrganizationConnection)
import Type.Row (type (+))

message :: SelectionSet Scope__OrganizationsHovercardContext String
message = selectionForField "message" [] graphqlDefaultResponseScalarDecoder

octicon :: SelectionSet Scope__OrganizationsHovercardContext String
octicon = selectionForField "octicon" [] graphqlDefaultResponseScalarDecoder

type RelevantOrganizationsInputRowOptional r = ( after :: Optional String
                                               , before :: Optional String
                                               , first :: Optional Int
                                               , last :: Optional Int
                                               | r
                                               )

type RelevantOrganizationsInput = {
| RelevantOrganizationsInputRowOptional + ()
}

relevantOrganizations :: forall r . RelevantOrganizationsInput -> SelectionSet
                                                                  Scope__OrganizationConnection
                                                                  r -> SelectionSet
                                                                       Scope__OrganizationsHovercardContext
                                                                       r
relevantOrganizations input = selectionForCompositeField
                              "relevantOrganizations"
                              (toGraphqlArguments
                               input)
                              graphqlDefaultResponseFunctorOrScalarDecoderTransformer

totalOrganizationCount :: SelectionSet Scope__OrganizationsHovercardContext Int
totalOrganizationCount = selectionForField
                         "totalOrganizationCount"
                         []
                         graphqlDefaultResponseScalarDecoder
