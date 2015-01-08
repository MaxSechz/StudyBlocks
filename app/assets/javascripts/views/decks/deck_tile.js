StudyBlocks.Views.DeckTile = Backbone.View.extend({
  tagName: "li",
  tagClass: "deck",
  template: JST["decks/tile"],
  events: {
    "click .delete": "destroyDeck"
  },

  render: function () {
    var content = this.template({ deck : this.model });
    this.$el.html(content);
    return this;
  },

  destroyDeck: function (event) {
    event.preventDefault();
    this.remove()
    this.model.destroy();
  }
})
