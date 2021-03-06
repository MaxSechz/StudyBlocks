StudyBlocks.Views.DeckTile = Backbone.CompositeView.extend({
  tagName: "li",
  className: "deck-tile",
  template: JST["decks/tile"],
  events: {
    "click .delete-deck": "destroyDeck",
    "click .edit-deck": "editDeck",
    "click": "navigate"
  },
  renderThis: {
    deck: "model",
    writeable: "writeable"
  },

  initialize: function (options) {
    this.writeable = options.writeable;
  },

  navigate: function (event) {
    var className = event.target.className;
    if (className === "pencil" || className === "delete-deck") {
    } else {
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
