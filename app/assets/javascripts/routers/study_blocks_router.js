StudyBlocks.Routers.Router = Backbone.Router.extend({
  routes: {
    '': "deckIndex"
  },

  initialize: function (options) {
    this.$rootEl = options.$rootEl;
    this.decks = options.decks;
    this.decks.fetch()
  },

  deckIndex: function () {
    indexView = new StudyBlocks.Views.DecksIndex({ collection: this.decks });
    this._swapView(indexView);
  },

  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }
});
