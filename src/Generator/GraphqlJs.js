const graphql = require("graphql")

exports.buildSchema = function (string) {
  // console.log('string', string)
  return graphql.buildSchema(string)
}

exports.introspectionFromSchema = function(graphQLSchema) {
  // console.log('graphQLSchema', graphQLSchema)

  const introspection = graphql.introspectionFromSchema(graphQLSchema)

  return JSON.parse(JSON.stringify(introspection))
}

exports.introspectionQuery = graphql.getIntrospectionQuery()
