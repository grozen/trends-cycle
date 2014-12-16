class @SearchResults
  constructor: ->
    raise "Get the instance by calling getInstance()"

  @getInstance: ->
    @instance || initialize()

  @initialize: ->
    @instance = Cycle.createModel(['searchRequest$'], (intent) ->
      queryStream$ = intent.searchRequest$.flatMap((searchTerm) ->
        Cycle.Rx.Observable.fromPromise($.getJSON(
          'https://slack.com/api/search.all',
          token: Secrets.slackToken()
          highlight: 1
          count: 50
          page: 1
          sort: 'timestamp'
          query: searchTerm
        ))

      return json$: queryStream$.startsWith(['I am an initial value!'])
    )
