module Fernet.GraphQL.GQLSerialize where

class GQLSerialize a where
  toGQL :: a -> String
