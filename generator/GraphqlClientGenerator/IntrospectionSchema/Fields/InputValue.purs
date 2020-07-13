module GraphqlClientGenerator.IntrospectionSchema.Fields.InputValue where

import Protolude (Maybe)
import GraphqlClient.Implementation (SelectionSet, graphqlDefaultResponseFunctorOrScalarDecoderTransformer, graphqlDefaultResponseScalarDecoder, selectionForCompositeField, selectionForField)
import GraphqlClientGenerator.IntrospectionSchema.Fields.TypeRef as GraphqlClientGenerator.IntrospectionSchema.Fields.TypeRef

data InstorpectionQueryResult_InputValue

name :: SelectionSet InstorpectionQueryResult_InputValue String
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

description :: SelectionSet InstorpectionQueryResult_InputValue (Maybe String)
description = selectionForField "description" [] graphqlDefaultResponseScalarDecoder

type_ :: ∀ r . SelectionSet GraphqlClientGenerator.IntrospectionSchema.Fields.TypeRef.InstorpectionQueryResult_TypeRef r -> SelectionSet InstorpectionQueryResult_InputValue r
type_ = selectionForCompositeField "type" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

defaultValue :: SelectionSet InstorpectionQueryResult_InputValue (Maybe String)
defaultValue = selectionForField "defaultValue" [] graphqlDefaultResponseScalarDecoder
