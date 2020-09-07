module Examples.Github.Enum.CommentCannotUpdateReason where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - CommentCannotUpdateReason
data CommentCannotUpdateReason
  = Archived
  | InsufficientAccess
  | Locked
  | LoginRequired
  | Maintenance
  | VerifiedEmailRequired
  | Denied

derive instance eqCommentCannotUpdateReason :: Eq CommentCannotUpdateReason

derive instance ordCommentCannotUpdateReason :: Ord CommentCannotUpdateReason

fromToMap :: Array (Tuple String CommentCannotUpdateReason)
fromToMap = [ Tuple "ARCHIVED" Archived
            , Tuple "INSUFFICIENT_ACCESS" InsufficientAccess
            , Tuple "LOCKED" Locked
            , Tuple "LOGIN_REQUIRED" LoginRequired
            , Tuple "MAINTENANCE" Maintenance
            , Tuple "VERIFIED_EMAIL_REQUIRED" VerifiedEmailRequired
            , Tuple "DENIED" Denied
            ]

instance commentCannotUpdateReasonGraphQLDefaultResponseScalarDecoder :: GraphQLDefaultResponseScalarDecoder
                                                                         CommentCannotUpdateReason where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "CommentCannotUpdateReason"
                                        fromToMap

instance commentCannotUpdateReasonToGraphQLArgumentValue :: ToGraphQLArgumentValue
                                                            CommentCannotUpdateReason where
  toGraphQLArgumentValue =
    case _ of
      Archived -> ArgumentValueEnum "ARCHIVED"
      InsufficientAccess -> ArgumentValueEnum "INSUFFICIENT_ACCESS"
      Locked -> ArgumentValueEnum "LOCKED"
      LoginRequired -> ArgumentValueEnum "LOGIN_REQUIRED"
      Maintenance -> ArgumentValueEnum "MAINTENANCE"
      VerifiedEmailRequired -> ArgumentValueEnum "VERIFIED_EMAIL_REQUIRED"
      Denied -> ArgumentValueEnum "DENIED"
