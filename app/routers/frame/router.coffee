###
* File: dcim-router
* User: Dow
* Date: 8/22/2016
* Desc: 
###

# compatible for node.js and requirejs
`if (typeof define !== 'function') { var define = require('amdefine')(module) }`

define ['clc.foundation.web'], (base) ->
  class Router extends base.Router
    constructor: (options, app, namespace = 'frame') ->
      super options, app, namespace

    route: ->
      super


  exports =
    Router: Router
