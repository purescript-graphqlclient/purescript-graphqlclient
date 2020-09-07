module Examples.Github.Enum.PackageType where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - PackageType
data PackageType = Npm | Rubygems | Maven | Docker | Debian | Nuget | Pypi

derive instance eqPackageType :: Eq PackageType

derive instance ordPackageType :: Ord PackageType

fromToMap :: Array (Tuple String PackageType)
fromToMap = [ Tuple "NPM" Npm
            , Tuple "RUBYGEMS" Rubygems
            , Tuple "MAVEN" Maven
            , Tuple "DOCKER" Docker
            , Tuple "DEBIAN" Debian
            , Tuple "NUGET" Nuget
            , Tuple "PYPI" Pypi
            ]

instance packageTypeGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                           PackageType where
  graphqlDefaultResponseScalarDecoder = enumDecoder "PackageType" fromToMap

instance packageTypeToGraphQLArgumentValue :: ToGraphQLArgumentValue PackageType where
  toGraphQLArgumentValue =
    case _ of
      Npm -> ArgumentValueEnum "NPM"
      Rubygems -> ArgumentValueEnum "RUBYGEMS"
      Maven -> ArgumentValueEnum "MAVEN"
      Docker -> ArgumentValueEnum "DOCKER"
      Debian -> ArgumentValueEnum "DEBIAN"
      Nuget -> ArgumentValueEnum "NUGET"
      Pypi -> ArgumentValueEnum "PYPI"
