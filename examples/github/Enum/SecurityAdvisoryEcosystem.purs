module Examples.Github.Enum.SecurityAdvisoryEcosystem where

import Data.Generic.Rep (class Generic)
import Data.Show (class Show)
import Data.Generic.Rep.Show (genericShow)
import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - SecurityAdvisoryEcosystem
data SecurityAdvisoryEcosystem = Rubygems | Npm | Pip | Maven | Nuget | Composer

derive instance genericSecurityAdvisoryEcosystem :: Generic SecurityAdvisoryEcosystem _

instance showSecurityAdvisoryEcosystem :: Show SecurityAdvisoryEcosystem where
  show = genericShow

derive instance eqSecurityAdvisoryEcosystem :: Eq SecurityAdvisoryEcosystem

derive instance ordSecurityAdvisoryEcosystem :: Ord SecurityAdvisoryEcosystem

fromToMap :: Array (Tuple String SecurityAdvisoryEcosystem)
fromToMap = [ Tuple "RUBYGEMS" Rubygems
            , Tuple "NPM" Npm
            , Tuple "PIP" Pip
            , Tuple "MAVEN" Maven
            , Tuple "NUGET" Nuget
            , Tuple "COMPOSER" Composer
            ]

instance securityAdvisoryEcosystemGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                         SecurityAdvisoryEcosystem where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "SecurityAdvisoryEcosystem"
                                        fromToMap

instance securityAdvisoryEcosystemToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                            SecurityAdvisoryEcosystem where
  toGraphQLArgumentValue =
    case _ of
      Rubygems -> ArgumentValueEnum "RUBYGEMS"
      Npm -> ArgumentValueEnum "NPM"
      Pip -> ArgumentValueEnum "PIP"
      Maven -> ArgumentValueEnum "MAVEN"
      Nuget -> ArgumentValueEnum "NUGET"
      Composer -> ArgumentValueEnum "COMPOSER"
