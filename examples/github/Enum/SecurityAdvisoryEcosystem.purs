module Examples.Github.Enum.SecurityAdvisoryEcosystem where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - SecurityAdvisoryEcosystem
data SecurityAdvisoryEcosystem
  = Rubygems
  | Npm
  | Pip
  | Maven
  | Nuget
  | Composer

fromToMap :: Array (Tuple String SecurityAdvisoryEcosystem)
fromToMap = [Tuple "RUBYGEMS" Rubygems, Tuple "NPM" Npm, Tuple "PIP" Pip, Tuple "MAVEN" Maven, Tuple "NUGET" Nuget, Tuple "COMPOSER" Composer]

instance securityAdvisoryEcosystemGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder SecurityAdvisoryEcosystem where
  graphqlDefaultResponseScalarDecoder = enumDecoder "SecurityAdvisoryEcosystem" fromToMap

instance securityAdvisoryEcosystemToGraphqlArgumentValue :: ToGraphqlArgumentValue SecurityAdvisoryEcosystem where
  toGraphqlArgumentValue =
    case _ of
      Rubygems -> ArgumentValueString "RUBYGEMS"
      Npm -> ArgumentValueString "NPM"
      Pip -> ArgumentValueString "PIP"
      Maven -> ArgumentValueString "MAVEN"
      Nuget -> ArgumentValueString "NUGET"
      Composer -> ArgumentValueString "COMPOSER"
