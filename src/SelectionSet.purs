module Fernet.GraphQL.SelectionSet where

import Prelude
import Data.String (joinWith)

import Fernet.GraphQL.GQLSerialize (class GQLSerialize, toGQL)

newtype FieldName = FieldName String
newtype Fields a = Fields (Array a)

data SelectionSet = SelectionSet FieldName (Fields SelectionSet)


instance gqlSerializeFieldName :: GQLSerialize FieldName where
  toGQL (FieldName s) = s

instance gqlSerializeFields :: (GQLSerialize a) => GQLSerialize (Fields a) where
  toGQL (Fields []) = ""
  toGQL (Fields a) = " { " <> (joinWith ", " (toGQL <$> a)) <> " } "

instance gqlSerializeSelectionSet :: GQLSerialize SelectionSet where
  toGQL (SelectionSet fn fs) = (toGQL fn) <> (toGQL fs)
