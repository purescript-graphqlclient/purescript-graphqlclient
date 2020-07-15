module Examples.Github.Enum.SecurityAdvisorySeverity where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - SecurityAdvisorySeverity
data SecurityAdvisorySeverity
  = Low
  | Moderate
  | High
  | Critical

fromToMap :: Array (Tuple String SecurityAdvisorySeverity)
fromToMap = [Tuple "LOW" Low, Tuple "MODERATE" Moderate, Tuple "HIGH" High, Tuple "CRITICAL" Critical]

instance securityAdvisorySeverityGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder SecurityAdvisorySeverity where
  graphqlDefaultResponseScalarDecoder = enumDecoder "SecurityAdvisorySeverity" fromToMap

instance securityAdvisorySeverityToGraphqlArgumentValue :: ToGraphqlArgumentValue SecurityAdvisorySeverity where
  toGraphqlArgumentValue =
    case _ of
      Low -> ArgumentValueString "LOW"
      Moderate -> ArgumentValueString "MODERATE"
      High -> ArgumentValueString "HIGH"
      Critical -> ArgumentValueString "CRITICAL"
