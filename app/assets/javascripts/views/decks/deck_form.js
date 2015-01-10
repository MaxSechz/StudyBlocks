StudyBlocks.Views.DeckForm = Backbone.CompositeView.extend({
  tagName: "form",
  className: "deck-form",
  template: JST["decks/form"],
  events: {
    "submit": "submit",
    "click .new-card": "newCard"
  },

  initialize: function () {
    this.courses = new StudyBlocks.Collections.Courses();
    this.courses.fetch();
    this.listenTo(this.courses, "sync", this.render);
    this.listenTo(this.model.cards(), "add", this.renderCards);
  },

  render: function () {
    var content = this.template({ deck: this.model, courses: this.courses });
    this.$el.html(content);
    this.renderCards();
    return this;
  },

  addCard: function (card) {
    var cardView = new StudyBlocks.Views.CardShow({ model: card });
    this.addSubview('.cards-preview', cardView);
  },

  renderCards: function () {
    this.model.cards().each(this.addCard.bind(this));
  },

  submit: function (event) {
    event.preventDefault();
    var formView = this;
    var deck = this.$el.serializeJSON();
    deck.cards_attributes = this.model.cards().toJSON();
    var data = { deck: deck };
    this.model.set(data);
    this.model.save({}, {
      success: function (model, response) {
        Backbone.history.navigate("decks/" + model.id, {trigger: true});
      },
      error: function (model, response) {
        jQuery.extend(formView.model.errors(), response.responseJSON);
        formView.render();
      }
    });
  },

  newCard: function (event) {
    event.preventDefault();
    var emptyCard = new StudyBlocks.Models.Card({}, { deck: this.model });
    var cardFormView = new StudyBlocks.Views.CardForm({
      model: emptyCard,
      submit: false
    });
    this.addSubview(".cards-preview", cardFormView);
  }
});
