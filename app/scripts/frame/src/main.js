// Generated by IcedCoffeeScript 108.0.11

/*
* File: main
* User: Dow
* Date: 2014/10/8
 */
if (typeof define !== 'function') { var define = require('amdefine')(module) };
define(['./module', './services/common-service', './services/frame-service', './controllers/frame-controller', './controllers/live-main-controller', './controllers/login-controller', 'graphic-directives', './directives/menu/component', './directives/header/component', './directives/main-dashboard/component', './directives/iiot-header/component', './directives/graphic-box/component'], function(module, commonService, predictiveService, predictiveController, liveMainController, loginController, graphicDirectives, menuDirective, headerDirective, mainDashboardDirective, iiotHeaderDirective, graphicBoxDirective) {
  var createDirective, createModelController20, createModelController21;
  module.service('commonService', ['$rootScope', '$http', 'modelEngine', 'liveService', 'reportingService', commonService.CommonService]);
  module.service('predictiveService', [
    '$rootScope', 'httpService', function($rootScope, httpService) {
      return new predictiveService.PredictiveService($rootScope, httpService);
    }
  ]);
  createModelController20 = function(name, Controller, type, key, title) {
    return module.controller(name, [
      '$scope', '$rootScope', '$routeParams', '$location', '$window', '$timeout', 'modelManager', 'modelEngine', 'uploadService', function($scope, $rootScope, $routeParams, $location, $window, $timeout, modelManager, modelEngine, uploadService) {
        var options;
        options = {
          type: type,
          key: key,
          title: title,
          uploadUrl: setting.urls.uploadUrl,
          fileUrl: setting.urls.fileUrl,
          url: setting.urls[type]
        };
        return new Controller($scope, $rootScope, $routeParams, $location, $window, $timeout, modelManager, modelEngine, uploadService, options);
      }
    ]);
  };
  createModelController21 = function(name, Controller, type, key, title) {
    return module.controller(name, [
      '$scope', '$rootScope', '$routeParams', '$location', '$window', '$timeout', 'modelManager', 'modelEngine', 'uploadService', 'predictiveService', function($scope, $rootScope, $routeParams, $location, $window, $timeout, modelManager, modelEngine, uploadService, predictiveService) {
        var options;
        options = {
          type: type,
          key: key,
          title: title,
          uploadUrl: setting.urls.uploadUrl,
          fileUrl: setting.urls.fileUrl,
          url: setting.urls[type]
        };
        return new Controller($scope, $rootScope, $routeParams, $location, $window, $timeout, modelManager, modelEngine, uploadService, predictiveService, options);
      }
    ]);
  };
  createModelController21('PredictiveController', predictiveController.PredictiveController, 'project', ['user', 'project'], 'frame');
  module.controller('LiveMainController', ['$scope', '$rootScope', '$routeParams', '$location', '$window', '$translate', 'storage', 'authService', 'liveService', 'modelManager', 'modelEngine', '$filter', liveMainController.LiveMainController]);
  module.controller('LoginController', ['$scope', '$rootScope', '$routeParams', '$location', '$window', 'authService', 'storage', loginController.LoginController]);
  module.directive('graphicViewer', ['$window', '$timeout', 'modelManager', 'storage', graphicDirectives.GraphicViewerDirective]);
  module.directive('graphicPlayer', ['$window', '$timeout', '$compile', 'modelManager', 'liveService', 'storage', graphicDirectives.GraphicPlayerDirective]);
  module.directive('elementPopover', ['$timeout', '$compile', graphicDirectives.ElementPopoverDirective]);
  createDirective = function(name, Directive) {
    return module.directive(name, [
      '$timeout', '$window', '$compile', '$routeParams', 'commonService', function($timeout, $window, $compile, $routeParams, commonService) {
        return new Directive($timeout, $window, $compile, $routeParams, commonService);
      }
    ]);
  };
  createDirective('menu', menuDirective.MenuDirective);
  createDirective('header', headerDirective.HeaderDirective);
  createDirective('mainDashboard', mainDashboardDirective.MainDashboardDirective);
  createDirective('iiotHeader', iiotHeaderDirective.IiotHeaderDirective);
  return createDirective('graphicBox', graphicBoxDirective.GraphicBoxDirective);
});
