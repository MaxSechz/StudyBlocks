StudyBlocks.Models.Card = Backbone.Model.extend({
  urlRoot: function () {
    return this.deck.url() + "/cards";
  },

  initialize: function (attrs, options) {
    this.deck = options.deck;
  },

  // toJSON: function () {
  //   console.log(this);
  // },

  parse: function (response, options) {
    if (response.deck) {
      this.deck = response.deck;
      delete response.deck;
    }
    return response;
  }
});
