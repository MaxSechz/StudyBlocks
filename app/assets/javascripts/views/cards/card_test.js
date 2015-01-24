StudyBlocks.Views.CardTest = Backbone.View.extend({
  tagName: 'li',
  className: 'card',
  template: JST['cards/test'],
  renderThis: {
      card: "model",
      choices: "choices"
  },
  renderThis: {
    card: "model",
    choices: "choices"
  },

  initialize: function (options) {
    this.choices = _.shuffle(options.choices);
  },
});
