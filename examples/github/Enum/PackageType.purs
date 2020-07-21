module Examples.Github.Enum.PackageType where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - PackageType
data PackageType
  = Npm
  | Rubygems
  | Maven
  | Docker
  | Debian
  | Nuget
  | Pypi

fromToMap :: Array (Tuple String PackageType)
fromToMap = [Tuple "NPM" Npm, Tuple "RUBYGEMS" Rubygems, Tuple "MAVEN" Maven, Tuple "DOCKER" Docker, Tuple "DEBIAN" Debian, Tuple "NUGET" Nuget, Tuple "PYPI" Pypi]

instance packageTypeGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder PackageType where
  graphqlDefaultResponseScalarDecoder = enumDecoder "PackageType" fromToMap

instance packageTypeToGraphqlArgumentValue :: ToGraphqlArgumentValue PackageType where
  toGraphqlArgumentValue =
    case _ of
      Npm -> ArgumentValueEnum "NPM"
      Rubygems -> ArgumentValueEnum "RUBYGEMS"
      Maven -> ArgumentValueEnum "MAVEN"
      Docker -> ArgumentValueEnum "DOCKER"
      Debian -> ArgumentValueEnum "DEBIAN"
      Nuget -> ArgumentValueEnum "NUGET"
      Pypi -> ArgumentValueEnum "PYPI"
