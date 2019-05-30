###
 * File: routes
 * User: Dow
 * Date: 4/11/13
 * Desc: 
###

setting = require '../index-setting.json'
cr = require '../app/routers/frame/router'

module.exports = ->

  predictiveRouter = new cr.Router setting, @
  predictiveRouter.start()
