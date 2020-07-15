module Examples.Github.Enum.CommentCannotUpdateReason where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - CommentCannotUpdateReason
data CommentCannotUpdateReason
  = Archived
  | InsufficientAccess
  | Locked
  | LoginRequired
  | Maintenance
  | VerifiedEmailRequired
  | Denied

fromToMap :: Array (Tuple String CommentCannotUpdateReason)
fromToMap = [Tuple "ARCHIVED" Archived, Tuple "INSUFFICIENT_ACCESS" InsufficientAccess, Tuple "LOCKED" Locked, Tuple "LOGIN_REQUIRED" LoginRequired, Tuple "MAINTENANCE" Maintenance, Tuple "VERIFIED_EMAIL_REQUIRED" VerifiedEmailRequired, Tuple "DENIED" Denied]

instance commentCannotUpdateReasonGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder CommentCannotUpdateReason where
  graphqlDefaultResponseScalarDecoder = enumDecoder "CommentCannotUpdateReason" fromToMap

instance commentCannotUpdateReasonToGraphqlArgumentValue :: ToGraphqlArgumentValue CommentCannotUpdateReason where
  toGraphqlArgumentValue =
    case _ of
      Archived -> ArgumentValueString "ARCHIVED"
      InsufficientAccess -> ArgumentValueString "INSUFFICIENT_ACCESS"
      Locked -> ArgumentValueString "LOCKED"
      LoginRequired -> ArgumentValueString "LOGIN_REQUIRED"
      Maintenance -> ArgumentValueString "MAINTENANCE"
      VerifiedEmailRequired -> ArgumentValueString "VERIFIED_EMAIL_REQUIRED"
      Denied -> ArgumentValueString "DENIED"
