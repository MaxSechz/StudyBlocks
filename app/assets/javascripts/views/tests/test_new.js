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
    this.listenTo(this.deck, "sync", this.render);
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
        console.log(model)
        console.log(response)
      }
    });
  }
});
