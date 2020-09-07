module Examples.Github.Enum.DefaultRepositoryPermissionField where

import Prelude
import Data.Tuple (Tuple(..))
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - DefaultRepositoryPermissionField
data DefaultRepositoryPermissionField = None | Read | Write | Admin

derive instance eqDefaultRepositoryPermissionField :: Eq DefaultRepositoryPermissionField

derive instance ordDefaultRepositoryPermissionField :: Ord DefaultRepositoryPermissionField

fromToMap :: Array (Tuple String DefaultRepositoryPermissionField)
fromToMap = [ Tuple "NONE" None
            , Tuple "READ" Read
            , Tuple "WRITE" Write
            , Tuple "ADMIN" Admin
            ]

instance defaultRepositoryPermissionFieldGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder
                                                                                DefaultRepositoryPermissionField where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "DefaultRepositoryPermissionField"
                                        fromToMap

instance defaultRepositoryPermissionFieldToGraphqlArgumentValue :: ToGraphqlArgumentValue
                                                                   DefaultRepositoryPermissionField where
  toGraphqlArgumentValue =
    case _ of
      None -> ArgumentValueEnum "NONE"
      Read -> ArgumentValueEnum "READ"
      Write -> ArgumentValueEnum "WRITE"
      Admin -> ArgumentValueEnum "ADMIN"
