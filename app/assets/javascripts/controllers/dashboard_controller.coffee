DinchiAdminApp.controller 'DashboardController', ($rootScope, $scope, $http, $timeout) ->
  $scope.$on '$viewContentLoaded', ->
    Metronic.initAjax()
    Index.init();
    Tasks.initDashboardWidget();

  # set sidebar closed and body solid layout mode
  $rootScope.settings.layout.pageBodySolid = true
  $rootScope.settings.layout.pageSidebarClosed = false
