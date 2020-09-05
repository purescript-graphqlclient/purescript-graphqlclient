module Examples.Github.Enum.CommentAuthorAssociation where

import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphqlClient
  ( class GraphqlDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphqlArgumentValue
  , ArgumentValue(..)
  )

-- | original name - CommentAuthorAssociation
data CommentAuthorAssociation
  = Member
  | Owner
  | Collaborator
  | Contributor
  | FirstTimeContributor
  | FirstTimer
  | None

derive instance eqCommentAuthorAssociation :: Eq CommentAuthorAssociation

derive instance ordCommentAuthorAssociation :: Ord CommentAuthorAssociation

fromToMap :: Array (Tuple String CommentAuthorAssociation)
fromToMap = [ Tuple
              "MEMBER"
              Member
            , Tuple "OWNER" Owner
            , Tuple "COLLABORATOR" Collaborator
            , Tuple "CONTRIBUTOR" Contributor
            , Tuple "FIRST_TIME_CONTRIBUTOR" FirstTimeContributor
            , Tuple "FIRST_TIMER" FirstTimer
            , Tuple "NONE" None
            ]

instance commentAuthorAssociationGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder
                                                                        CommentAuthorAssociation where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "CommentAuthorAssociation"
                                        fromToMap

instance commentAuthorAssociationToGraphqlArgumentValue :: ToGraphqlArgumentValue
                                                           CommentAuthorAssociation where
  toGraphqlArgumentValue =
    case _ of
      Member -> ArgumentValueEnum "MEMBER"
      Owner -> ArgumentValueEnum "OWNER"
      Collaborator -> ArgumentValueEnum "COLLABORATOR"
      Contributor -> ArgumentValueEnum "CONTRIBUTOR"
      FirstTimeContributor -> ArgumentValueEnum "FIRST_TIME_CONTRIBUTOR"
      FirstTimer -> ArgumentValueEnum "FIRST_TIMER"
      None -> ArgumentValueEnum "NONE"
