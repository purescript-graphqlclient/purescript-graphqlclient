module Examples.Github.Enum.SecurityAdvisoryOrderField where

import Prelude
import Data.Tuple (Tuple(..))
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - SecurityAdvisoryOrderField
data SecurityAdvisoryOrderField = PublishedAt | UpdatedAt

derive instance eqSecurityAdvisoryOrderField :: Eq SecurityAdvisoryOrderField

derive instance ordSecurityAdvisoryOrderField :: Ord SecurityAdvisoryOrderField

fromToMap :: Array (Tuple String SecurityAdvisoryOrderField)
fromToMap = [ Tuple "PUBLISHED_AT" PublishedAt, Tuple "UPDATED_AT" UpdatedAt ]

instance securityAdvisoryOrderFieldGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder
                                                                          SecurityAdvisoryOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "SecurityAdvisoryOrderField"
                                        fromToMap

instance securityAdvisoryOrderFieldToGraphqlArgumentValue :: ToGraphqlArgumentValue
                                                             SecurityAdvisoryOrderField where
  toGraphqlArgumentValue =
    case _ of
      PublishedAt -> ArgumentValueEnum "PUBLISHED_AT"
      UpdatedAt -> ArgumentValueEnum "UPDATED_AT"
