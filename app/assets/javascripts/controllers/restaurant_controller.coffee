class @RestaurantCtrl extends @ScopeCtrl
  @register()
  @inject '$rootScope', 'RestaurantSrv', '$stateParams', '$state'

  initialize: ->
    @s.r = null
    @s.map = null
    @s.tabs = [
      {id: 1, heading: 'Details', route: 'restaurant.details', active:false, initialized: false }
      {id: 2, heading: 'History', route: 'restaurant.history', active:false, initialized: false }
    ]

    @$rootScope.settings.layout.pageBodySolid = false
    @$rootScope.settings.layout.pageSidebarClosed = false
    @loadRestaurant()
    self = @
    # @s.$state = @$state
    @s.$on '$stateChangeSuccess', ->
      self.s.tabs.forEach (tab)->
        tab.active = self.s.active(tab.route)

    @s.$on '$viewContentLoaded', ->
      self.drawMap() if self.s.tabs[0].active && self.restaurantLoaded

  loadRestaurant: ->
    self = @
    @RestaurantSrv.getRestaurant @$stateParams.permalink, (data, status)->
      self.s.r = data
      self.$rootScope.r = self.s.r
      self.restaurantLoaded = true
      self.drawMap() if self.s.tabs[0].active

  publishedClass: ->
    if @s.r && @s.r.state == 'published' then 'success' else 'danger'

  isPublished: ->
    if @s.r && @s.r.state == 'published' then true else false

  websiteLink: ->
    if @s.r && @s.r.website then "http://#{@s.r.website}" else ''

  active: (route)->
    @$state.is(route)

  go: (route)->
    @$state.go(route)

  drawMap: ->
    return if @map
    myLatlng = new google.maps.LatLng(@s.r.address.lat, @s.r.address.lng)
    mapOptions =
      zoom: 15,
      center: myLatlng
    @map = new google.maps.Map(document.getElementById('map'), mapOptions)
    marker = new google.maps.Marker
      position: myLatlng
      map: @map
