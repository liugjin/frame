###
* File: main
* User: Dow
* Date: 2014/10/24
###

requirejs ['json!/frame/setting', 'materialize-css', 'angular', './app'
], (setting, M, angular, app) ->
  window.setting = setting

  angular.bootstrap document.documentElement, ['app']
