StudyBlocks.Views.DeckTest = Backbone.CollectionView.extend({
  tagName: "main",
  className: "deck-test notready",
  template: JST['tests/new'],
  events: {
    'click .submit': 'submitTest'
  },
  selector: '.cards-list',
  subModelViewName: 'CardTest',
  renderThis: {
    deck: 'deck'
  },
  preRender: 'setupChoices',

  initialize: function () {
    this.deck = this.model.deck();
    if (this.deck.done) {
      this.render();
    } else {
      this.listenTo(this.deck, "sync", this.render);
    }
  },

  setupChoices: function () {
    var choices = [];
    this.options = { choices: choices };
    var cards = this.collection.models;
    for (var i = 0; i < cards.length; i++) {
      if (cards[i].escape('format') === "choice") {
        choices.push(cards[i]);
      }
    }
  },

  submitTest: function (event) {
    event.preventDefault();
    var responses = [];
    var currentSubviews = this.subviews(this.selector);
    for (var subviewId in currentSubviews) {
      var subview = currentSubviews[subviewId];
      var response = { card_id : subviewId };
      if (subview.model.escape('format') === "field") {
        response.response_text = [];
        subview.$("input").each(function (input) {
          response.response_text.push($(this).val());
        });
      } else {
        response.response_text = subview.$("input[type='text'], textarea, input:checked").val();
      }
      responses.push(response);
    };
    var data = { test: { responses_attributes: responses }};
    var previousTests = this.deck.tests();
    this.model.set(data);
    this.model.save({}, {
      success: function (model, response) {
        previousTests.add(model);
        Backbone.history.navigate(thisDeck.linkUrl('tests'), { trigger: true });
      },
      error: function (model, response) {
      }
    });
  }
});
