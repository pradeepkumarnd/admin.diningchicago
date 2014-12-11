# Dinchi admin application
@DinchiAdminApp = angular.module('DinchiAdminApp', [
  'ui.router'
  'ui.bootstrap'
  'restangular'
  'templates'
  'ngSanitize'
])

# Setup global settings
@DinchiAdminApp.factory 'settings', [
  '$rootScope'
  ($rootScope) ->
    settings =
      layout:
        pageSidebarClosed: false # sidebar menu state
        pageBodySolid: false # solid body color state
        pageAutoScrollOnLoad: 1000 # auto scroll to top on page load

      layoutImgPath: "#{Metronic.getAssetsPath()}admin/layout/img/"
      layoutCssPath: "#{Metronic.getAssetsPath()}admin/layout/css/"

    $rootScope.settings = settings
    settings
]

# Setup Rounting For All Pages
@DinchiAdminApp.config [
  '$stateProvider'
  '$urlRouterProvider'
  ($stateProvider, $urlRouterProvider) ->

    # Redirect any unmatched url
    $urlRouterProvider.otherwise '/dashboard'

    # Dashboard
    $stateProvider
    .state 'dashboard',
      url: '/dashboard'
      templateUrl: 'views/dashboard.html'
      data:
        pageTitle: 'Admin Dashboard Template'
      controller: 'DashboardCtrl'
    .state 'restaurants',
      url: '/restaurants'
      templateUrl: 'views/restaurants.html'
      controller: 'RestaurantsCtrl'
    .state 'restaurant',
      url: '/restaurants/:permalink'
      abstract: true
      templateUrl: 'views/restaurant.html'
      controller: 'RestaurantCtrl'
    .state 'restaurant.details',
      url: '/details'
      templateUrl: 'views/restaurant_details.html'
    .state 'restaurant.history',
      url: '/history'
      templateUrl: 'views/restaurant_history.html'
    .state 'other-sites',
      url: '/other-sites'
      templateUrl: 'views/other-sites.html'
      controller: 'OtherSitesCtrl'
]

@Rang.conf.app = @DinchiAdminApp

# Init global settings and run the app
@DinchiAdminApp.run [
  '$rootScope'
  'settings'
  '$state'
  ($rootScope, settings, $state) ->
    $rootScope.$state = $state # state to be accessed from view
]
