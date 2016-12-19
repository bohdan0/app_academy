const Util = {
  inherits (child, parent) {
    var Suragate = function () {};
    Suragate.prototype = parent.prototype;
    child.prototype = new Suragate();
    child.prototype.constructor = child;
  }

};

module.exports = Util;
