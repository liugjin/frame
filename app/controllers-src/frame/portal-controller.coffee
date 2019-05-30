###
* File: scrum-controller
* User: Dow
* Date: 2/27/2015
###

# compatible for node.js and requirejs
#`if (typeof define !== 'function') { var define = require('amdefine')(module) }`
`if (typeof define !== 'function') { var define = require('amdefine')(module) }`

define ['clc.foundation.web', '../../services/frame/service-manager'
], (web, sm) ->
  class PortalController extends web.PortalController
    constructor: ->
      super sm

      @predictiveService = sm.getService 'frame'

    onRpc: (method, options, callback) ->
      @predictiveService.rpc method, options, callback


  exports =
    PortalController: PortalController
