const graphql = require("graphql")

exports._buildSchema = function (ffiUtil, string) {
  // console.log('string', string)
  try {
    return ffiUtil.right(graphql.buildSchema(string))
  } catch(e) {
    return ffiUtil.left(e)
  }
}

exports._introspectionFromSchema = function(ffiUtil, graphQLSchema) {
  // console.log('graphQLSchema', graphQLSchema)

  try {
    const introspection = graphql.introspectionFromSchema(graphQLSchema)
    const json = JSON.parse(JSON.stringify(introspection))

    return ffiUtil.right(json)
  } catch (e) {
    return ffiUtil.left(e)
  }
}

// includeDeprecated by default is true
// exports.introspectionQuery = graphql.getIntrospectionQuery()
