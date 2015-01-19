StudyBlocks.Views.DeckForm = Backbone.CollectionView.extend({
  tagName: "form",
  className: "deck-form",
  template: JST["decks/form"],
  events: {
    "submit": "submit",
    "click .cancel.deck": "cancelForm",
    "click .cancel": "subFormCancel",
    "click .new-card": "newCard"
  },
  subModelViewName: "CardShow",
  renderThis: {
    deck: 'model',
    courses: 'courses'
  },
  selector: '.cards-preview',
  options: { submit: false },

  initialize: function () {
    this.courses = new StudyBlocks.Collections.Courses();
    this.courses.fetch();
    this.collection.fetch();
    this.listenTo(this.model, "sync", this.render);
    this.listenTo(this.courses, "sync", this.render);
    this.listenTo(this.collection, "sync add", this.renderCollection);
  },

  submit: function (event) {
    event.preventDefault();
    var formView = this;
    var deck = this.$el.serializeJSON();
    this.model.save(deck, {
      success: function (model, response) {
      },
      error: function (model, response) {
        jQuery.extend(formView.model.errors(), response.responseJSON);
        formView.render();
      }
    });
  },

  cancelForm: function (event) {
    event.preventDefault();
    this.remove();
    $(".modal").empty().removeClass("form");
  },

  subFormCancel: function (event) {
    event.preventDefault();
  },

  newCard: function (event) {
    event.preventDefault();
    var emptyCard = new StudyBlocks.Models.Card({}, { deck: this.model });
    var cardFormView = new StudyBlocks.Views.CardForm({
      model: emptyCard,
      submit: false
    });
    this.$el.addClass("inactive");
    this.addSubview(".cards-preview", cardFormView);
  }
});
