StudyBlocks.Views.CardForm = Backbone.View.extend({
  tagName: "form",
  className: "card-form",
  template: JST["cards/form"],
  events: {
    "submit": "addCard"
  },

  initialize: function (options) {
    this.submit = options.submit;
  },

  render: function () {
    var content = this.template({ card: this.model });
    this.$el.html(content);
    this.setSelected();
    return this;
  },

  setSelected: function () {
    if (this.model.get('format')) {
      var jQuerySearch = "option[value=" + this.model.escape('format') + "]";
      this.$el.find(jQuerySearch).prop({ selected: true });
    }
  },

  addCard: function (event) {
    event.preventDefault();
    var attrs = this.$el.serializeJSON();
    var thisForm = this;
    var thisDeck = this.model.deck;
    this.model.set(attrs);
    if (this.submit) {
      this.model.save({}, {
        success: function (model, response) {
          model.deck = thisDeck;
          thisDeck.cards().add(model, {merge: true});
        }
      });
    } else {
      thisForm.remove();
      thisDeck.cards().add(this.model, {merge: true});
    }
  }
});
