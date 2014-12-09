DinchiAdminApp.controller 'RestaurantsController', ($rootScope, $scope, $http)->
  $scope.restaurants = []
  $scope.page = 1
  $scope.total = 0
  $scope.perPage = 20
  $scope.perPageOptions = [20, 50, 100]

  # $scope.$on '$viewContentLoaded', ->
  #   # TableAjax.init();
  #   console.log 'Restaurants List Rendered'
  # # set sidebar closed and body solid layout mode

  $scope.$watch 'page', (newVal, oldVal)->
    $scope.refresh() if newVal != oldVal

  $scope.$watch 'perPage', (newVal, oldVal)->
    if newVal != oldVal
      if $scope.page != 1
        $scope.page = 1
      else
        $scope.refresh()

  $scope.totalPages = ()->
    Math.floor(($scope.total + $scope.perPage - 1) / $scope.perPage)

  $scope.refresh = ->
    $http.get('/restaurants.json', {params: {page: $scope.page, per_page: $scope.perPage}})
    .success (data, status, headers, config)->
      angular.copy(data.rows, $scope.restaurants)
      $scope.total = data.total

  $scope.filtersActive = ->
    false

  $scope.isPublished = (rest)->
    if rest.state == 'published' then true else false

  $scope.isPayed = (rest)->
    if rest.payed == 'payed' then true else false

  $scope.closedClass = (rest)->
    if rest.closed then 'warning' else 'info'

  $scope.closedLabel = (rest)->
    if rest.closed then 'closed' else 'opened'

  $scope.nextAvailable = ->
    $scope.page < $scope.total / $scope.perPage
  $scope.prevAvailable = ->
    $scope.page > 1
  $scope.next = ->
    $scope.page = $scope.page + 1
  $scope.previous = ->
    $scope.page =  $scope.page - 1 if $scope.page > 1

  $scope.refresh()
  $rootScope.settings.layout.pageBodySolid = false
  $rootScope.settings.layout.pageSidebarClosed = false
  console.log 'RestaurantsController'
