###
* File: 02_gateway
* User: Dow
* Date: 5/7/2015
* Desc: 
###

sm = require '../../app/services/frame/service-manager'

module.exports = ->
#  sm.startServicesSync ['register', 'configuration', 'frame']
  sm.startService ['register', 'configuration', 'frame']
