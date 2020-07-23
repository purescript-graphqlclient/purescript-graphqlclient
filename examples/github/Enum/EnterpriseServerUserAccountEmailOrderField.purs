module Examples.Github.Enum.EnterpriseServerUserAccountEmailOrderField where

import Prelude
  ( class Eq
  , class Ord
  )
import Data.Tuple
  ( Tuple(..)
  )
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - EnterpriseServerUserAccountEmailOrderField
data EnterpriseServerUserAccountEmailOrderField
  = Email

derive instance eqEnterpriseServerUserAccountEmailOrderField :: Eq EnterpriseServerUserAccountEmailOrderField

derive instance ordEnterpriseServerUserAccountEmailOrderField :: Ord EnterpriseServerUserAccountEmailOrderField

fromToMap :: Array (Tuple String EnterpriseServerUserAccountEmailOrderField)
fromToMap = [Tuple "EMAIL" Email]

instance enterpriseServerUserAccountEmailOrderFieldGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder EnterpriseServerUserAccountEmailOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder "EnterpriseServerUserAccountEmailOrderField" fromToMap

instance enterpriseServerUserAccountEmailOrderFieldToGraphqlArgumentValue :: ToGraphqlArgumentValue EnterpriseServerUserAccountEmailOrderField where
  toGraphqlArgumentValue =
    case _ of
      Email -> ArgumentValueEnum "EMAIL"
