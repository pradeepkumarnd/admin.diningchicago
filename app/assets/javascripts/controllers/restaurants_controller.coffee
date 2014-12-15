class @RestaurantsCtrl extends @ScopeCtrl
  @register()
  @inject '$rootScope', 'RestaurantSrv'

  initialize: ->
    @s.restaurants = []
    @s.page = 1
    @s.total = 0
    @s.perPage = 20
    @s.perPageOptions = [20, 50, 100]
    @$rootScope.r = null
    console.log 'RESTAURANTS'

    @initWatch()
    @refresh()
    @$rootScope.settings.layout.pageBodySolid = false
    @$rootScope.settings.layout.pageSidebarClosed = false

  initWatch: ->
    self = @
    @s.$watch 'page', (newVal, oldVal)->
      self.refresh() if newVal != oldVal

    @s.$watch 'perPage', (newVal, oldVal)->
      if newVal != oldVal
        if self.s.page != 1
          self.s.page = 1
        else
          self.refresh()

  totalPages: ->
    Math.floor((@s.total + @s.perPage - 1) / @s.perPage)

  refresh: ->
    self = @
    @RestaurantSrv.getRestaurants {page: @s.page, per_page: @s.perPage}, (data, status, headers, config)->
      angular.copy(data.rows, self.s.restaurants)
      self.s.total = data.total

  filtersActive: ->
    false

  isPublished: (rest)->
    if rest.state == 'published' then true else false

  isPayed: (rest)->
    if rest.payed == 'payed' then true else false

  closedClass: (rest)->
    if rest.closed then 'warning' else 'info'

  closedLabel: (rest)->
    if rest.closed then 'closed' else 'opened'

  nextAvailable: ->
    @s.page < @s.total / @s.perPage

  prevAvailable: ->
    @s.page > 1

  next: ->
    @s.page = @s.page + 1

  previous: ->
    @s.page =  @s.page - 1 if @s.page > 1
