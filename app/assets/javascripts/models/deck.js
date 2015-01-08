StudyBlocks.Models.Deck = Backbone.Model.extend({
  urlRoot: "api/decks",

  cards: function () {
    if (!this._cards) {
      this._cards = new StudyBlocks.Collections.Cards();
    }

    return this._cards;
  },

  errors: function (errorField) {
    this._errors = this._errors || {};

    if (!errorField) {
      return this._errors;
    } else if (this._errors[errorField]) {
      return this._errors[errorField];
    }
  },

  parse: function (response) {
    if (response.cards) {
      this.cards().set(response.cards);
      delete response.cards
    }
    return response;
  }
});
