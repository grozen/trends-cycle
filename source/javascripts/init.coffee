Cycle.createRenderer('main#main').inject(TrendsView.getInstance())
Cycle.circularInject(SearchResults.getInstance(), TrendsView.getInstance(), TrendsIntent.getInstance())
