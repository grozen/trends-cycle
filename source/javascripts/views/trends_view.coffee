class @TrendsView
  @h = Cycle.h

  constructor: ->
    raise "Get the instance by calling getInstance()"

  @getInstance: ->
    @instance || initialize()

  @initialize: ->
    @instance = Cycle.createView(['json$'], (model) ->
      events: ['searchSubmits$']
      vtree$: model.json$.map((jsons) ->
        @h('.wrapper', {}, [
          @vrenderSearchSection,
          @vrenderResultSection(jsons)
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
