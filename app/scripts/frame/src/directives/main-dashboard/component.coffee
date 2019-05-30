###
* File: main-dashboard-directive
* User: David
* Date: 2019/05/20
* Desc:
###

# compatible for node.js and requirejs
`if (typeof define !== 'function') { var define = require('amdefine')(module) }`

define ['../base-directive','text!./style.css', 'text!./view.html', 'underscore', "moment"], (base, css, view, _, moment) ->
  class MainDashboardDirective extends base.BaseDirective
    constructor: ($timeout, $window, $compile, $routeParams, commonService)->
      @id = "main-dashboard"
      super $timeout, $window, $compile, $routeParams, commonService

    setScope: ->

    setCSS: ->
      css

    setTemplate: ->
      view

    show: (scope, element, attrs) =>

    resize: (scope)->

    dispose: (scope)->


  exports =
    MainDashboardDirective: MainDashboardDirective