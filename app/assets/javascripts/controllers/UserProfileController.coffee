DinchiAdminApp.controller "UserProfileController", ($rootScope, $scope, $http, $timeout) ->
  $scope.$on "$viewContentLoaded", ->
    Metronic.initAjax() # initialize core components
    Layout.setSidebarMenuActiveLink "set", $("#sidebar_menu_link_profile") # set profile link active in sidebar menu

  # set sidebar closed and body solid layout mode
  $rootScope.settings.layout.pageBodySolid = true
  $rootScope.settings.layout.pageSidebarClosed = true
