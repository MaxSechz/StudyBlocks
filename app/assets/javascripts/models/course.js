StudyBlocks.Models.Course = Backbone.Model.extend({
  urlRoot: "api/courses",

  decks: function () {
    if (!this._decks) {
      this._decks = new StudyBlocks.Collections.Decks();
    }
    return this._decks;
  },

  parse: function (response) {
    if (response.decks) {
      this.decks().set(response.decks, { parse: true });
      delete response.decks;
    }
    return response;
  }
});
