StudyBlocks.Views.DeckShow = Backbone.CompositeView.extend({
  tagName: "main",
  className: "deck",
  template: JST["decks/show"],

  initialize: function () {
    this.listenTo(this.model, "sync", this.render)
  },

  render: function () {
    var content = this.template({ deck: this.model });
    this.$el.html(content);
    this.renderCards();
    return this;
  },

  addCard: function (card) {
    var cardView = new StudyBlocks.Views.CardShow({ model: card });
    this.addSubview('.cards', cardView);
  },

  renderCards: function () {
    this.model.cards().each(this.addCard.bind(this));
  }
});
