StudyBlocks.Models.User = Backbone.Model.extend({
  url: "api/user",

  decks: function () {
    if (!this._decks) {
      this._decks = new StudyBlocks.Collections.Decks()
    }
    return this._decks
  },

  toJSON: function () {
      var attrs = _.clone(this.attributes);
      return { user: attrs };
  },

  parse: function (response) {
    if (response.decks) {
      this.decks().set(response.decks);
      delete response.decks;
    }
    return response;
  }
});
