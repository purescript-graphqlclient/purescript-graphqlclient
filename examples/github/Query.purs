module Examples.Github.Query where

import Type.Row (type (+))
import GraphqlClient
  ( SelectionSet
  , Scope__RootQuery
  , selectionForCompositeField
  , toGraphqlArguments
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , Optional
  )
import Examples.Github.Scopes
  ( Scope__CodeOfConduct
  , Scope__Enterprise
  , Scope__EnterpriseAdministratorInvitation
  , Scope__License
  , Scope__MarketplaceCategory
  , Scope__MarketplaceListing
  , Scope__MarketplaceListingConnection
  , Scope__GitHubMetadata
  , Scope__Node
  , Scope__Organization
  , Scope__RateLimit
  , Scope__Repository
  , Scope__RepositoryOwner
  , Scope__UniformResourceLocatable
  , Scope__SearchResultItemConnection
  , Scope__SecurityAdvisoryConnection
  , Scope__SecurityAdvisory
  , Scope__SecurityVulnerabilityConnection
  , Scope__SponsorsListing
  , Scope__Topic
  , Scope__User
  )
import Data.Maybe (Maybe)
import Examples.Github.Enum.EnterpriseAdministratorRole
  (EnterpriseAdministratorRole)
import Examples.Github.Scalars (Id, Uri, DateTime)
import Examples.Github.Enum.SearchType (SearchType)
import Examples.Github.InputObject
  ( SecurityAdvisoryOrder
  , SecurityAdvisoryIdentifierFilter
  , SecurityVulnerabilityOrder
  ) as Examples.Github.InputObject
import Examples.Github.Enum.SecurityAdvisoryEcosystem
  (SecurityAdvisoryEcosystem)
import Examples.Github.Enum.SecurityAdvisorySeverity (SecurityAdvisorySeverity)

type CodeOfConductInputRowRequired r = ( key :: String | r )

type CodeOfConductInput = { | CodeOfConductInputRowRequired + () }

codeOfConduct :: forall r . CodeOfConductInput -> SelectionSet
                                                  Scope__CodeOfConduct
                                                  r -> SelectionSet
                                                       Scope__RootQuery
                                                       (Maybe
                                                        r)
codeOfConduct input = selectionForCompositeField
                      "codeOfConduct"
                      (toGraphqlArguments
                       input)
                      graphqlDefaultResponseFunctorOrScalarDecoderTransformer

codesOfConduct :: forall r . SelectionSet
                             Scope__CodeOfConduct
                             r -> SelectionSet
                                  Scope__RootQuery
                                  (Maybe
                                   (Array
                                    (Maybe
                                     r)))
codesOfConduct = selectionForCompositeField
                 "codesOfConduct"
                 []
                 graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type EnterpriseInputRowOptional r = ( invitationToken :: Optional String | r )

type EnterpriseInputRowRequired r = ( slug :: String | r )

type EnterpriseInput = {
| EnterpriseInputRowOptional + EnterpriseInputRowRequired + ()
}

enterprise :: forall r . EnterpriseInput -> SelectionSet
                                            Scope__Enterprise
                                            r -> SelectionSet
                                                 Scope__RootQuery
                                                 (Maybe
                                                  r)
enterprise input = selectionForCompositeField
                   "enterprise"
                   (toGraphqlArguments
                    input)
                   graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type EnterpriseAdministratorInvitationInputRowRequired r = ( userLogin :: String
                                                           , enterpriseSlug :: String
                                                           , role :: EnterpriseAdministratorRole
                                                           | r
                                                           )

type EnterpriseAdministratorInvitationInput = {
| EnterpriseAdministratorInvitationInputRowRequired + ()
}

enterpriseAdministratorInvitation :: forall r . EnterpriseAdministratorInvitationInput -> SelectionSet
                                                                                          Scope__EnterpriseAdministratorInvitation
                                                                                          r -> SelectionSet
                                                                                               Scope__RootQuery
                                                                                               (Maybe
                                                                                                r)
enterpriseAdministratorInvitation input = selectionForCompositeField
                                          "enterpriseAdministratorInvitation"
                                          (toGraphqlArguments
                                           input)
                                          graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type EnterpriseAdministratorInvitationByTokenInputRowRequired r = ( invitationToken :: String
                                                                  | r
                                                                  )

type EnterpriseAdministratorInvitationByTokenInput = {
| EnterpriseAdministratorInvitationByTokenInputRowRequired + ()
}

enterpriseAdministratorInvitationByToken :: forall r . EnterpriseAdministratorInvitationByTokenInput -> SelectionSet
                                                                                                        Scope__EnterpriseAdministratorInvitation
                                                                                                        r -> SelectionSet
                                                                                                             Scope__RootQuery
                                                                                                             (Maybe
                                                                                                              r)
enterpriseAdministratorInvitationByToken input = selectionForCompositeField
                                                 "enterpriseAdministratorInvitationByToken"
                                                 (toGraphqlArguments
                                                  input)
                                                 graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type LicenseInputRowRequired r = ( key :: String | r )

type LicenseInput = { | LicenseInputRowRequired + () }

license :: forall r . LicenseInput -> SelectionSet
                                      Scope__License
                                      r -> SelectionSet
                                           Scope__RootQuery
                                           (Maybe
                                            r)
license input = selectionForCompositeField
                "license"
                (toGraphqlArguments
                 input)
                graphqlDefaultResponseFunctorOrScalarDecoderTransformer

licenses :: forall r . SelectionSet
                       Scope__License
                       r -> SelectionSet
                            Scope__RootQuery
                            (Array
                             (Maybe
                              r))
licenses = selectionForCompositeField
           "licenses"
           []
           graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type MarketplaceCategoriesInputRowOptional r = ( includeCategories :: Optional
                                                                      (Array
                                                                       String)
                                               , excludeEmpty :: Optional
                                                                 Boolean
                                               , excludeSubcategories :: Optional
                                                                         Boolean
                                               | r
                                               )

type MarketplaceCategoriesInput = {
| MarketplaceCategoriesInputRowOptional + ()
}

marketplaceCategories :: forall r . MarketplaceCategoriesInput -> SelectionSet
                                                                  Scope__MarketplaceCategory
                                                                  r -> SelectionSet
                                                                       Scope__RootQuery
                                                                       (Array
                                                                        r)
marketplaceCategories input = selectionForCompositeField
                              "marketplaceCategories"
                              (toGraphqlArguments
                               input)
                              graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type MarketplaceCategoryInputRowOptional r = ( useTopicAliases :: Optional
                                                                  Boolean
                                             | r
                                             )

type MarketplaceCategoryInputRowRequired r = ( slug :: String | r )

type MarketplaceCategoryInput = {
| MarketplaceCategoryInputRowOptional + MarketplaceCategoryInputRowRequired + ()
}

marketplaceCategory :: forall r . MarketplaceCategoryInput -> SelectionSet
                                                              Scope__MarketplaceCategory
                                                              r -> SelectionSet
                                                                   Scope__RootQuery
                                                                   (Maybe
                                                                    r)
marketplaceCategory input = selectionForCompositeField
                            "marketplaceCategory"
                            (toGraphqlArguments
                             input)
                            graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type MarketplaceListingInputRowRequired r = ( slug :: String | r )

type MarketplaceListingInput = { | MarketplaceListingInputRowRequired + () }

marketplaceListing :: forall r . MarketplaceListingInput -> SelectionSet
                                                            Scope__MarketplaceListing
                                                            r -> SelectionSet
                                                                 Scope__RootQuery
                                                                 (Maybe
                                                                  r)
marketplaceListing input = selectionForCompositeField
                           "marketplaceListing"
                           (toGraphqlArguments
                            input)
                           graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type MarketplaceListingsInputRowOptional r = ( after :: Optional
                                                        String
                                             , before :: Optional String
                                             , first :: Optional Int
                                             , last :: Optional Int
                                             , categorySlug :: Optional String
                                             , useTopicAliases :: Optional
                                                                  Boolean
                                             , viewerCanAdmin :: Optional
                                                                 Boolean
                                             , adminId :: Optional Id
                                             , organizationId :: Optional Id
                                             , allStates :: Optional Boolean
                                             , slugs :: Optional
                                                        (Array
                                                         (Maybe
                                                          String))
                                             , primaryCategoryOnly :: Optional
                                                                      Boolean
                                             , withFreeTrialsOnly :: Optional
                                                                     Boolean
                                             | r
                                             )

type MarketplaceListingsInput = { | MarketplaceListingsInputRowOptional + () }

marketplaceListings :: forall r . MarketplaceListingsInput -> SelectionSet
                                                              Scope__MarketplaceListingConnection
                                                              r -> SelectionSet
                                                                   Scope__RootQuery
                                                                   r
marketplaceListings input = selectionForCompositeField
                            "marketplaceListings"
                            (toGraphqlArguments
                             input)
                            graphqlDefaultResponseFunctorOrScalarDecoderTransformer

meta :: forall r . SelectionSet
                   Scope__GitHubMetadata
                   r -> SelectionSet
                        Scope__RootQuery
                        r
meta = selectionForCompositeField
       "meta"
       []
       graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type NodeInputRowRequired r = ( id :: Id | r )

type NodeInput = { | NodeInputRowRequired + () }

node :: forall r . NodeInput -> SelectionSet
                                Scope__Node
                                r -> SelectionSet
                                     Scope__RootQuery
                                     (Maybe
                                      r)
node input = selectionForCompositeField
             "node"
             (toGraphqlArguments
              input)
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type NodesInputRowRequired r = ( ids :: Array Id | r )

type NodesInput = { | NodesInputRowRequired + () }

nodes :: forall r . NodesInput -> SelectionSet
                                  Scope__Node
                                  r -> SelectionSet
                                       Scope__RootQuery
                                       (Array
                                        (Maybe
                                         r))
nodes input = selectionForCompositeField
              "nodes"
              (toGraphqlArguments
               input)
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type OrganizationInputRowRequired r = ( login :: String | r )

type OrganizationInput = { | OrganizationInputRowRequired + () }

organization :: forall r . OrganizationInput -> SelectionSet
                                                Scope__Organization
                                                r -> SelectionSet
                                                     Scope__RootQuery
                                                     (Maybe
                                                      r)
organization input = selectionForCompositeField
                     "organization"
                     (toGraphqlArguments
                      input)
                     graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type RateLimitInputRowOptional r = ( dryRun :: Optional Boolean | r )

type RateLimitInput = { | RateLimitInputRowOptional + () }

rateLimit :: forall r . RateLimitInput -> SelectionSet
                                          Scope__RateLimit
                                          r -> SelectionSet
                                               Scope__RootQuery
                                               (Maybe
                                                r)
rateLimit input = selectionForCompositeField
                  "rateLimit"
                  (toGraphqlArguments
                   input)
                  graphqlDefaultResponseFunctorOrScalarDecoderTransformer

relay :: forall r . SelectionSet
                    Scope__RootQuery
                    r -> SelectionSet
                         Scope__RootQuery
                         r
relay = selectionForCompositeField
        "relay"
        []
        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type RepositoryInputRowRequired r = ( owner :: String, name :: String | r )

type RepositoryInput = { | RepositoryInputRowRequired + () }

repository :: forall r . RepositoryInput -> SelectionSet
                                            Scope__Repository
                                            r -> SelectionSet
                                                 Scope__RootQuery
                                                 (Maybe
                                                  r)
repository input = selectionForCompositeField
                   "repository"
                   (toGraphqlArguments
                    input)
                   graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type RepositoryOwnerInputRowRequired r = ( login :: String | r )

type RepositoryOwnerInput = { | RepositoryOwnerInputRowRequired + () }

repositoryOwner :: forall r . RepositoryOwnerInput -> SelectionSet
                                                      Scope__RepositoryOwner
                                                      r -> SelectionSet
                                                           Scope__RootQuery
                                                           (Maybe
                                                            r)
repositoryOwner input = selectionForCompositeField
                        "repositoryOwner"
                        (toGraphqlArguments
                         input)
                        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type ResourceInputRowRequired r = ( url :: Uri | r )

type ResourceInput = { | ResourceInputRowRequired + () }

resource :: forall r . ResourceInput -> SelectionSet
                                        Scope__UniformResourceLocatable
                                        r -> SelectionSet
                                             Scope__RootQuery
                                             (Maybe
                                              r)
resource input = selectionForCompositeField
                 "resource"
                 (toGraphqlArguments
                  input)
                 graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type SearchInputRowOptional r = ( after :: Optional
                                           String
                                , before :: Optional String
                                , first :: Optional Int
                                , last :: Optional Int
                                | r
                                )

type SearchInputRowRequired r = ( query :: String, "type" :: SearchType | r )

type SearchInput = { | SearchInputRowOptional + SearchInputRowRequired + () }

search :: forall r . SearchInput -> SelectionSet
                                    Scope__SearchResultItemConnection
                                    r -> SelectionSet
                                         Scope__RootQuery
                                         r
search input = selectionForCompositeField
               "search"
               (toGraphqlArguments
                input)
               graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type SecurityAdvisoriesInputRowOptional r = ( orderBy :: Optional
                                                         Examples.Github.InputObject.SecurityAdvisoryOrder
                                            , identifier :: Optional
                                                            Examples.Github.InputObject.SecurityAdvisoryIdentifierFilter
                                            , publishedSince :: Optional
                                                                DateTime
                                            , updatedSince :: Optional DateTime
                                            , after :: Optional String
                                            , before :: Optional String
                                            , first :: Optional Int
                                            , last :: Optional Int
                                            | r
                                            )

type SecurityAdvisoriesInput = { | SecurityAdvisoriesInputRowOptional + () }

securityAdvisories :: forall r . SecurityAdvisoriesInput -> SelectionSet
                                                            Scope__SecurityAdvisoryConnection
                                                            r -> SelectionSet
                                                                 Scope__RootQuery
                                                                 r
securityAdvisories input = selectionForCompositeField
                           "securityAdvisories"
                           (toGraphqlArguments
                            input)
                           graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type SecurityAdvisoryInputRowRequired r = ( ghsaId :: String | r )

type SecurityAdvisoryInput = { | SecurityAdvisoryInputRowRequired + () }

securityAdvisory :: forall r . SecurityAdvisoryInput -> SelectionSet
                                                        Scope__SecurityAdvisory
                                                        r -> SelectionSet
                                                             Scope__RootQuery
                                                             (Maybe
                                                              r)
securityAdvisory input = selectionForCompositeField
                         "securityAdvisory"
                         (toGraphqlArguments
                          input)
                         graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type SecurityVulnerabilitiesInputRowOptional r = ( orderBy :: Optional
                                                              Examples.Github.InputObject.SecurityVulnerabilityOrder
                                                 , ecosystem :: Optional
                                                                SecurityAdvisoryEcosystem
                                                 , package :: Optional String
                                                 , severities :: Optional
                                                                 (Array
                                                                  SecurityAdvisorySeverity)
                                                 , after :: Optional String
                                                 , before :: Optional String
                                                 , first :: Optional Int
                                                 , last :: Optional Int
                                                 | r
                                                 )

type SecurityVulnerabilitiesInput = {
| SecurityVulnerabilitiesInputRowOptional + ()
}

securityVulnerabilities :: forall r . SecurityVulnerabilitiesInput -> SelectionSet
                                                                      Scope__SecurityVulnerabilityConnection
                                                                      r -> SelectionSet
                                                                           Scope__RootQuery
                                                                           r
securityVulnerabilities input = selectionForCompositeField
                                "securityVulnerabilities"
                                (toGraphqlArguments
                                 input)
                                graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type SponsorsListingInputRowRequired r = ( slug :: String | r )

type SponsorsListingInput = { | SponsorsListingInputRowRequired + () }

sponsorsListing :: forall r . SponsorsListingInput -> SelectionSet
                                                      Scope__SponsorsListing
                                                      r -> SelectionSet
                                                           Scope__RootQuery
                                                           (Maybe
                                                            r)
sponsorsListing input = selectionForCompositeField
                        "sponsorsListing"
                        (toGraphqlArguments
                         input)
                        graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type TopicInputRowRequired r = ( name :: String | r )

type TopicInput = { | TopicInputRowRequired + () }

topic :: forall r . TopicInput -> SelectionSet
                                  Scope__Topic
                                  r -> SelectionSet
                                       Scope__RootQuery
                                       (Maybe
                                        r)
topic input = selectionForCompositeField
              "topic"
              (toGraphqlArguments
               input)
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer

type UserInputRowRequired r = ( login :: String | r )

type UserInput = { | UserInputRowRequired + () }

user :: forall r . UserInput -> SelectionSet
                                Scope__User
                                r -> SelectionSet
                                     Scope__RootQuery
                                     (Maybe
                                      r)
user input = selectionForCompositeField
             "user"
             (toGraphqlArguments
              input)
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

viewer :: forall r . SelectionSet
                     Scope__User
                     r -> SelectionSet
                          Scope__RootQuery
                          r
viewer = selectionForCompositeField
         "viewer"
         []
         graphqlDefaultResponseFunctorOrScalarDecoderTransformer
