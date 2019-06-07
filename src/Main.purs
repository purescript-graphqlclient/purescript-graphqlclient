module Main where

import Prelude

import Data.String (joinWith)
import Effect (Effect)
import Effect.Aff (Aff, Error)
import Effect.Class.Console (log)

{-

  query {
    person {
      name
      age
    }
    business {
     address
    }
  }

-}

newtype FieldName = FieldName String
newtype Fields a = Fields (Array a)

data SelectionSet = SelectionSet FieldName (Fields SelectionSet)

class GQLSerialize a where
  toGQL :: a -> String

instance gqlSerializeFieldName :: GQLSerialize FieldName where
  toGQL (FieldName s) = s

instance gqlSerializeFields :: (GQLSerialize a) => GQLSerialize (Fields a) where
  toGQL (Fields []) = ""
  toGQL (Fields a) = " { " <> (joinWith ", " (toGQL <$> a)) <> " } "

instance gqlSerializeSelectionSet :: GQLSerialize SelectionSet where
  toGQL (SelectionSet fn fs) = (toGQL fn) <> (toGQL fs)

test :: SelectionSet
test = SelectionSet
  (FieldName "query")
  (Fields [SelectionSet
            (FieldName "person")
            (Fields [SelectionSet (FieldName "name") (Fields [])])])

main :: Effect Unit
main = do
  log $ toGQL test
