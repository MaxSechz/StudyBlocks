StudyBlocks.Views.DeckShow = Backbone.CompositeView.extend({
  tagName: "main",
  className: "deck",
  template: JST["decks/show"],

  render: function () {
    var content = this.template({ deck: this.model });
    this.$el.html(content);
    return this;
  }
});
