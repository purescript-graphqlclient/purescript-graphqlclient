module Examples.Github.Enum.RepoCreateAuditEntryVisibility where

import Data.Tuple
  ( Tuple(..)
  )
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - RepoCreateAuditEntryVisibility
data RepoCreateAuditEntryVisibility
  = Internal
  | Private
  | Public

fromToMap :: Array (Tuple String RepoCreateAuditEntryVisibility)
fromToMap = [Tuple "INTERNAL" Internal, Tuple "PRIVATE" Private, Tuple "PUBLIC" Public]

instance repoCreateAuditEntryVisibilityGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder RepoCreateAuditEntryVisibility where
  graphqlDefaultResponseScalarDecoder = enumDecoder "RepoCreateAuditEntryVisibility" fromToMap

instance repoCreateAuditEntryVisibilityToGraphqlArgumentValue :: ToGraphqlArgumentValue RepoCreateAuditEntryVisibility where
  toGraphqlArgumentValue =
    case _ of
      Internal -> ArgumentValueEnum "INTERNAL"
      Private -> ArgumentValueEnum "PRIVATE"
      Public -> ArgumentValueEnum "PUBLIC"
