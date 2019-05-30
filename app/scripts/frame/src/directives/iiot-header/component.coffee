###
* File: iiot-header-directive
* User: David
* Date: 2018/11/17
* Desc:
###

# compatible for node.js and requirejs
`if (typeof define !== 'function') { var define = require('amdefine')(module) }`

define ['../base-directive','text!./style.css', 'text!./view.html', 'underscore', "moment"], (base, css, view, _, moment) ->
  class IiotHeaderDirective extends base.BaseDirective
    constructor: ($timeout, $window, $compile, $routeParams, commonService)->
      @id = "iiot-header"
      super $timeout, $window, $compile, $routeParams, commonService

    setScope: ->

    setCSS: ->
      css

    setTemplate: ->
      view

    show: (scope, element, attrs) =>
      scope.setting = setting
      @getStation scope, "_elesys_manager_station", () =>
        @getEquipment scope, "_manager_equipment"

    resize: (scope)->

    dispose: (scope)->


  exports =
    IiotHeaderDirective: IiotHeaderDirective