StudyBlocks.Views.CardForm = Backbone.View.extend({
  tagName: "form",
  className: "card-form",
  template: JST["cards/form"],
  events: {
    "submit": "addCard"
  },

  initialize: function (options) {
    this.deck = options.deck
  },

  render: function () {
    var content = this.template({ card: this.model });
    this.$el.html(content);
    if (this.model.get('format')) {
      var jQuerySearch = "option[value=" + this.model.escape('format') + "]"
      this.$el.find(jQuerySearch).prop({ selected: true })
    }
    return this;
  },

  addCard: function (event) {
    event.preventDefault();
    var attrs = this.$el.serializeJSON();
    this.model.set(attrs);
    this.deck.cards().add(this.model);
    this.remove();
    console.log(this.deck.cards().toJSON())
  }
});
