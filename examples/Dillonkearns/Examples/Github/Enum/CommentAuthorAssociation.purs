module Dillonkearns.Examples.Github.Enum.CommentAuthorAssociation where

import Data.Generic.Rep (class Generic)
import Data.Show (class Show)
import Data.Show.Generic (genericShow)
import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import Dillonkearns.GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - CommentAuthorAssociation
data CommentAuthorAssociation
  = Member
  | Owner
  | Mannequin
  | Collaborator
  | Contributor
  | FirstTimeContributor
  | FirstTimer
  | None

derive instance genericCommentAuthorAssociation
  ::
  Generic CommentAuthorAssociation _

instance showCommentAuthorAssociation :: Show CommentAuthorAssociation where
  show = genericShow

derive instance eqCommentAuthorAssociation :: Eq CommentAuthorAssociation

derive instance ordCommentAuthorAssociation :: Ord CommentAuthorAssociation

fromToMap :: Array (Tuple String CommentAuthorAssociation)
fromToMap = [ Tuple "MEMBER" Member
            , Tuple "OWNER" Owner
            , Tuple "MANNEQUIN" Mannequin
            , Tuple "COLLABORATOR" Collaborator
            , Tuple "CONTRIBUTOR" Contributor
            , Tuple "FIRST_TIME_CONTRIBUTOR" FirstTimeContributor
            , Tuple "FIRST_TIMER" FirstTimer
            , Tuple "NONE" None
            ]

instance commentAuthorAssociationGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder CommentAuthorAssociation where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "CommentAuthorAssociation"
                                        fromToMap

instance commentAuthorAssociationToGraphQLArgumentValue
  :: ToGraphQLArgumentValue CommentAuthorAssociation where
  toGraphQLArgumentValue =
    case _ of
      Member -> ArgumentValueEnum "MEMBER"
      Owner -> ArgumentValueEnum "OWNER"
      Mannequin -> ArgumentValueEnum "MANNEQUIN"
      Collaborator -> ArgumentValueEnum "COLLABORATOR"
      Contributor -> ArgumentValueEnum "CONTRIBUTOR"
      FirstTimeContributor -> ArgumentValueEnum "FIRST_TIME_CONTRIBUTOR"
      FirstTimer -> ArgumentValueEnum "FIRST_TIMER"
      None -> ArgumentValueEnum "NONE"
