DinchiAdminApp.controller "TodoController", ($rootScope, $scope, $http, $timeout) ->
  $scope.$on "$viewContentLoaded", ->
    Metronic.initAjax() # initialize core components

  # set sidebar closed and body solid layout mode
  $rootScope.settings.layout.pageBodySolid = true
  $rootScope.settings.layout.pageSidebarClosed = true
