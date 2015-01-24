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
  options: { submit: false },

  initialize: function (options) {
    this.decks = options.decks;
    this.$el.imagesLoaded(this.renderCollection.bind(this));
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
        formView.decks && formView.decks.add(model);
        formView.$(".cancel").click();
      },
      error: function (model, response) {
        jQuery.extend(formView.model.errors(), response.responseJSON);
        formView.render();
      }
    });
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
    this.addSubview(this.selector, cardFormView);
  },
});
