StudyBlocks.Models.Test = Backbone.Model.extend({
  urlRoot: function () {
    return this.deck().url() + "/tests";
  },

  initialize: function (attrs, options) {
    this.deck().set(options.deck);
  },

  responses: function () {
    if (!this._responses) {
      this._responses = new StudyBlocks.Collections.Responses([], {
        test: this,
        deck: this.deck()
      });
    }
    return this._responses;
  },

  deck: function () {
    if (!this._deck) {
      this._deck = new StudyBlocks.Models.Deck();
    }
    return this._deck;
  },

  parse: function (response, options) {
    if (response.deck) {
      this.deck().set(response.deck);
      delete response.deck;
    }
    if (response.responses) {
      this.responses().set(response.responses, {
        deck: this.deck(),
        parse: true
      });
      delete response.responses;
    }
    if (typeof response.score === "number") {
      this.score = response.score;
      delete response.score;
    }
    return response;
  }
});
