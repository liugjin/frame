###
* File: frame-controller
* User: Dow
* Date: 3/25/2017
* Desc: 
###

# compatible for node.js and requirejs
`if (typeof define !== 'function') { var define = require('amdefine')(module) }`

define ['clc.foundation.angular/controllers/project-base-controller'], (base) ->
  class PredictiveController extends base.ProjectBaseController
    constructor: ($scope, $rootScope, $routeParams, $location, $window, $timeout, modelManager, modelEngine, uploadService, @predictiveService, options) ->
      super $scope, $rootScope, $routeParams, $location, $window, $timeout, modelManager, modelEngine, uploadService, options

    initialize: (callback)->
      super callback

    echo: ->
      parameters =
        user: @$rootScope.user.user
        time: "client: #{new Date().toISOString()}"

      @predictiveService.echo parameters, (err, result) =>
        @echoResult = result
        @display err, result?.method


  exports =
    PredictiveController: PredictiveController
