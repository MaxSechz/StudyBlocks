StudyBlocks.Views.DeckTile = Backbone.CompositeView.extend({
  tagName: "li",
  className: "deck-tile",
  template: JST["decks/tile"],
  events: {
    "click .delete-deck": "destroyDeck",
    "click .edit-deck": "editDeck",
    "click": "navigate"
  },

  initialize: function (options) {
    this.writeable = options.writeable;
  },

  render: function () {
    var content = this.template({
      deck: this.model,
      writeable: this.writeable
    });
    this.$el.html(content);
    return this;
  },

  navigate: function (event) {
    if ($(event.target).hasClass("deck-tile")) {
      event.preventDefault();
      this.$("a")[0].click();
    }
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
    StudyBlocks.modal.set(formView, "form");
  }
});
