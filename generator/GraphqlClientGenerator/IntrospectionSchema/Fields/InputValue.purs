module GraphqlClientGenerator.IntrospectionSchema.Fields.InputValue where

import Protolude
import GraphqlClient.Implementation (SelectionSet, graphqlDefaultResponseFunctorOrScalarDecoderTransformer, graphqlDefaultResponseScalarDecoder, selectionForCompositeFieldImplementation, selectionForFieldImplementation)
import GraphqlClient.WriteGraphqlHash (Cache)
import GraphqlClientGenerator.IntrospectionSchema.Fields.TypeRef as GraphqlClientGenerator.IntrospectionSchema.Fields.TypeRef

data InstorpectionQueryResult_InputValue

name :: (Maybe Cache -> String -> String) -> SelectionSet InstorpectionQueryResult_InputValue String
name fieldNameFn = selectionForFieldImplementation fieldNameFn "name" [] graphqlDefaultResponseScalarDecoder

description :: (Maybe Cache -> String -> String) -> SelectionSet InstorpectionQueryResult_InputValue (Maybe String)
description fieldNameFn = selectionForFieldImplementation fieldNameFn "description" [] graphqlDefaultResponseScalarDecoder

type_ :: ∀ r . (Maybe Cache -> String -> String) -> SelectionSet GraphqlClientGenerator.IntrospectionSchema.Fields.TypeRef.InstorpectionQueryResult_TypeRef r -> SelectionSet InstorpectionQueryResult_InputValue r
type_ fieldNameFn = selectionForCompositeFieldImplementation fieldNameFn "type" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

defaultValue :: (Maybe Cache -> String -> String) -> SelectionSet InstorpectionQueryResult_InputValue (Maybe String)
defaultValue fieldNameFn = selectionForFieldImplementation fieldNameFn "defaultValue" [] graphqlDefaultResponseScalarDecoder
