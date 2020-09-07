module Examples.Github.Enum.SecurityAdvisoryOrderField where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - SecurityAdvisoryOrderField
data SecurityAdvisoryOrderField = PublishedAt | UpdatedAt

derive instance eqSecurityAdvisoryOrderField :: Eq SecurityAdvisoryOrderField

derive instance ordSecurityAdvisoryOrderField :: Ord SecurityAdvisoryOrderField

fromToMap :: Array (Tuple String SecurityAdvisoryOrderField)
fromToMap = [ Tuple "PUBLISHED_AT" PublishedAt, Tuple "UPDATED_AT" UpdatedAt ]

instance securityAdvisoryOrderFieldGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                          SecurityAdvisoryOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "SecurityAdvisoryOrderField"
                                        fromToMap

instance securityAdvisoryOrderFieldToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                             SecurityAdvisoryOrderField where
  toGraphQLArgumentValue =
    case _ of
      PublishedAt -> ArgumentValueEnum "PUBLISHED_AT"
      UpdatedAt -> ArgumentValueEnum "UPDATED_AT"
