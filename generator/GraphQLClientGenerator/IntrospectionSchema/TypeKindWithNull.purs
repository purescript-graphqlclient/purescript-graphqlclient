module GraphQLClientGenerator.IntrospectionSchema.TypeKindWithNull where

import Protolude

import Data.Generic.Rep (class Generic) as GenericRep

import Type.Row (type (+))
import GraphQLClientGenerator.IntrospectionSchema.TypeKind (TypeKind(..))

type InstorpectionQueryResult__TypeRef_shared r = ( kind :: TypeKind, name :: Maybe String | r )

-- this is what we get from introspection query
-- 7 ofType's
type InstorpectionQueryResult__TypeRef
  = Record
    (InstorpectionQueryResult__TypeRef_shared
    + (ofType :: Maybe $ Record
        (InstorpectionQueryResult__TypeRef_shared
        + (ofType :: Maybe $ Record
            (InstorpectionQueryResult__TypeRef_shared
            + (ofType :: Maybe $ Record
                (InstorpectionQueryResult__TypeRef_shared
                + (ofType :: Maybe $ Record
                    (InstorpectionQueryResult__TypeRef_shared
                    + (ofType :: Maybe $ Record
                        (InstorpectionQueryResult__TypeRef_shared
                        + (ofType :: Maybe $ Record
                            (InstorpectionQueryResult__TypeRef_shared
                            + (ofType :: Maybe $ Record (InstorpectionQueryResult__TypeRef_shared + ())
                              )
                            )
                          )
                        )
                      )
                    )
                  )
                )
              )
            )
          )
        )
      )
    )

-- for internal use only, intermediate results, converted to TypeKindWithNull
-- it's just easier to convert input to this first
data TypeKindWithNameWithNonNull
  = TypeKindWithNameWithNonNull__NonNull     TypeKindWithNameWithNonNull
  | TypeKindWithNameWithNonNull__List        TypeKindWithNameWithNonNull
  | TypeKindWithNameWithNonNull__Scalar      String
  | TypeKindWithNameWithNonNull__Enum        String
  | TypeKindWithNameWithNonNull__InputObject String
  | TypeKindWithNameWithNonNull__Object      String
  | TypeKindWithNameWithNonNull__Interface   String
  | TypeKindWithNameWithNonNull__Union       String

-- the output, validated and sane
data TypeKindWithNull
  = TypeKindWithNull__Null        TypeKindWithNull
  | TypeKindWithNull__List        TypeKindWithNull
  | TypeKindWithNull__Scalar      String
  | TypeKindWithNull__Enum        String
  | TypeKindWithNull__InputObject String
  | TypeKindWithNull__Object      String
  | TypeKindWithNull__Interface   String
  | TypeKindWithNull__Union       String

derive instance eqTypeKindWithNull :: Eq TypeKindWithNull

derive instance genericTypeKindWithNull :: GenericRep.Generic TypeKindWithNull _

instance showTypeKindWithNull :: Show TypeKindWithNull where
  show = go
    where
      go =
        case _ of
            TypeKindWithNull__Null        typeKindWithNull -> "(TypeKindWithNull__Null " <> go typeKindWithNull <> ")"
            TypeKindWithNull__List        typeKindWithNull -> "(TypeKindWithNull__List " <> go typeKindWithNull <> ")"
            TypeKindWithNull__Scalar      string           -> "(TypeKindWithNull__Scalar " <> show string <> ")"
            TypeKindWithNull__Enum        string           -> "(TypeKindWithNull__Enum " <> show string <> ")"
            TypeKindWithNull__InputObject string           -> "(TypeKindWithNull__InputObject " <> show string <> ")"
            TypeKindWithNull__Object      string           -> "(TypeKindWithNull__Object " <> show string <> ")"
            TypeKindWithNull__Interface   string           -> "(TypeKindWithNull__Interface " <> show string <> ")"
            TypeKindWithNull__Union       string           -> "(TypeKindWithNull__Union " <> show string <> ")"

-- main function
collectTypeRefInfo :: InstorpectionQueryResult__TypeRef -> Maybe TypeKindWithNull
collectTypeRefInfo = map convertTypeKindWithNonNullToNull <<< convToWithNonNull
  where
    convertTypeKindWithNonNullToNull :: TypeKindWithNameWithNonNull -> TypeKindWithNull
    convertTypeKindWithNonNullToNull =
      case _ of
      TypeKindWithNameWithNonNull__NonNull type_ ->
        case convertTypeKindWithNonNullToNull type_ of
             TypeKindWithNull__Null type__ -> type__
             other -> other
      TypeKindWithNameWithNonNull__List        type_ -> TypeKindWithNull__Null $ TypeKindWithNull__List (convertTypeKindWithNonNullToNull type_)
      TypeKindWithNameWithNonNull__Scalar      name  -> TypeKindWithNull__Null $ TypeKindWithNull__Scalar name
      TypeKindWithNameWithNonNull__Enum        name  -> TypeKindWithNull__Null $ TypeKindWithNull__Enum name
      TypeKindWithNameWithNonNull__InputObject name  -> TypeKindWithNull__Null $ TypeKindWithNull__InputObject name
      TypeKindWithNameWithNonNull__Object      name  -> TypeKindWithNull__Null $ TypeKindWithNull__Object name
      TypeKindWithNameWithNonNull__Interface   name  -> TypeKindWithNull__Null $ TypeKindWithNull__Interface name
      TypeKindWithNameWithNonNull__Union       name  -> TypeKindWithNull__Null $ TypeKindWithNull__Union name

    convToWithNonNull :: InstorpectionQueryResult__TypeRef -> Maybe TypeKindWithNameWithNonNull
    convToWithNonNull =
      with
      <<< with
      <<< with
      <<< with
      <<< with
      <<< with
      <<< with
      $ without

    without :: { kind :: TypeKind, name :: Maybe String } -> Maybe TypeKindWithNameWithNonNull
    without typeRef =
      case typeRef.kind of
           NonNull     -> Nothing
           List        -> Nothing
           Scalar      -> typeRef.name <#> TypeKindWithNameWithNonNull__Scalar
           Enum        -> typeRef.name <#> TypeKindWithNameWithNonNull__Enum
           InputObject -> typeRef.name <#> TypeKindWithNameWithNonNull__InputObject
           Object      -> typeRef.name <#> TypeKindWithNameWithNonNull__Object
           Interface   -> typeRef.name <#> TypeKindWithNameWithNonNull__Interface
           Union       -> typeRef.name <#> TypeKindWithNameWithNonNull__Union

    with :: forall a . (a -> Maybe TypeKindWithNameWithNonNull) -> { kind :: TypeKind, name :: Maybe String, ofType :: Maybe a } -> Maybe TypeKindWithNameWithNonNull
    with handle typeRef =
      case typeRef.kind of
           NonNull     -> typeRef.ofType >>= handle <#> TypeKindWithNameWithNonNull__NonNull
           List        -> typeRef.ofType >>= handle <#> TypeKindWithNameWithNonNull__List
           Scalar      -> typeRef.name <#> TypeKindWithNameWithNonNull__Scalar
           Enum        -> typeRef.name <#> TypeKindWithNameWithNonNull__Enum
           InputObject -> typeRef.name <#> TypeKindWithNameWithNonNull__InputObject
           Object      -> typeRef.name <#> TypeKindWithNameWithNonNull__Object
           Interface   -> typeRef.name <#> TypeKindWithNameWithNonNull__Interface
           Union       -> typeRef.name <#> TypeKindWithNameWithNonNull__Union
