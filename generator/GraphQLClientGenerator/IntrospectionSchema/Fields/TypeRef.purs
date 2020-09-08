module GraphQLClientGenerator.IntrospectionSchema.Fields.TypeRef where

import Protolude
import GraphQLClient.Implementation (SelectionSet, graphqlDefaultResponseFunctorOrScalarDecoderTransformer, graphqlDefaultResponseScalarDecoder, selectionForCompositeFieldImplementation, selectionForFieldImplementation)
import GraphQLClient.WriteGraphQLHash (Cache)
import GraphQLClientGenerator.IntrospectionSchema.TypeKind (TypeKind)

data InstorpectionQueryResult_TypeRef

kind :: (Maybe Cache -> String -> String) -> SelectionSet InstorpectionQueryResult_TypeRef TypeKind
kind fieldNameFn = selectionForFieldImplementation fieldNameFn "kind" [] graphqlDefaultResponseScalarDecoder

name :: (Maybe Cache -> String -> String) -> SelectionSet InstorpectionQueryResult_TypeRef (Maybe String)
name fieldNameFn = selectionForFieldImplementation fieldNameFn "name" [] graphqlDefaultResponseScalarDecoder

ofType :: ∀ r . (Maybe Cache -> String -> String) -> SelectionSet InstorpectionQueryResult_TypeRef r -> SelectionSet InstorpectionQueryResult_TypeRef (Maybe r)
ofType fieldNameFn = selectionForCompositeFieldImplementation fieldNameFn "ofType" [] graphqlDefaultResponseFunctorOrScalarDecoderTransformer
