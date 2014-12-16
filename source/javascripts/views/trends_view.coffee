class @TrendsView
  @h = Cycle.h

  constructor: ->
    raise "Get the instance by calling getInstance()"

  @getInstance: ->
    @instance || @initialize()

  @initialize: ->
    me = @

    @instance = Cycle.createView(['json$'], (model) ->
      events: ['searchSubmits$']
      vtree$: model.json$.map((jsons) ->
        me.h('.wrapper', {}, [
          me.vrenderSearchSection(),
          me.vrenderResultSection(jsons)
        ])
      )
    )

  @vrenderSearchSection: ->
    @h('section.search', {}, [
      @h('form#search', {'ev-submit': 'searchSubmits$'}, [
        @h('input#q', {autocomplete: 'off', name: 'query', type: 'text', placeholder: 'Add term'})
      ])
    ])

  @vrenderResultSection: (jsons) ->
    @h('section.results', {}, @h('div', json) for json in jsons)
