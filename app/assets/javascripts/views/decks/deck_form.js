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
    this.listenTo(this.courses, "sync", this.render)
  },
  render: function () {
    var content = this.template({ deck: this.model, courses: this.courses });
    this.$el.html(content);
    return this;
  },

  submit: function (event) {
    event.preventDefault()
    var formView = this;
    var data = { deck: this.$el.serializeJSON() }
    data.deck.cards = this.model.cards().toJSON()
    console.log(data)
    this.model.set(data);
    this.model.save({}, {
      success: function (model, response) {
        Backbone.history.navigate("decks/" + model.id, {trigger: true})
      },
      error: function (model, response) {
        console.log(response)
        jQuery.extend(formView.model.errors(), response.responseJSON)
        formView.render()
      }
    });
  },

  newCard: function (event) {
    event.preventDefault();
    var emptyCard = new StudyBlocks.Models.Card();
    var cardFormView = new StudyBlocks.Views.CardForm({
      deck: this.model,
      model: emptyCard
    });
    this.addSubview(".cards-preview", cardFormView);
  }
});
