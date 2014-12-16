class @SearchResults
  constructor: ->
    raise "Get the instance by calling getInstance()"

  @getInstance: ->
    @instance || initialize()

  @initialize: ->
    @instance = Cycle.createModel(['searchRequest$'], (intent) ->
      queryStream$ = 'Something!'
    )
