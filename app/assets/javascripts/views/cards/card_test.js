StudyBlocks.Views.CardTest = Backbone.View.extend({
  tagName: 'li',
  className: 'card',
  template: JST['cards/test'],

  initialize: function (options) {
    this.choices = _.shuffle(options.choices);
  },
  render: function () {
    var content = this.template({
      card: this.model,
      choices: this.choices
    });
    this.$el.html(content);
    return this;
  }
});
