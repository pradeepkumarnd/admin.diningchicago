DinchiAdminApp.controller 'RestaurantController', ($rootScope, $scope, $http, $stateParams)->
  $scope.r = null

  $rootScope.settings.layout.pageBodySolid = false
  $rootScope.settings.layout.pageSidebarClosed = true

  $scope.loadRestaurant = ->
    $http.get("/restaurants/#{$stateParams.permalink}.json")
    .success (data, status)->
      $scope.r = data
      $scope.drawMap()
      console.log data

  $scope.publishedClass = ->
    if $scope.r && $scope.r.state == 'published' then 'success' else 'danger'

  $scope.isPublished = ->
    if $scope.r && $scope.r.state == 'published' then true else false

  $scope.websiteLink = ->
    if $scope.r && $scope.r.website then "http://#{$scope.r.website}" else ''

  $scope.drawMap = ->
    myLatlng = new google.maps.LatLng($scope.r.address.lat, $scope.r.address.lng)

    mapOptions =
      zoom: 15,
      center: myLatlng
    map = new google.maps.Map(document.getElementById('map'), mapOptions)

    marker = new google.maps.Marker
      position: myLatlng
      map: map

  $scope.loadRestaurant()
