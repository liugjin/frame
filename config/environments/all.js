// Generated by IcedCoffeeScript 108.0.11
var setting, web;

setting = require('../../index-setting.json');

web = require('clc.foundation.web');

module.exports = function() {
  var app, options;
  options = setting.web;
  app = new web.Application(this, options);
  return app.initialize();
};
