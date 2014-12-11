class @AppCtrl extends @ScopeCtrl
  @register()
  initialize: ->
    @s.$on '$viewContentLoaded', ->
      Metronic.initComponents()
