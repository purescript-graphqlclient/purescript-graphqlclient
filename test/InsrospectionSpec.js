const graphqlRequest = require("graphql-request")

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
    fields(includeDeprecated: $includeDeprecated) {
      name
      description
      args {
        ...InputValue
      }
      type {
        ...TypeRef
      }
      isDeprecated
      deprecationReason
    }
    inputFields {
      ...InputValue
    }
    interfaces {
      ...TypeRef
    }
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
  fragment InputValue on __InputValue {
    name
    description
    type { ...TypeRef }
    defaultValue
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
