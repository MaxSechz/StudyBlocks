StudyBlocks.Views.DeckTile = Backbone.CompositeView.extend({
  tagName: "li",
  tagClass: "deck",
  template: JST["decks/tile"],
  events: {
    "click .delete-deck": "destroyDeck",
    "click .edit-deck": "editDeck"
  },

  render: function () {
    var content = this.template({ deck : this.model });
    this.$el.html(content);
    return this;
  },

  destroyDeck: function (event) {
    event.preventDefault();
    this.remove();
    this.model.destroy();
  },

  editDeck: function (event) {
    event.preventDefault();
    var formView = new StudyBlocks.Views.DeckForm({
      model: this.model,
      collection: this.model.cards()
    });
    this.addSubview(".deck-attrs", formView);
  }
});
