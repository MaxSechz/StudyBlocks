StudyBlocks.Views.CardStudy = Backbone.View.extend({
  tagName: "li",
  className: "card",
  template: JST["cards/study"],

  render: function () {
    var content = this.template({ card: this.model });
    this.$el.html(content);
    return this;
  }

});
