class @TrendsIntent
  constructor: ->
    raise "Get the instance by calling getInstance()"

  @getInstance: ->
    @instance || @initialize()

  @initialize: ->
    @instance = Cycle.createIntent((view) ->
      searchRequests$: view.get('searchSubmits$').map((event) ->
        event.preventDefault()
        $(event.target).find('#q').val()
      )
    )
