module Examples.Github.Enum.OrgEnterpriseOwnerOrderField where

import Data.Generic.Rep (class Generic)
import Data.Show (class Show)
import Data.Show.Generic (genericShow)
import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - OrgEnterpriseOwnerOrderField
data OrgEnterpriseOwnerOrderField = Login

derive instance genericOrgEnterpriseOwnerOrderField
  ::
  Generic OrgEnterpriseOwnerOrderField _

instance showOrgEnterpriseOwnerOrderField
  :: Show OrgEnterpriseOwnerOrderField where
  show = genericShow

derive instance eqOrgEnterpriseOwnerOrderField
  ::
  Eq OrgEnterpriseOwnerOrderField

derive instance ordOrgEnterpriseOwnerOrderField
  ::
  Ord OrgEnterpriseOwnerOrderField

fromToMap :: Array (Tuple String OrgEnterpriseOwnerOrderField)
fromToMap = [ Tuple "LOGIN" Login ]

instance orgEnterpriseOwnerOrderFieldGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder OrgEnterpriseOwnerOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "OrgEnterpriseOwnerOrderField"
                                        fromToMap

instance orgEnterpriseOwnerOrderFieldToGraphQLArgumentValue
  :: ToGraphQLArgumentValue OrgEnterpriseOwnerOrderField where
  toGraphQLArgumentValue =
    case _ of
      Login -> ArgumentValueEnum "LOGIN"
