// Generated by IcedCoffeeScript 108.0.11

/*
* File: test-rx
* User: Pu
* Date: 2018/9/4
 */
var iced, should, __iced_k, __iced_k_noop;

__iced_k = __iced_k_noop = function() {};

should = require('should');

iced = require('iced-coffee-script');

if (iced.iced) {
  iced = iced.iced;
}

describe('test rx', function() {
  before(function(done) {
    return done();
  });
  after(function() {});
  return it('should be ok', function(done) {
    var ___iced_passed_deferral, __iced_deferrals, __iced_k;
    __iced_k = __iced_k_noop;
    ___iced_passed_deferral = iced.findDeferral(arguments);
    (function(_this) {
      return (function(__iced_k) {
        __iced_deferrals = new iced.Deferrals(__iced_k, {
          parent: ___iced_passed_deferral,
          filename: "/Users/yangpu/repositories/clc.frame/test/test-rx.coffee"
        });
        setTimeout(__iced_deferrals.defer({
          lineno: 18
        }), 1000);
        __iced_deferrals._fulfill();
      });
    })(this)((function(_this) {
      return function() {
        console.log('ok');
        return done();
      };
    })(this));
  });
});
