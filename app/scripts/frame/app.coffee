###
* File: app
* User: Dow
* Date: 2014/10/24
###

# compatible for node.js and requirejs
`if (typeof define !== 'function') { var define = require('amdefine')(module) }`

define ['angular', './routes', 'socketio',
        'ngRoute', 'angularLocalStorage', 'angular-moment', 'angularSocketio', 'angular-translate', 'angular-translate-loader-static-files'
        'src'
], (angular, routes, io) ->
  app = angular.module 'app', ['ngRoute', 'angularLocalStorage', 'angularMoment', 'btford.socket-io', 'pascalprecht.translate', 'clc.frame']

  # route navigation
  app.config ['$routeProvider', '$locationProvider', '$translateProvider'
  , ($routeProvider, $locationProvider, $translateProvider) ->
#    $locationProvider.html5Mode false
    $locationProvider.html5Mode
      enabled: false
      requireBase: false
    .hashPrefix ''

    $translateProvider.useSanitizeValueStrategy 'escaped'

    $translateProvider.useStaticFilesLoader
      prefix: '/frame/res/languages/locale-'
      suffix: '.json'

      router = new routes.Router $routeProvider
    router.start()
  ]

  app.factory 'socket', ['$location', 'socketFactory', ($location, socketFactory) ->
    ioUrl = "#{$location.$$protocol}://#{$location.$$host}:#{window.setting.ioPort ? $location.port()}"

    console.log "#{new Date().toISOString()} connecting socket.io to #{ioUrl}"
    server = io.connect ioUrl

    mysocket = socketFactory ioSocket: server
    mysocket.forward 'error'
    mysocket
  ]

  # make sure user login
  app.run ['$rootScope', '$location', ($rootScope, $location) ->
    $rootScope.$on '$routeChangeStart', (event, next, current) ->
      $rootScope.path = path = $location.url()

      if not $rootScope.user
        # no redirect for register and login
        if path isnt '/register' and path.indexOf('/login') < 0
          # remember last path for redirection after success login
          $rootScope.lastPath = path
          $location.path('/login').replace()
  ]

  exports =
    app: app