StudyBlocks.Views.DeckForm = Backbone.CollectionView.extend({
  tagName: "form",
  className: "deck-form",
  template: JST["decks/form"],
  events: {
    "submit": "submit",
    "click .new-card": "newCard"
  },
  subModelViewName: "CardShow",
  renderThis: {
    deck: 'model',
    courses: 'courses'
  },
  selector: '.cards-preview',

  initialize: function () {
    this.courses = new StudyBlocks.Collections.Courses();
    this.courses.fetch();
    this.listenTo(this.courses, "sync", this.render);
    this.listenTo(this.model.cards(), "sync add", this.renderCollection);
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
