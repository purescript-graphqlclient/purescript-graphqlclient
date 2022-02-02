module Examples.Github.Enum.SecurityAdvisoryEcosystem where

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

-- | original name - SecurityAdvisoryEcosystem
data SecurityAdvisoryEcosystem
  = Composer
  | Go
  | Maven
  | Npm
  | Nuget
  | Pip
  | Rubygems
  | Rust

derive instance genericSecurityAdvisoryEcosystem
  ::
  Generic SecurityAdvisoryEcosystem _

instance showSecurityAdvisoryEcosystem :: Show SecurityAdvisoryEcosystem where
  show = genericShow

derive instance eqSecurityAdvisoryEcosystem :: Eq SecurityAdvisoryEcosystem

derive instance ordSecurityAdvisoryEcosystem :: Ord SecurityAdvisoryEcosystem

fromToMap :: Array (Tuple String SecurityAdvisoryEcosystem)
fromToMap = [ Tuple "COMPOSER" Composer
            , Tuple "GO" Go
            , Tuple "MAVEN" Maven
            , Tuple "NPM" Npm
            , Tuple "NUGET" Nuget
            , Tuple "PIP" Pip
            , Tuple "RUBYGEMS" Rubygems
            , Tuple "RUST" Rust
            ]

instance securityAdvisoryEcosystemGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder SecurityAdvisoryEcosystem where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "SecurityAdvisoryEcosystem"
                                        fromToMap

instance securityAdvisoryEcosystemToGraphQLArgumentValue
  :: ToGraphQLArgumentValue SecurityAdvisoryEcosystem where
  toGraphQLArgumentValue =
    case _ of
      Composer -> ArgumentValueEnum "COMPOSER"
      Go -> ArgumentValueEnum "GO"
      Maven -> ArgumentValueEnum "MAVEN"
      Npm -> ArgumentValueEnum "NPM"
      Nuget -> ArgumentValueEnum "NUGET"
      Pip -> ArgumentValueEnum "PIP"
      Rubygems -> ArgumentValueEnum "RUBYGEMS"
      Rust -> ArgumentValueEnum "RUST"
