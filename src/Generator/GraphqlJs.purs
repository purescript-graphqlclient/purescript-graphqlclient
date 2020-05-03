module Generator.GraphqlJs where

import Protolude
import Data.Argonaut.Core as ArgonautCore

foreign import data GraphQLSchema :: Type

foreign import buildSchema :: String -> GraphQLSchema

foreign import introspectionFromSchema :: GraphQLSchema -> ArgonautCore.Json

-- foreign import introspectionQuery :: String

generateIntrospectionJsonFromSchema :: String -> ArgonautCore.Json
generateIntrospectionJsonFromSchema = buildSchema >>> introspectionFromSchema
