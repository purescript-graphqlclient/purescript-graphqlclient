module Examples.Github.Object.SecurityAdvisory where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , Optional
  , toGraphqlArguments
  )
import Examples.Github.Scopes
  ( Scope__SecurityAdvisory
  , Scope__SecurityAdvisoryIdentifier
  , Scope__SecurityAdvisoryReference
  , Scope__SecurityVulnerabilityConnection
  )
import Data.Maybe
  ( Maybe
  )
import Examples.Github.Scalars
  ( Id
  , Uri
  , DateTime
  )
import Examples.Github.Enum.SecurityAdvisorySeverity
  ( SecurityAdvisorySeverity
  )
import Examples.Github.InputObject
  ( SecurityVulnerabilityOrder
  ) as Examples.Github.InputObject
import Examples.Github.Enum.SecurityAdvisoryEcosystem
  ( SecurityAdvisoryEcosystem
  )
import Type.Row
  ( type (+)
  )

databaseId :: SelectionSet Scope__SecurityAdvisory (Maybe Int)
databaseId = selectionForField "databaseId" [] graphqlDefaultResponseScalarDecoder

description :: SelectionSet Scope__SecurityAdvisory String
description = selectionForField "description" [] graphqlDefaultResponseScalarDecoder

ghsaId :: SelectionSet Scope__SecurityAdvisory String
ghsaId = selectionForField "ghsaId" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__SecurityAdvisory Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

identifiers :: forall r . SelectionSet Scope__SecurityAdvisoryIdentifier r -> SelectionSet Scope__SecurityAdvisory (Array r)
identifiers = selectionForCompositeField "identifiers" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

origin :: SelectionSet Scope__SecurityAdvisory String
origin = selectionForField "origin" [] graphqlDefaultResponseScalarDecoder

permalink :: SelectionSet Scope__SecurityAdvisory (Maybe Uri)
permalink = selectionForField "permalink" [] graphqlDefaultResponseScalarDecoder

publishedAt :: SelectionSet Scope__SecurityAdvisory DateTime
publishedAt = selectionForField "publishedAt" [] graphqlDefaultResponseScalarDecoder

references :: forall r . SelectionSet Scope__SecurityAdvisoryReference r -> SelectionSet Scope__SecurityAdvisory (Array r)
references = selectionForCompositeField "references" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

severity :: SelectionSet Scope__SecurityAdvisory SecurityAdvisorySeverity
severity = selectionForField "severity" [] graphqlDefaultResponseScalarDecoder

summary :: SelectionSet Scope__SecurityAdvisory String
summary = selectionForField "summary" [] graphqlDefaultResponseScalarDecoder

updatedAt :: SelectionSet Scope__SecurityAdvisory DateTime
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder

type VulnerabilitiesInputRowOptional r = ( orderBy :: Optional Examples.Github.InputObject.SecurityVulnerabilityOrder
                                         , ecosystem :: Optional SecurityAdvisoryEcosystem
                                         , package :: Optional String
                                         , severities :: Optional (Array SecurityAdvisorySeverity)
                                         , after :: Optional String
                                         , before :: Optional String
                                         , first :: Optional Int
                                         , last :: Optional Int
                                         | r
                                         )

type VulnerabilitiesInput = { | VulnerabilitiesInputRowOptional + () }

vulnerabilities :: forall r . VulnerabilitiesInput -> SelectionSet Scope__SecurityVulnerabilityConnection r -> SelectionSet Scope__SecurityAdvisory r
vulnerabilities input = selectionForCompositeField "vulnerabilities" (toGraphqlArguments input) graphqlDefaultResponseFunctorOrScalarDecoderTransformer

withdrawnAt :: SelectionSet Scope__SecurityAdvisory (Maybe DateTime)
withdrawnAt = selectionForField "withdrawnAt" [] graphqlDefaultResponseScalarDecoder
