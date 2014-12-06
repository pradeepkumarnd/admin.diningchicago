# Setup general page controller
DinchiAdminApp.controller "GeneralPageController", [
  "$rootScope"
  "$scope"
  "settings"
  ($rootScope, $scope, settings) ->
    $scope.$on "$viewContentLoaded", ->
      # initialize core components
      Metronic.initAjax()
      # set default layout mode
      $rootScope.settings.layout.pageBodySolid = false
      $rootScope.settings.layout.pageSidebarClosed = false
]
