module Examples.Github.Object.OrganizationTeamsHovercardContext where

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
  ( Scope__OrganizationTeamsHovercardContext
  , Scope__TeamConnection
  )
import Type.Row
  ( type (+)
  )
import Examples.Github.Scalars
  ( Uri
  )

message :: SelectionSet Scope__OrganizationTeamsHovercardContext String
message = selectionForField "message" [] graphqlDefaultResponseScalarDecoder

octicon :: SelectionSet Scope__OrganizationTeamsHovercardContext String
octicon = selectionForField "octicon" [] graphqlDefaultResponseScalarDecoder

type RelevantTeamsInputRowOptional r = ( after :: Optional String
                                       , before :: Optional String
                                       , first :: Optional Int
                                       , last :: Optional Int
                                       | r
                                       )

type RelevantTeamsInput = { | RelevantTeamsInputRowOptional + () }

relevantTeams :: forall r . RelevantTeamsInput -> SelectionSet Scope__TeamConnection r -> SelectionSet Scope__OrganizationTeamsHovercardContext r
relevantTeams input = selectionForCompositeField "relevantTeams" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

teamsResourcePath :: SelectionSet Scope__OrganizationTeamsHovercardContext Uri
teamsResourcePath = selectionForField "teamsResourcePath" [] graphqlDefaultResponseScalarDecoder

teamsUrl :: SelectionSet Scope__OrganizationTeamsHovercardContext Uri
teamsUrl = selectionForField "teamsUrl" [] graphqlDefaultResponseScalarDecoder

totalTeamCount :: SelectionSet Scope__OrganizationTeamsHovercardContext Int
totalTeamCount = selectionForField "totalTeamCount" [] graphqlDefaultResponseScalarDecoder
