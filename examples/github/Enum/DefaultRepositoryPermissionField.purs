module Examples.Github.Enum.DefaultRepositoryPermissionField where

import Data.Generic.Rep (class Generic)
import Data.Show (class Show)
import Data.Generic.Rep.Show (genericShow)
import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - DefaultRepositoryPermissionField
data DefaultRepositoryPermissionField = None | Read | Write | Admin

derive instance genericDefaultRepositoryPermissionField :: Generic DefaultRepositoryPermissionField _

instance showDefaultRepositoryPermissionField :: Show
                                                 DefaultRepositoryPermissionField where
  show = genericShow

derive instance eqDefaultRepositoryPermissionField :: Eq DefaultRepositoryPermissionField

derive instance ordDefaultRepositoryPermissionField :: Ord DefaultRepositoryPermissionField

fromToMap :: Array (Tuple String DefaultRepositoryPermissionField)
fromToMap = [ Tuple "NONE" None
            , Tuple "READ" Read
            , Tuple "WRITE" Write
            , Tuple "ADMIN" Admin
            ]

instance defaultRepositoryPermissionFieldGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                                DefaultRepositoryPermissionField where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "DefaultRepositoryPermissionField"
                                        fromToMap

instance defaultRepositoryPermissionFieldToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                                   DefaultRepositoryPermissionField where
  toGraphQLArgumentValue =
    case _ of
      None -> ArgumentValueEnum "NONE"
      Read -> ArgumentValueEnum "READ"
      Write -> ArgumentValueEnum "WRITE"
      Admin -> ArgumentValueEnum "ADMIN"
