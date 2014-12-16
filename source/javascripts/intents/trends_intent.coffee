class @TrendsIntent
  constructor: ->
    raise "Get the instance by calling getInstance()"

  @getInstance: ->
    @instance || @initialize()

  @initialize: ->
    @instance = Cycle.createIntent(['searchSubmits$'], (view) ->
      searchRequests$: view.searchSubmits$.map((event) ->
        $(event.target).find('#q').val()
      )
    )
