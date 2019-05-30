// Generated by IcedCoffeeScript 108.0.11

/*
* File: service-manager
* User: Dow
* Date: 5/7/2015
* Desc:
 */
if (typeof define !== 'function') { var define = require('amdefine')(module) };
define(['../../../index-setting.json', './service-register'], function(setting, sr) {
  var exports, getService, sm, startService, startServicesSync;
  sm = new sr.ServiceRegister(setting, 'frame');
  getService = function(name, callback) {
    return sm.getService(name, callback);
  };
  startService = function(name, callback) {
    return sm.startService(name, callback);
  };
  startServicesSync = function(name, callback) {
    return sm.startServicesSync(name, callback);
  };
  return exports = {
    getService: getService,
    startService: startService,
    startServicesSync: startServicesSync
  };
});
