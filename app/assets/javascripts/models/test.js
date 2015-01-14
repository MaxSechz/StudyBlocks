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
    }
    return this._responses;
  },

  parse: function (response, options) {
    if (response.deck) {
      this.deck = response.deck;
      delete response.deck;
    }
    if (response.responses) {
      this.responses().set(response.responses);
      delete response.responses;
    }
    if (response.score) {
      this.score = response.score;
      delete response.score;
    }
    return response;
  }
});
