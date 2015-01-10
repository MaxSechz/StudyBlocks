StudyBlocks.Views.DeckShow = Backbone.CompositeView.extend({
  tagName: "main",
  className: "deck",
  template: JST["decks/show"],
  events: {
    "click .new": "newCard",
    "click .delete": "deleteDeck"
  },

  initialize: function () {
    this.listenTo(this.model, "sync", this.switchCards);
    this.listenTo(this.model.cards(), "add", this.switchCards);
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

  switchCards: function () {
    for (var attr in this.subviews()) {
      subs = this.subviews()[attr];
      for (var i = subs.length; i > 0; i = subs.length) {
        this.removeSubview('.cards', subs[0]);
      }
    }
    this.renderCards();
  },

  newCard: function (event) {
    event.preventDefault();
    console.log(this.model)
    var emptyCard = new StudyBlocks.Models.Card({}, { deck: this.model });
    var formView = new StudyBlocks.Views.CardForm({
      model: emptyCard,
      submit: true
    });
    this.addSubview('.cards', formView);
  }
});
