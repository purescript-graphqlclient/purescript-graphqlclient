module Examples.Github.Object.PublicKey where

import GraphqlClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Examples.Github.Scopes (Scope__PublicKey)
import Data.Maybe (Maybe)
import Examples.Github.Scalars (DateTime, Id)

accessedAt :: SelectionSet Scope__PublicKey (Maybe DateTime)
accessedAt = selectionForField
             "accessedAt"
             []
             graphqlDefaultResponseScalarDecoder

createdAt :: SelectionSet Scope__PublicKey (Maybe DateTime)
createdAt = selectionForField "createdAt" [] graphqlDefaultResponseScalarDecoder

fingerprint :: SelectionSet Scope__PublicKey String
fingerprint = selectionForField
              "fingerprint"
              []
              graphqlDefaultResponseScalarDecoder

id :: SelectionSet Scope__PublicKey Id
id = selectionForField "id" [] graphqlDefaultResponseScalarDecoder

isReadOnly :: SelectionSet Scope__PublicKey (Maybe Boolean)
isReadOnly = selectionForField
             "isReadOnly"
             []
             graphqlDefaultResponseScalarDecoder

key :: SelectionSet Scope__PublicKey String
key = selectionForField "key" [] graphqlDefaultResponseScalarDecoder

updatedAt :: SelectionSet Scope__PublicKey (Maybe DateTime)
updatedAt = selectionForField "updatedAt" [] graphqlDefaultResponseScalarDecoder
