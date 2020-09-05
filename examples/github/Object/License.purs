module Examples.Github.Object.License where

import GraphqlClient
  ( SelectionSet
  , selectionForField
  , graphqlDefaultResponseScalarDecoder
  , selectionForCompositeField
  , graphqlDefaultResponseFunctorOrScalarDecoderTransformer
  )
import Examples.Github.Scopes (Scope__License, Scope__LicenseRule)
import Data.Maybe (Maybe)
import Examples.Github.Scalars (Id, Uri)

body :: SelectionSet Scope__License String
body = selectionForField "body" [] graphqlDefaultResponseScalarDecoder

conditions :: forall r . SelectionSet
                         Scope__LicenseRule
                         r -> SelectionSet
                              Scope__License
                              (Array
                               (Maybe
                                r))
conditions = selectionForCompositeField
             "conditions"
             []
             graphqlDefaultResponseFunctorOrScalarDecoderTransformer

description :: SelectionSet Scope__License (Maybe String)
description = selectionForField
              "description"
              []
              graphqlDefaultResponseScalarDecoder

featured :: SelectionSet Scope__License Boolean
featured = selectionForField "featured" [] graphqlDefaultResponseScalarDecoder

hidden :: SelectionSet Scope__License Boolean
hidden = selectionForField "hidden" [] graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__License Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

implementation :: SelectionSet Scope__License (Maybe String)
implementation = selectionForField
                 "implementation"
                 []
                 graphqlDefaultResponseScalarDecoder

key :: SelectionSet Scope__License String
key = selectionForField "key" [] graphqlDefaultResponseScalarDecoder

limitations :: forall r . SelectionSet
                          Scope__LicenseRule
                          r -> SelectionSet
                               Scope__License
                               (Array
                                (Maybe
                                 r))
limitations = selectionForCompositeField
              "limitations"
              []
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer

name :: SelectionSet Scope__License String
name = selectionForField "name" [] graphqlDefaultResponseScalarDecoder

nickname :: SelectionSet Scope__License (Maybe String)
nickname = selectionForField "nickname" [] graphqlDefaultResponseScalarDecoder

permissions :: forall r . SelectionSet
                          Scope__LicenseRule
                          r -> SelectionSet
                               Scope__License
                               (Array
                                (Maybe
                                 r))
permissions = selectionForCompositeField
              "permissions"
              []
              graphqlDefaultResponseFunctorOrScalarDecoderTransformer

pseudoLicense :: SelectionSet Scope__License Boolean
pseudoLicense = selectionForField
                "pseudoLicense"
                []
                graphqlDefaultResponseScalarDecoder

spdxId :: SelectionSet Scope__License (Maybe String)
spdxId = selectionForField "spdxId" [] graphqlDefaultResponseScalarDecoder

url :: SelectionSet Scope__License (Maybe Uri)
url = selectionForField "url" [] graphqlDefaultResponseScalarDecoder
