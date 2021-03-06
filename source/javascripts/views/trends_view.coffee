class @TrendsView
  @h = Cycle.h

  constructor: ->
    raise "Get the instance by calling getInstance()"

  @getInstance: ->
    @instance || @initialize()

  @initialize: ->
    me = @

    @instance = Cycle.createView((model) ->
      vtree$: model.get('json$').map((json) ->
        me.h('.wrapper', {}, [
          me.vrenderSearchSection(),
          me.vrenderResultSection(json)
        ])
      )
    )

  @vrenderSearchSection: ->
    @h('section.search', {}, [
      # TODO: I hacked cycle.js to call prevent-default when hooking up events.
      # Do something more robust.
      @h('form#search', {onsubmit: 'searchSubmits$'}, [
        @h('input#q', {autocomplete: 'off', name: 'query', type: 'text', placeholder: 'Add term'})
      ])
    ])

  @vrenderResultSection: (json) ->
    @h('section.results', {}, @h('div', JSON.stringify(json)))
