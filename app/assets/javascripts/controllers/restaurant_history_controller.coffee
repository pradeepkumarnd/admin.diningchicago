class @RestaurantHistoryCtrl extends @ScopeCtrl
  @register()
  @inject '$rootScope', 'RestaurantSrv', '$stateParams'

  initialize: ->
    @s.r = null
    @$rootScope.settings.layout.pageBodySolid = false
    @$rootScope.settings.layout.pageSidebarClosed = true
    @loadRestaurant()

  loadRestaurant: ->
    self = @
    @RestaurantSrv.getRestaurant @$stateParams.permalink, (data, status)->
      self.s.r = data
      self.drawMap()

  publishedClass: ->
    if @s.r && @s.r.state == 'published' then 'success' else 'danger'

  isPublished: ->
    if @s.r && @s.r.state == 'published' then true else false

  websiteLink: ->
    if @s.r && @s.r.website then "http://#{@s.r.website}" else ''

  drawMap: ->
    myLatlng = new google.maps.LatLng(@s.r.address.lat, @s.r.address.lng)
    mapOptions =
      zoom: 15,
      center: myLatlng
    map = new google.maps.Map(document.getElementById('map'), mapOptions)
    marker = new google.maps.Marker
      position: myLatlng
      map: map
