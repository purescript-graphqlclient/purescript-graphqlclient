const jsonDiff = require('json-diff')

exports._jsonDiffString = function(json1, json2) {
  return jsonDiff.diffString(json1, json2)
}
