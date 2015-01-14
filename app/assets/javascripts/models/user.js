StudyBlocks.Models.User = Backbone.Model.extend({
  decks: function () {
    if (!this._decks) {
      this._decks = new StudyBlocks.Collections.Decks()
    }
    return this._decks
  },

  parse: function (response) {
    if (response.decks) {
      this.decks().set(response.decks);
      delete response.decks;
    }
    return response;
  }
});
