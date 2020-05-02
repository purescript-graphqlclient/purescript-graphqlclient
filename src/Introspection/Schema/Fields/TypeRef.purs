module Fernet.Introspection.Schema.Fields.TypeRef where

import Protolude
import Data.Identity
import Fernet.Graphql.SelectionSet

data InstorpectionQueryResult_TypeRef

kind :: SelectionSet InstorpectionQueryResult_TypeRef String
kind = selectionForField "kind"

name :: SelectionSet InstorpectionQueryResult_TypeRef (Maybe String)
name = selectionForField "name"

ofType :: ∀ r . SelectionSet InstorpectionQueryResult_TypeRef r -> SelectionSet InstorpectionQueryResult_TypeRef (Maybe r)
ofType = selectionForCompositeField "ofType" []
