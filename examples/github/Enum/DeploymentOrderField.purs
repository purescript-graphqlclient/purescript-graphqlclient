module Examples.Github.Enum.DeploymentOrderField where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - DeploymentOrderField
data DeploymentOrderField = CreatedAt

derive instance eqDeploymentOrderField :: Eq DeploymentOrderField

derive instance ordDeploymentOrderField :: Ord DeploymentOrderField

fromToMap :: Array (Tuple String DeploymentOrderField)
fromToMap = [ Tuple "CREATED_AT" CreatedAt ]

instance deploymentOrderFieldGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder
                                                                    DeploymentOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "DeploymentOrderField"
                                        fromToMap

instance deploymentOrderFieldToGraphqlArgumentValue :: ToGraphqlArgumentValue
                                                       DeploymentOrderField where
  toGraphqlArgumentValue =
    case _ of
      CreatedAt -> ArgumentValueEnum "CREATED_AT"
