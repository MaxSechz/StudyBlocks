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
  renderCallback: 'setupChoices',

  initialize: function () {
    this.deck = this.model.deck;
    this.listenTo(this.collection, "sync", this.render);
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
    var responses = this.subviews(this.selector).map(function (subview) {
      var response = { card_id : subview.model.id };
      if (subview.model.escape('format') === "field") {
        response.response_text = [];
        subview.$("input").each(function (input) {
          response.response_text.push($(this).val());
        });
      } else {
        response.response_text = subview.$("input[type='text'], textarea, input:checked").val();
      }
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
        console.log(model);
        console.log(response);
      }
    });
  }
});
