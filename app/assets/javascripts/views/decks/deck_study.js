StudyBlocks.Views.DeckStudy = Backbone.CollectionView.extend({
  tagName: "main",
  className: "deck-study notready",
  template: JST['decks/study'],
  selector: '.cards-list',
  subModelViewName: 'CardStudy',
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
