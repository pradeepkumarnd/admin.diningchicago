@DinchiAdminApp.factory 'Restaurant', [ ->
  class Restaurant
    constructor: (@arguments) ->
      @[name] = method for name, method of @arguments
]
