StudyBlocks.Collections.Cards = Backbone.Collection.extend({
  url: function () {
    return this.deck.url() + "/cards";
  },
  model: StudyBlocks.Models.Card,

  initialize: function (models, options) {
    this.deck = options.deck;
  },

  comparator: "id",
  
  toJSON: function () {
    var targetCards = [];
    _.each(this.models, function (card) {
      if (card.isNew() || card.get('changed')) {
        targetCards.push(card.toJSON());
      }
    });
    return targetCards;
  },

  parse: function (response, options) {
    var thisDeck = this.deck;
    response.forEach(function (obj) {
      obj.deck = thisDeck;
    });
    return response;
  },

});
