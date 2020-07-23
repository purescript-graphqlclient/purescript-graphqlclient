module Examples.Github.Enum.RepoDestroyAuditEntryVisibility where

import Data.Tuple
  ( Tuple(..)
  )
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - RepoDestroyAuditEntryVisibility
data RepoDestroyAuditEntryVisibility
  = Internal
  | Private
  | Public

fromToMap :: Array (Tuple String RepoDestroyAuditEntryVisibility)
fromToMap = [Tuple "INTERNAL" Internal, Tuple "PRIVATE" Private, Tuple "PUBLIC" Public]

instance repoDestroyAuditEntryVisibilityGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder RepoDestroyAuditEntryVisibility where
  graphqlDefaultResponseScalarDecoder = enumDecoder "RepoDestroyAuditEntryVisibility" fromToMap

instance repoDestroyAuditEntryVisibilityToGraphqlArgumentValue :: ToGraphqlArgumentValue RepoDestroyAuditEntryVisibility where
  toGraphqlArgumentValue =
    case _ of
      Internal -> ArgumentValueEnum "INTERNAL"
      Private -> ArgumentValueEnum "PRIVATE"
      Public -> ArgumentValueEnum "PUBLIC"
