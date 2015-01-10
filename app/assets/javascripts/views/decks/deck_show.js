StudyBlocks.Views.DeckShow = Backbone.CompositeView.extend({
  tagName: "main",
  className: "deck",
  template: JST["decks/show"],
  events: {
    "click .new": "newCard",
    "click .delete": "deleteDeck"
  },

  initialize: function () {
    this.listenTo(this.model, "sync", this.render);
    this.listenTo(this.model.cards(), "add", this.renderCards);
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
  },

  newCard: function (event) {
    event.preventDefault();
    var emptyCard = new StudyBlocks.Models.Card({}, { deck: this.model });
    var formView = new StudyBlocks.Views.CardForm({
      model: emptyCard,
      submit: true
    });
    this.addSubview('.cards', formView);
  },

  deleteDeck: function (event) {
    event.preventDefault();
    this.model.destroy({
      success: function () {
        Backbone.history.navigate('', { trigger :true } );
      }
    });
  }
});
