// Generated by IcedCoffeeScript 108.0.11

/*
* File: home-controller
* User: Dow
* Date: 2/4/2015
 */
var define,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

if (typeof define !== 'function') {
  define = require('amdefine')(module);
}

define(['clc.foundation.web', '../../services/frame/service-manager', '../../../index-setting.json'], function(web, sm, setting) {
  var HomeController, exports;
  HomeController = (function(_super) {
    __extends(HomeController, _super);

    function HomeController() {
      HomeController.__super__.constructor.call(this, 'frame', setting, sm);
    }

    return HomeController;

  })(web.HomeController);
  return exports = {
    HomeController: HomeController
  };
});
