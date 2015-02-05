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
    if (this.model.done) {
      this.render();
    } else {
      this.listenTo(this.collection, "sync", this.render);
    }
  }
});
