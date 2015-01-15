StudyBlocks.Models.Response = Backbone.Model.extend({
  urlRoot: function () {
    return this.test.url() + "/responses";
  },

  initialize: function (models, options) {
    this.test = options.test;
    this.deck = options.deck;
  },

  parse: function (response) {
    if (response.card) {
      this.card = new StudyBlocks.Models.Card(response.card, {
        deck: this.deck,
        parse: true
      });
      delete response.card;
    }
    return response;
  }
});
