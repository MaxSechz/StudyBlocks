StudyBlocks.Views.DeckForm = Backbone.View.extend({
  tagName: "form",
  className: "deck-form"
  events: {
    "submit .deck-form": "submit"
  },

  render: function () {
    var content = this.template({ deck: this.model });
    this.$el.html(content);
    return this;
  }
});
