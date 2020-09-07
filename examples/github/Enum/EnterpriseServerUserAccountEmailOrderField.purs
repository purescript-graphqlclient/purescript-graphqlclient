module Examples.Github.Enum.EnterpriseServerUserAccountEmailOrderField where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - EnterpriseServerUserAccountEmailOrderField
data EnterpriseServerUserAccountEmailOrderField = Email

derive instance eqEnterpriseServerUserAccountEmailOrderField :: Eq EnterpriseServerUserAccountEmailOrderField

derive instance ordEnterpriseServerUserAccountEmailOrderField :: Ord EnterpriseServerUserAccountEmailOrderField

fromToMap :: Array (Tuple String EnterpriseServerUserAccountEmailOrderField)
fromToMap = [ Tuple "EMAIL" Email ]

instance enterpriseServerUserAccountEmailOrderFieldGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                                          EnterpriseServerUserAccountEmailOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "EnterpriseServerUserAccountEmailOrderField"
                                        fromToMap

instance enterpriseServerUserAccountEmailOrderFieldToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                                             EnterpriseServerUserAccountEmailOrderField where
  toGraphQLArgumentValue =
    case _ of
      Email -> ArgumentValueEnum "EMAIL"
