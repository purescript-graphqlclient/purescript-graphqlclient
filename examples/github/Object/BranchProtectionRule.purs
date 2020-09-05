module Examples.Github.Object.BranchProtectionRule where

import GraphqlClient
  ( Optional
  , SelectionSet
  , selectionForCompositeField
  , toGraphqlArguments
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  )
import Type.Row (type (+))
import Examples.Github.Scopes
  ( Scope__BranchProtectionRuleConflictConnection
  , Scope__BranchProtectionRule
  , Scope__Actor
  , Scope__RefConnection
  , Scope__PushAllowanceConnection
  , Scope__Repository
  , Scope__ReviewDismissalAllowanceConnection
  )
import Data.Maybe (Maybe)
import Examples.Github.Scalars (Id)

type BranchProtectionRuleConflictsInputRowOptional r = ( after :: Optional
                                                                  String
                                                       , before :: Optional
                                                                   String
                                                       , first :: Optional Int
                                                       , last :: Optional Int
                                                       | r
                                                       )

type BranchProtectionRuleConflictsInput = {
| BranchProtectionRuleConflictsInputRowOptional + ()
}

branchProtectionRuleConflicts :: forall r . BranchProtectionRuleConflictsInput -> SelectionSet
                                                                                  Scope__BranchProtectionRuleConflictConnection
                                                                                  r -> SelectionSet
                                                                                       Scope__BranchProtectionRule
                                                                                       r
branchProtectionRuleConflicts input = selectionForCompositeField
                                      "branchProtectionRuleConflicts"
                                      (toGraphqlArguments
                                       input)
                                      graphqlDefaultResponseFunctorOrScalarDecoderTransformer

creator :: forall r . SelectionSet
                      Scope__Actor
                      r -> SelectionSet
                           Scope__BranchProtectionRule
                           (Maybe
                            r)
creator = selectionForCompositeField
          "creator"
          []
          graphqlDefaultResponseFunctorOrScalarDecoderTransformer

databaseId :: SelectionSet Scope__BranchProtectionRule (Maybe Int)
databaseId = selectionForField
             "databaseId"
             []
             graphqlDefaultResponseScalarDecoder

dismissesStaleReviews :: SelectionSet Scope__BranchProtectionRule Boolean
dismissesStaleReviews = selectionForField
                        "dismissesStaleReviews"
                        []
                        graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__BranchProtectionRule Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

isAdminEnforced :: SelectionSet Scope__BranchProtectionRule Boolean
isAdminEnforced = selectionForField
                  "isAdminEnforced"
                  []
                  graphqlDefaultResponseScalarDecoder

type MatchingRefsInputRowOptional r = ( query :: Optional
                                                 String
                                      , after :: Optional String
                                      , before :: Optional String
                                      , first :: Optional Int
                                      , last :: Optional Int
                                      | r
                                      )

type MatchingRefsInput = { | MatchingRefsInputRowOptional + () }

matchingRefs :: forall r . MatchingRefsInput -> SelectionSet
                                                Scope__RefConnection
                                                r -> SelectionSet
                                                     Scope__BranchProtectionRule
                                                     r
matchingRefs input = selectionForCompositeField
                     "matchingRefs"
                     (toGraphqlArguments
                      input)
                     graphqlDefaultResponseFunctorOrScalarDecoderTransformer

pattern :: SelectionSet Scope__BranchProtectionRule String
pattern = selectionForField "pattern" [] graphqlDefaultResponseScalarDecoder

type PushAllowancesInputRowOptional r = ( after :: Optional
                                                   String
                                        , before :: Optional String
                                        , first :: Optional Int
                                        , last :: Optional Int
                                        | r
                                        )

type PushAllowancesInput = { | PushAllowancesInputRowOptional + () }

pushAllowances :: forall r . PushAllowancesInput -> SelectionSet
                                                    Scope__PushAllowanceConnection
                                                    r -> SelectionSet
                                                         Scope__BranchProtectionRule
                                                         r
pushAllowances input = selectionForCompositeField
                       "pushAllowances"
                       (toGraphqlArguments
                        input)
                       graphqlDefaultResponseFunctorOrScalarDecoderTransformer

repository :: forall r . SelectionSet
                         Scope__Repository
                         r -> SelectionSet
                              Scope__BranchProtectionRule
                              (Maybe
                               r)
repository = selectionForCompositeField
             "repository"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

requiredApprovingReviewCount :: SelectionSet
                                Scope__BranchProtectionRule
                                (Maybe
                                 Int)
requiredApprovingReviewCount = selectionForField
                               "requiredApprovingReviewCount"
                               []
                               graphqlDefaultResponseScalarDecoder

requiredStatusCheckContexts :: SelectionSet
                               Scope__BranchProtectionRule
                               (Maybe
                                (Array
                                 (Maybe
                                  String)))
requiredStatusCheckContexts = selectionForField
                              "requiredStatusCheckContexts"
                              []
                              graphqlDefaultResponseScalarDecoder

requiresApprovingReviews :: SelectionSet Scope__BranchProtectionRule Boolean
requiresApprovingReviews = selectionForField
                           "requiresApprovingReviews"
                           []
                           graphqlDefaultResponseScalarDecoder

requiresCodeOwnerReviews :: SelectionSet Scope__BranchProtectionRule Boolean
requiresCodeOwnerReviews = selectionForField
                           "requiresCodeOwnerReviews"
                           []
                           graphqlDefaultResponseScalarDecoder

requiresCommitSignatures :: SelectionSet Scope__BranchProtectionRule Boolean
requiresCommitSignatures = selectionForField
                           "requiresCommitSignatures"
                           []
                           graphqlDefaultResponseScalarDecoder

requiresStatusChecks :: SelectionSet Scope__BranchProtectionRule Boolean
requiresStatusChecks = selectionForField
                       "requiresStatusChecks"
                       []
                       graphqlDefaultResponseScalarDecoder

requiresStrictStatusChecks :: SelectionSet Scope__BranchProtectionRule Boolean
requiresStrictStatusChecks = selectionForField
                             "requiresStrictStatusChecks"
                             []
                             graphqlDefaultResponseScalarDecoder

restrictsPushes :: SelectionSet Scope__BranchProtectionRule Boolean
restrictsPushes = selectionForField
                  "restrictsPushes"
                  []
                  graphqlDefaultResponseScalarDecoder

restrictsReviewDismissals :: SelectionSet Scope__BranchProtectionRule Boolean
restrictsReviewDismissals = selectionForField
                            "restrictsReviewDismissals"
                            []
                            graphqlDefaultResponseScalarDecoder

type ReviewDismissalAllowancesInputRowOptional r = ( after :: Optional
                                                              String
                                                   , before :: Optional String
                                                   , first :: Optional Int
                                                   , last :: Optional Int
                                                   | r
                                                   )

type ReviewDismissalAllowancesInput = {
| ReviewDismissalAllowancesInputRowOptional + ()
}

reviewDismissalAllowances :: forall r . ReviewDismissalAllowancesInput -> SelectionSet
                                                                          Scope__ReviewDismissalAllowanceConnection
                                                                          r -> SelectionSet
                                                                               Scope__BranchProtectionRule
                                                                               r
reviewDismissalAllowances input = selectionForCompositeField
                                  "reviewDismissalAllowances"
                                  (toGraphqlArguments
                                   input)
                                  graphqlDefaultResponseFunctorOrScalarDecoderTransformer
