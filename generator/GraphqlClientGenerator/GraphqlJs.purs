module GraphqlClientGenerator.GraphqlJs where

import Protolude

import Data.Argonaut.Core as ArgonautCore
import Data.Function.Uncurried (Fn2, runFn2)

foreign import data GraphQLSchema :: Type

newtype FFIUtil = FFIUtil
  { left ∷ ∀ a b. a → Either a b
  , right ∷ ∀ a b. b → Either a b
  }

ffiUtil :: FFIUtil
ffiUtil = FFIUtil
  { left: Left
  , right: Right
  }

foreign import _buildSchema :: Fn2 FFIUtil String (Either Error GraphQLSchema)

foreign import _introspectionFromSchema :: Fn2 FFIUtil GraphQLSchema (Either Error ArgonautCore.Json)

buildSchema :: String -> Either Error GraphQLSchema
buildSchema = runFn2 _buildSchema ffiUtil

introspectionFromSchema :: GraphQLSchema -> Either Error ArgonautCore.Json
introspectionFromSchema = runFn2 _introspectionFromSchema ffiUtil

-- foreign import introspectionQuery :: String

generateIntrospectionJsonFromSchema :: String -> Either Error ArgonautCore.Json
generateIntrospectionJsonFromSchema = buildSchema >=> introspectionFromSchema
