StudyBlocks.Models.Deck = Backbone.Model.extend({
  rootUrl: "api/decks",

  cards: function () {
    if (!this._cards) {
      this._cards = new StudyBlocks.Collections.Cards();
    }

    return this._cards;
  },

  parse: function (response) {
    if (response.cards) {
      this.cards().set(response.cards);
      delete response.cards
    }
    return response;
  }
});