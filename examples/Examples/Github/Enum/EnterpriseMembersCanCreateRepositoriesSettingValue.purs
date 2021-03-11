module Examples.Github.Enum.EnterpriseMembersCanCreateRepositoriesSettingValue where

import Data.Generic.Rep (class Generic)
import Data.Show (class Show)
import Data.Show.Generic (genericShow)
import Prelude (class Eq, class Ord)
import Data.Tuple (Tuple(..))
import GraphQLClient
  ( class GraphQLDefaultResponseScalarDecoder
  , enumDecoder
  , class ToGraphQLArgumentValue
  , ArgumentValue(..)
  )

-- | original name - EnterpriseMembersCanCreateRepositoriesSettingValue
data EnterpriseMembersCanCreateRepositoriesSettingValue
  = NoPolicy
  | All
  | Public
  | Private
  | Disabled

derive instance genericEnterpriseMembersCanCreateRepositoriesSettingValue
  ::
  Generic EnterpriseMembersCanCreateRepositoriesSettingValue _

instance showEnterpriseMembersCanCreateRepositoriesSettingValue
  :: Show EnterpriseMembersCanCreateRepositoriesSettingValue where
  show = genericShow

derive instance eqEnterpriseMembersCanCreateRepositoriesSettingValue
  ::
  Eq EnterpriseMembersCanCreateRepositoriesSettingValue

derive instance ordEnterpriseMembersCanCreateRepositoriesSettingValue
  ::
  Ord EnterpriseMembersCanCreateRepositoriesSettingValue

fromToMap
  :: Array
     (Tuple String EnterpriseMembersCanCreateRepositoriesSettingValue)
fromToMap = [ Tuple "NO_POLICY" NoPolicy
            , Tuple "ALL" All
            , Tuple "PUBLIC" Public
            , Tuple "PRIVATE" Private
            , Tuple "DISABLED" Disabled
            ]

instance enterpriseMembersCanCreateRepositoriesSettingValueGraphQLDefaultResponseScalarDecoder
  :: GraphQLDefaultResponseScalarDecoder
     EnterpriseMembersCanCreateRepositoriesSettingValue where
  graphqlDefaultResponseScalarDecoder = enumDecoder
                                        "EnterpriseMembersCanCreateRepositoriesSettingValue"
                                        fromToMap

instance enterpriseMembersCanCreateRepositoriesSettingValueToGraphQLArgumentValue
  :: ToGraphQLArgumentValue
     EnterpriseMembersCanCreateRepositoriesSettingValue where
  toGraphQLArgumentValue =
    case _ of
      NoPolicy -> ArgumentValueEnum "NO_POLICY"
      All -> ArgumentValueEnum "ALL"
      Public -> ArgumentValueEnum "PUBLIC"
      Private -> ArgumentValueEnum "PRIVATE"
      Disabled -> ArgumentValueEnum "DISABLED"
