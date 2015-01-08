StudyBlocks.Routers.Router = Backbone.Router.extend({
  routes: {
    '': "deckIndex",
    'decks/:id': "deckShow",
  },

  initialize: function (options) {
    this.$rootEl = options.$rootEl;
    this.decks = options.decks;
    this.decks.fetch();
  },

  deckIndex: function () {
    var indexView = new StudyBlocks.Views.DecksIndex({ collection: this.decks });
    this._swapView(indexView);
  },

  deckShow: function (id) {
    var targetDeck = this.decks.getOrFetch(id)
    var showView = new StudyBlocks.Views.DeckShow({ model: targetDeck });
    this._swapView(showView);
  },

  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }
});
