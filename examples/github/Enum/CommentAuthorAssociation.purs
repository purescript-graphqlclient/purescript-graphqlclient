module Examples.Github.Enum.CommentAuthorAssociation where

import Prelude
import GraphqlClient
import Data.Tuple

-- | original name - CommentAuthorAssociation
data CommentAuthorAssociation
  = Member
  | Owner
  | Collaborator
  | Contributor
  | FirstTimeContributor
  | FirstTimer
  | None

fromToMap :: Array (Tuple String CommentAuthorAssociation)
fromToMap = [Tuple "MEMBER" Member, Tuple "OWNER" Owner, Tuple "COLLABORATOR" Collaborator, Tuple "CONTRIBUTOR" Contributor, Tuple "FIRST_TIME_CONTRIBUTOR" FirstTimeContributor, Tuple "FIRST_TIMER" FirstTimer, Tuple "NONE" None]

instance commentAuthorAssociationGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder CommentAuthorAssociation where
  graphqlDefaultResponseScalarDecoder = enumDecoder "CommentAuthorAssociation" fromToMap

instance commentAuthorAssociationToGraphqlArgumentValue :: ToGraphqlArgumentValue CommentAuthorAssociation where
  toGraphqlArgumentValue =
    case _ of
      Member -> ArgumentValueString "MEMBER"
      Owner -> ArgumentValueString "OWNER"
      Collaborator -> ArgumentValueString "COLLABORATOR"
      Contributor -> ArgumentValueString "CONTRIBUTOR"
      FirstTimeContributor -> ArgumentValueString "FIRST_TIME_CONTRIBUTOR"
      FirstTimer -> ArgumentValueString "FIRST_TIMER"
      None -> ArgumentValueString "NONE"
