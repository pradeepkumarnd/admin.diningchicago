class @EditRestaurantCtrl extends @ScopeCtrl
  @register()
  @inject '$rootScope', 'RestaurantSrv', 'SiteSrv', '$stateParams', '$state'

  initialize: ->
    @s.r = null
    @s.map = null
    @s.isModified = false
    @s.tabs = [
      {id: 1, heading: 'Profile', route: 'edit-restaurant.profile', active:false, initialized: false }
      {id: 2, heading: 'Pictures', route: 'edit-restaurant.pictures', active:false, initialized: false }
      {id: 3, heading: 'Menus', route: 'edit-restaurant.menus', active:false, initialized: false }
    ]

    @$rootScope.settings.layout.pageBodySolid = false
    @$rootScope.settings.layout.pageSidebarClosed = false
    @loadRestaurant()
    @loadCuisines()
    @loadAmenities()
    self = @
    # @s.$state = @$state
    @s.$on '$stateChangeSuccess', ->
      self.s.tabs.forEach (tab)->
        tab.active = self.s.active(tab.route)

    @s.$on '$viewContentLoaded', ->
      # self.drawMap() if self.s.tabs[0].active && self.restaurantLoaded

  loadRestaurant: ->
    self = @
    @RestaurantSrv.getRestaurant @$stateParams.permalink, (data, status)->
      self.s.r = data
      self.$rootScope.r = self.s.r
      self.restaurantLoaded = true

  loadCuisines: ->
    self = @
    @SiteSrv.getCuisines (data, status)->
      self.s.cuisines = data.cuisines

  loadAmenities: ->
    self = @
    @SiteSrv.getAmenities (data, status)->
      self.s.amenities = data.amenities

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

  checkAll: ->
    console.log 'Check All'
  uncheckAll: ->
    console.log "Uncheck"
  checkFirst: ->
    console.log 'First'
