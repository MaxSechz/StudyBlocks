StudyBlocks.Views.DeckTile = Backbone.CompositeView.extend({
  tagName: "li",
  className: "deck-tile",
  template: JST["decks/tile"],
  events: {
    "click .delete-deck": "destroyDeck",
    "click .edit-deck": "editDeck"
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
    $(".modal").html(formView.render().$el).addClass("form");
  }
});
