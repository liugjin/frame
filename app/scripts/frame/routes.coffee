###
* File: routes
* User: Dow
* Date: 2014/10/24
###

# compatible for node.js and requirejs
`if (typeof define !== "function") { var define = require("amdefine")(module) }`

define ["clc.foundation.angular/router"], (base) ->
  class Router extends base.Router
    constructor: ($routeProvider) ->
      super $routeProvider

    start: () ->
      namespace = window.setting.namespace ? "frame"
      namespace += "/portal"

      @routeTemplateUrl "/login", "/#{namespace}/templates/login", "LoginController"
      @routeTemplateUrl "/users/:user", "/#{namespace}/templates/user", "UserController"
      @routeTemplateUrl "/401", "/#{namespace}/templates/401", "MainController"
      @routeTemplateUrl "/", "/#{namespace}/templates/index", "IndexController"

      # project model
      @routeTemplateUrl "/projects", "/#{namespace}/templates/projects", "ProjectsController"
      @routeTemplateUrl "/project/:user/:project", "/#{namespace}/templates/project", "ProjectController"
      @routeTemplateUrl "/frame/:user/:project", "/#{namespace}/templates/frame", "PredictiveController"
      # {{route-register}}

      super


  exports =
    Router: Router