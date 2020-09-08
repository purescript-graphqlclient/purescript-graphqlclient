module GraphQLClientGenerator.IntrospectionSchema.Fields.InputValue where

import Protolude
import GraphQLClient.Implementation (SelectionSet, graphqlDefaultResponseFunctorOrScalarDecoderTransformer, graphqlDefaultResponseScalarDecoder, selectionForCompositeFieldImplementation, selectionForFieldImplementation)
import GraphQLClient.WriteGraphQLHash (Cache)
import GraphQLClientGenerator.IntrospectionSchema.Fields.TypeRef as GraphQLClientGenerator.IntrospectionSchema.Fields.TypeRef

data InstorpectionQueryResult_InputValue

name :: (Maybe Cache -> String -> String) -> SelectionSet InstorpectionQueryResult_InputValue String
name fieldNameFn = selectionForFieldImplementation fieldNameFn "name" [] graphqlDefaultResponseScalarDecoder

description :: (Maybe Cache -> String -> String) -> SelectionSet InstorpectionQueryResult_InputValue (Maybe String)
description fieldNameFn = selectionForFieldImplementation fieldNameFn "description" [] graphqlDefaultResponseScalarDecoder

type_ :: ∀ r . (Maybe Cache -> String -> String) -> SelectionSet GraphQLClientGenerator.IntrospectionSchema.Fields.TypeRef.InstorpectionQueryResult_TypeRef r -> SelectionSet InstorpectionQueryResult_InputValue r
type_ fieldNameFn = selectionForCompositeFieldImplementation fieldNameFn "type" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer

defaultValue :: (Maybe Cache -> String -> String) -> SelectionSet InstorpectionQueryResult_InputValue (Maybe String)
defaultValue fieldNameFn = selectionForFieldImplementation fieldNameFn "defaultValue" [] graphqlDefaultResponseScalarDecoder
