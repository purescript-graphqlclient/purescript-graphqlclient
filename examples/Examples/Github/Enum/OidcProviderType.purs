module Examples.Github.Enum.OidcProviderType where

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

-- | original name - OIDCProviderType
data OidcProviderType = Aad

derive instance genericOidcProviderType :: Generic OidcProviderType _

instance showOidcProviderType :: Show OidcProviderType where
  show = genericShow

derive instance eqOidcProviderType :: Eq OidcProviderType

derive instance ordOidcProviderType :: Ord OidcProviderType

fromToMap :: Array (Tuple String OidcProviderType)
fromToMap = [ Tuple "AAD" Aad ]

instance oidcProviderTypeGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder OidcProviderType where
  graphqlDefaultResponseScalarDecoder = enumDecoder "OidcProviderType" fromToMap

instance oidcProviderTypeToGraphQLArgumentValue
  :: ToGraphQLArgumentValue OidcProviderType where
  toGraphQLArgumentValue =
    case _ of
      Aad -> ArgumentValueEnum "AAD"
