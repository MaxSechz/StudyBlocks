StudyBlocks.Views.DecksIndex = Backbone.CompositeView.extend({
  tagName: "section",
  className: "deck-view",
  template: JST["decks/index"],
  events: {
    "click .new-deck": "newDeck"
  },

  initialize: function () {
    this.listenTo(this.collection, "sync", this.render)
  },

  render: function () {
    var content = this.template();
    this.$el.html(content);
    this.renderDecks();
    return this;
  },

  renderDecks: function () {
    this.collection.each(this.addDeck.bind(this));
  },

  addDeck: function (deck) {
    var deckView = new StudyBlocks.Views.DeckTile({ model: deck })
    this.addSubview(".decks", deckView);
  },

  newDeck: function () {
    var emptyDeck = new StudyBlocks.Models.Deck();
    var deckForm = new StudyBlocks.Views.DeckForm({
      model: emptyDeck
    });
    this.addSubview(".decks", deckForm)
  },

});
