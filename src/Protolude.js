exports.traceWithoutInspect = function () {
  return function (x) {
    return function (k) {
      console.log(x);
      return k({});
    };
  };
};
