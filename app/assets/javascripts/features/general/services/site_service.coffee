class SiteSrv extends @RestSrv
  @register()
  @inject '$http'

  getCuisines: (callback)->
    @$http.get('/cuisines.json').success (data, status, headers, config)->
      callback(data, status, headers, config)

  getAmenities: (callback)->
    @$http.get('/amenities.json').success (data, status, headers, config)->
      callback(data, status, headers, config)

