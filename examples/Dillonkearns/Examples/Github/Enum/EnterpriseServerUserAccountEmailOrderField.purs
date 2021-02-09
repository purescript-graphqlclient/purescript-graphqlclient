module Dillonkearns.Examples.Github.Enum.EnterpriseServerUserAccountEmailOrderField where

import Data.Generic.Rep (class Generic)
import Data.Show (class Show)
import Data.Show.Generic (genericShow)
import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import Dillonkearns.GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - EnterpriseServerUserAccountEmailOrderField
data EnterpriseServerUserAccountEmailOrderField = Email

derive instance genericEnterpriseServerUserAccountEmailOrderField
  ::
  Generic EnterpriseServerUserAccountEmailOrderField _

instance showEnterpriseServerUserAccountEmailOrderField
  :: Show EnterpriseServerUserAccountEmailOrderField where
  show = genericShow

derive instance eqEnterpriseServerUserAccountEmailOrderField
  ::
  Eq EnterpriseServerUserAccountEmailOrderField

derive instance ordEnterpriseServerUserAccountEmailOrderField
  ::
  Ord EnterpriseServerUserAccountEmailOrderField

fromToMap :: Array (Tuple String EnterpriseServerUserAccountEmailOrderField)
fromToMap = [ Tuple "EMAIL" Email ]

instance enterpriseServerUserAccountEmailOrderFieldGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder
     EnterpriseServerUserAccountEmailOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "EnterpriseServerUserAccountEmailOrderField"
                                        fromToMap

instance enterpriseServerUserAccountEmailOrderFieldToGraphQLArgumentValue
  :: ToGraphQLArgumentValue EnterpriseServerUserAccountEmailOrderField where
  toGraphQLArgumentValue =
    case _ of
      Email -> ArgumentValueEnum "EMAIL"
