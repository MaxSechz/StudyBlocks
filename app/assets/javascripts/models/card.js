StudyBlocks.Models.Card = Backbone.Model.extend({
  urlRoot: function () {
    return this.deck.url() + "/cards";
  },

  initialize: function (attrs, options) {
    this.deck = options.deck;
  },

  parse: function (response, options) {
    if (response.deck) {
      this.deck = response.deck;
      delete response.deck;
    }
    if (response.image === "/images/original/missing.png") {
      delete response.image
    }
    try {
      response.back = JSON.parse(response.back);
    } catch(error) {}

    return response;
  }
});
