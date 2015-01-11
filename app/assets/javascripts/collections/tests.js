StudyBlocks.Collections.Tests = Backbone.Collection.extend({
  model: StudyBlocks.Models.Test,
  url: function () {
    return this.deck.url() + "/tests";
  },

  initialize: function (attrs, options) {
    this.deck = options.deck;
  },

  parse: function (response, options) {
    if (response.deck) {
      this.deck = response.deck;
      delete response.deck;
    }
    return response;
  }
});
