StudyBlocks.Views.DecksIndex = Backbone.CollectionView.extend({
  tagName: "section",
  className: "deck-view",
  template: JST["decks/index"],
  events: {
    "click .new-deck": "newDeck"
  },
  subModelViewName: "DeckTile",
  selector: ".decks",
  options: {
    writeable: true
  },

  initialize: function () {
    this.listenTo(this.collection, "sync", this.render);
  },

  newDeck: function () {
    event.preventDefault();
    var emptyDeck = new StudyBlocks.Models.Deck();
    var deckForm = new StudyBlocks.Views.DeckForm({
      model: emptyDeck,
      collection: emptyDeck.cards()
    });
    this.addSubview(".decks", deckForm);
  },

});
