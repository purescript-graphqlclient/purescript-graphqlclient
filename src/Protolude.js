"use strict";

// Alias require to prevent webpack or browserify from actually requiring.
var req = typeof module === "undefined" ? undefined : module.require;
var util = req === undefined ? undefined : req("util");

exports.traceWithoutInspect = function () {
  return function (x) {
    return function (k) {
      console.log(x);
      return k({});
    };
  };
};

exports.spyWithCallback = function () {
  return function (tag) {
    return function (x) {
      return function (k) {
        // node only recurses two levels into an object before printing
        // "[object]" for further objects when using console.log()
        if (util !== undefined) {
          console.log(tag + ":", util.inspect(x, { depth: null, colors: true }));
        } else {
          console.log(tag + ":", x);
        }
        return k({});
      };
    };
  }
};
