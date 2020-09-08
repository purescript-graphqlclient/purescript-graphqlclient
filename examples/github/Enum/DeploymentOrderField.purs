module Examples.Github.Enum.DeploymentOrderField where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - DeploymentOrderField
data DeploymentOrderField = CreatedAt

derive instance eqDeploymentOrderField :: Eq DeploymentOrderField

derive instance ordDeploymentOrderField :: Ord DeploymentOrderField

fromToMap :: Array (Tuple String DeploymentOrderField)
fromToMap = [ Tuple "CREATED_AT" CreatedAt ]

instance deploymentOrderFieldGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                    DeploymentOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "DeploymentOrderField"
                                        fromToMap

instance deploymentOrderFieldToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                       DeploymentOrderField where
  toGraphQLArgumentValue =
    case _ of
      CreatedAt -> ArgumentValueEnum "CREATED_AT"
