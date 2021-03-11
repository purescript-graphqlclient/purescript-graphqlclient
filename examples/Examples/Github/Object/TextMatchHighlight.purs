module Examples.Github.Object.TextMatchHighlight where

import GraphQLClient
  (SelectionSet, selectionForField, graphqlDefaultResponseScalarDecoder)
import Examples.Github.Scopes (Scope__TextMatchHighlight)

beginIndice :: SelectionSet Scope__TextMatchHighlight Int
beginIndice = selectionForField
              "beginIndice"
              []
              graphqlDefaultResponseScalarDecoder

endIndice :: SelectionSet Scope__TextMatchHighlight Int
endIndice = selectionForField "endIndice" [] graphqlDefaultResponseScalarDecoder

text :: SelectionSet Scope__TextMatchHighlight String
text = selectionForField "text" [] graphqlDefaultResponseScalarDecoder
