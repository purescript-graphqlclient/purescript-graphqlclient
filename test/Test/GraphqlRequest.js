const graphqlRequest = require("graphql-request")

exports._request = function (queryString, graphqlUrl, paramsJson) {
  return function (onError, onSuccess) {
    new graphqlRequest.GraphQLClient(
      graphqlUrl,
      {
        mode: "cors",
      }
    ).request(queryString, paramsJson)
      .then(data => {
        onSuccess(data);
      })
      .catch(err => {
        onError(err)
      });

    return function (_cancelError, _onCancelerError, _onCancelerSuccess) {};
  };
}
