# Dinchi admin application
@DinchiAdminApp = angular.module('DinchiAdminApp', [
  'ui.router'
  'ui.bootstrap'
  'restangular'
  'templates'
  'ngSanitize'
  'checklist-model'
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
    # Restaurant Listing states
    .state 'restaurants',
      url: '/restaurants'
      templateUrl: 'views/restaurants/list.html'
      controller: 'RestaurantsCtrl'
    # Restaurant profile states
    .state 'restaurant',
      url: '/restaurants/:permalink'
      abstract: true
      templateUrl: 'views/restaurants/show/header.html'
      controller: 'RestaurantCtrl'
    .state 'restaurant.details',
      url: '/details'
      templateUrl: 'views/restaurants/show/details.html'
    .state 'restaurant.history',
      url: '/history'
      templateUrl: 'views/restaurants/show/history.html'
    # Edit restaurant states
    .state 'edit-restaurant',
      url: '/restaurants/:permalink/edit'
      abstract: true
      templateUrl: 'views/restaurants/edit/header.html'
      controller: 'EditRestaurantCtrl'
    .state 'edit-restaurant.profile',
      url: '/profile'
      templateUrl: 'views/restaurants/edit/profile.html'
    .state 'edit-restaurant.pictures',
      url: '/pictures'
      templateUrl: 'views/restaurants/edit/pictures.html'
    .state 'edit-restaurant.menus',
      url: '/menus'
      templateUrl: 'views/restaurants/edit/menus.html'
    # Other sites
    .state 'other-sites',
      url: '/other-sites'
      templateUrl: 'views/other-sites.html'
      controller: 'OtherSitesCtrl'
]

@DinchiAdminApp.config([
  '$httpProvider', ($httpProvider)->
    $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
])

@Rang.conf.app = @DinchiAdminApp

# Init global settings and run the app
@DinchiAdminApp.run [
  '$rootScope'
  'settings'
  '$state'
  ($rootScope, settings, $state) ->
    $rootScope.$state = $state # state to be accessed from view
    $state.isRestaurant = ->
      $rootScope.r?
    $state.isRestaurantDashboard = ->
      $state.isRestaurant() && $state.is('restaurant.details')
    $state.isRestaurantHistory = ->
      $state.isRestaurant() && $state.is('restaurant.history')

]
