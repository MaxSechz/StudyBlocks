StudyBlocks.Models.Test = Backbone.Model.extend({
  urlRoot: function () {
    return this.deck.url() + "/tests";
  },

  initialize: function (attrs, options) {
    this.deck = options.deck;
  },

  responses: function () {
    if (!this._responses) {
      this._responses = new StudyBlocks.Collections.Responses([], { test: this });
    } else if (!this.isNew() && this._responses.isEmpty()) {
      this._responses.fetch();
    }

    return this._responses;
  },

  parse: function (response, options) {
    if (response.deck) {
      this.deck = response.deck;
      delete response.deck;
    }
    return response;
  }
});
