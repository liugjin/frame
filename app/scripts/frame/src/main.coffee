###
* File: main
* User: Dow
* Date: 2014/10/8
###

# compatible for node.js and requirejs
`if (typeof define !== 'function') { var define = require('amdefine')(module) }`

define [
  './module'
  './services/common-service'
  './services/frame-service'
  # {{service-file}}
  './controllers/frame-controller'
  './controllers/live-main-controller'
  './controllers/login-controller'
  # {{controller-file}}

  'graphic-directives'
  './directives/menu/component'
  './directives/header/component'
  './directives/main-dashboard/component'
  './directives/iiot-header/component'
  './directives/graphic-box/component'
  # {{directive-file}}
  # {{filter-file}}

], (
  module
  commonService
  predictiveService
  # {{service-namespace}}
  predictiveController
  liveMainController
  loginController
  # {{controller-namespace}}
  graphicDirectives
  menuDirective
  headerDirective
  mainDashboardDirective
  iiotHeaderDirective
  graphicBoxDirective
  # {{directive-namespace}}

  # {{filter-namespace}}

) ->
  # services
  module.service 'commonService', ['$rootScope', '$http', 'modelEngine','liveService', 'reportingService', commonService.CommonService]
  module.service 'predictiveService', ['$rootScope', 'httpService', ($rootScope, httpService) ->
    new predictiveService.PredictiveService $rootScope, httpService
  ]
  # {{service-register}}

  # controllers
  # add $timeout and modelEngine
  createModelController20 = (name, Controller, type, key, title) ->
    module.controller name, ['$scope', '$rootScope', '$routeParams', '$location', '$window', '$timeout', 'modelManager', 'modelEngine', 'uploadService',
      ($scope, $rootScope, $routeParams, $location, $window, $timeout, modelManager, modelEngine, uploadService) ->
        options =
          type: type
          key: key
          title: title
          uploadUrl: setting.urls.uploadUrl
          fileUrl: setting.urls.fileUrl
          url: setting.urls[type]

        new Controller $scope, $rootScope, $routeParams, $location, $window, $timeout, modelManager, modelEngine, uploadService, options
    ]

  # add frame service
  createModelController21 = (name, Controller, type, key, title) ->
    module.controller name, ['$scope', '$rootScope', '$routeParams', '$location', '$window', '$timeout', 'modelManager', 'modelEngine', 'uploadService', 'predictiveService'
      ($scope, $rootScope, $routeParams, $location, $window, $timeout, modelManager, modelEngine, uploadService, predictiveService) ->
        options =
          type: type
          key: key
          title: title
          uploadUrl: setting.urls.uploadUrl
          fileUrl: setting.urls.fileUrl
          url: setting.urls[type]

        new Controller $scope, $rootScope, $routeParams, $location, $window, $timeout, modelManager, modelEngine, uploadService, predictiveService, options
    ]

  createModelController21 'PredictiveController', predictiveController.PredictiveController, 'project', ['user', 'project'], 'frame'
  module.controller 'LiveMainController', ['$scope', '$rootScope', '$routeParams', '$location', '$window', '$translate', 'storage', 'authService', 'liveService', 'modelManager', 'modelEngine', '$filter', liveMainController.LiveMainController]
  module.controller 'LoginController', ['$scope', '$rootScope', '$routeParams', '$location', '$window', 'authService', 'storage', loginController.LoginController]
  # {{controller-register}}

  # directives
  module.directive 'graphicViewer', ['$window', '$timeout', 'modelManager', 'storage', graphicDirectives.GraphicViewerDirective]
  module.directive 'graphicPlayer', ['$window', '$timeout', '$compile', 'modelManager', 'liveService', 'storage', graphicDirectives.GraphicPlayerDirective]
  module.directive 'elementPopover', ['$timeout', '$compile', graphicDirectives.ElementPopoverDirective]
  # {{directive-register}}

  createDirective = (name, Directive) ->
    module.directive name, ['$timeout', '$window', '$compile', '$routeParams', 'commonService', ($timeout, $window, $compile, $routeParams, commonService)->
      new Directive $timeout, $window, $compile, $routeParams, commonService
    ]
  createDirective 'menu', menuDirective.MenuDirective
  createDirective 'header', headerDirective.HeaderDirective
  createDirective 'mainDashboard', mainDashboardDirective.MainDashboardDirective
  createDirective 'iiotHeader', iiotHeaderDirective.IiotHeaderDirective
  createDirective 'graphicBox', graphicBoxDirective.GraphicBoxDirective
  # {{component-register}}

  #filters
  # {{filter-register}}


  #filters
  # {{filter-register}}

