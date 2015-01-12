StudyBlocks.Views.CardTest = Backbone.View.extend({
  tagName: 'li',
  className: 'card',
  template: JST['cards/test'],

  render: function () {
    var content = this.template({ card: this.model });
    this.$el.html(content);
    return this;
  }
});
