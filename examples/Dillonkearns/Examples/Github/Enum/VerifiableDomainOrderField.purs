module Dillonkearns.Examples.Github.Enum.VerifiableDomainOrderField where

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

-- | original name - VerifiableDomainOrderField
data VerifiableDomainOrderField = Domain

derive instance genericVerifiableDomainOrderField
  ::
  Generic VerifiableDomainOrderField _

instance showVerifiableDomainOrderField :: Show VerifiableDomainOrderField where
  show = genericShow

derive instance eqVerifiableDomainOrderField :: Eq VerifiableDomainOrderField

derive instance ordVerifiableDomainOrderField :: Ord VerifiableDomainOrderField

fromToMap :: Array (Tuple String VerifiableDomainOrderField)
fromToMap = [ Tuple "DOMAIN" Domain ]

instance verifiableDomainOrderFieldGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder VerifiableDomainOrderField where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "VerifiableDomainOrderField"
                                        fromToMap

instance verifiableDomainOrderFieldToGraphQLArgumentValue
  :: ToGraphQLArgumentValue VerifiableDomainOrderField where
  toGraphQLArgumentValue =
    case _ of
      Domain -> ArgumentValueEnum "DOMAIN"
