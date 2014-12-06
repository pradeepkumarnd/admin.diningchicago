DinchiAdminApp.controller 'OtherSitesController', ($rootScope, $scope, $http)->
  $scope.$on '$viewContentLoaded', ->
    console.log 'Other Sites loaded'
  # set sidebar closed and body solid layout mode
  $rootScope.settings.layout.pageBodySolid = true
  $rootScope.settings.layout.pageSidebarClosed = false
