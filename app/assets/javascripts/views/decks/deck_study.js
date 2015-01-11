StudyBlocks.Views.DeckStudy = Backbone.CollectionView.extend({
  tagName: "main",
  className: "deck-study",
  template: JST['decks/study'],
  selector: '.cards-list',
  subModelViewName: 'CardStudy',
  renderThis: {
    deck: 'model'
  },
  initialize: function () {
    this.listenTo(this.model, "sync", this.render);
  }
});
