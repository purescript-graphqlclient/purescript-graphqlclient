const graphqlRequest = require("graphql-request")
const jsonDiff = require('json-diff')

exports._jsonDiffString = function(json1, json2) {
  return jsonDiff.diffString(json1, json2)
}

exports.introspectionQueryForGraphqlClient = `query IntrospectionQuery($includeDeprecated: Boolean!) {
    __schema {
      queryType {
        name
      }
      mutationType {
        name
      }
      subscriptionType {
        name
      }
      types {
        ...FullType
      }
    }
  }
  fragment FullType on __Type {
    kind
    name
    description
    enumValues(includeDeprecated: $includeDeprecated) {
      name
      description
      isDeprecated
      deprecationReason
    }
    possibleTypes {
      ...TypeRef
    }
  }
  fragment TypeRef on __Type {
    kind
    name
    ofType {
      kind
      name
      ofType {
        kind
        name
        ofType {
          kind
          name
          ofType {
            kind
            name
            ofType {
              kind
              name
              ofType {
                kind
                name
                ofType {
                  kind
                  name
                }
              }
            }
          }
        }
      }
    }
  }`

exports._requestGraphqlUsingGraphqlClient = function (queryString, graphqlUrl, includeDeprecated) {
  return function (onError, onSuccess) {
    new graphqlRequest.GraphQLClient(
      graphqlUrl,
      {
        mode: "cors",
      }
    ).request(queryString, { includeDeprecated: includeDeprecated })
      .then(data => {
        onSuccess(data);
      })
      .catch(err => {
        onError(err)
      });

    return function (_cancelError, _onCancelerError, _onCancelerSuccess) {};
  };
}
