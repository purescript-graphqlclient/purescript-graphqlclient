module Examples.Github.Enum.DeploymentOrderField where

import Data.Tuple
  ( Tuple(..)
  )
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - DeploymentOrderField
data DeploymentOrderField
  = CreatedAt

fromToMap :: Array (Tuple String DeploymentOrderField)
fromToMap = [Tuple "CREATED_AT" CreatedAt]

instance deploymentOrderFieldGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder DeploymentOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder "DeploymentOrderField" fromToMap

instance deploymentOrderFieldToGraphqlArgumentValue :: ToGraphqlArgumentValue DeploymentOrderField where
  toGraphqlArgumentValue =
    case _ of
      CreatedAt -> ArgumentValueEnum "CREATED_AT"
