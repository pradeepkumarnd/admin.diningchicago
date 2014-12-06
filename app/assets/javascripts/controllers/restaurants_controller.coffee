DinchiAdminApp.controller 'RestaurantsController', ($rootScope, $scope, $http)->
  $scope.restaurants = []

  $scope.$on '$viewContentLoaded', ->
    # TableAjax.init();
    console.log 'Restaurants List Rendered'
  # set sidebar closed and body solid layout mode

  $scope.refresh = ->
    $http.get('/restaurants.json').success (data, status, headers, config)->
      angular.copy(data.rows, $scope.restaurants)

  $scope.refresh()
  $rootScope.settings.layout.pageBodySolid = false
  $rootScope.settings.layout.pageSidebarClosed = false
