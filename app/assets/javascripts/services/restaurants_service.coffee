class RestaurantSrv extends @RestSrv
  @register()
  @inject '$http'

  getRestaurants: (params, callback)->
    @$http.get('/restaurants.json', {params: params})
    .success (data, status, headers, config)->
      callback(data, status, headers, config)

  getRestaurant: (permalink, callback)->
    @Restangular.one('restaurants', permalink).get()
    .then callback

