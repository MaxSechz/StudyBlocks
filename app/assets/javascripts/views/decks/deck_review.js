StudyBlocks.Views.DeckReview = Backbone.CollectionView.extend({
  tagName: "main",
  className: "deck-review",
  template: JST['decks/review'],
  selector: '.cards-list',
  subModelViewName: 'CardReview',
  renderThis: {
    deck: 'model'
  },
  initialize: function () {
    this.listenTo(this.model, "sync", this.render);
  }
});
