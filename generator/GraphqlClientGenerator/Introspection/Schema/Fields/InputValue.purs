module GraphqlClientGenerator.Introspection.Schema.Fields.InputValue where

import Protolude
import Data.Identity
import GraphqlClient.Implementation
import GraphqlClientGenerator.Introspection.Schema.Fields.TypeRef as GraphqlClientGenerator.Introspection.Schema.Fields.TypeRef

data InstorpectionQueryResult_InputValue

name :: SelectionSet InstorpectionQueryResult_InputValue String
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

description :: SelectionSet InstorpectionQueryResult_InputValue (Maybe String)
description = selectionForField "description" [] graphqlDefaultResponseScalarDecoder

type_ :: ∀ r . SelectionSet GraphqlClientGenerator.Introspection.Schema.Fields.TypeRef.InstorpectionQueryResult_TypeRef r -> SelectionSet InstorpectionQueryResult_InputValue r
type_ = selectionForCompositeField "type" [] graphqlDefaultResponseDecoderTransformer

defaultValue :: SelectionSet InstorpectionQueryResult_InputValue (Maybe String)
defaultValue = selectionForField "defaultValue" [] graphqlDefaultResponseScalarDecoder
