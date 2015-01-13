StudyBlocks.Views.DeckTest = Backbone.CollectionView.extend({
  tagName: "main",
  className: "deck-test",
  template: JST['tests/new'],
  events: {
    'click .submit': 'submitTest'
  },
  selector: '.cards-list',
  subModelViewName: 'CardTest',
  renderThis: {
    deck: 'deck'
  },

  initialize: function () {
    this.deck = this.model.deck;
    this.deck.cards();
    this.listenTo(this.deck.cards(), "sync", this.setupChoices);
  },

  setupChoices: function () {
    var choices = {};
    var cards = this.deck.cards().models;
    var choiceCards = [];
    for (var i = 0; i < cards.length; i++) {
      if (cards[i].escape('format') === "choice") {
        choiceCards.push(cards[i]);
        choices[cards[i].id] = [cards[i]];
      }
    }
    for (var card in choices) {
      choices[card] = _.sample(choiceCards, 4);
      choices[card] = _.uniq(choices[card]);
    }
    this.options = { choices: choices };
    this.render();
  },

  submitTest: function (event) {
    event.preventDefault();
    var responses = this.subviews(this.selector).map(function (subview) {
      var response = {
        card_id: subview.model.id,
        response_text: subview.$("input, textarea").val()
      };
      return response;
    });

    var data = { test: { responses_attributes: responses }};
    var thisDeck = this.deck;
    this.model.set(data);
    this.model.save({}, {
      success: function (model, response) {
        Backbone.history.navigate(thisDeck.linkUrl('tests'), { trigger: true });
      },
      error: function (model, response) {
      }
    });
  }
});
