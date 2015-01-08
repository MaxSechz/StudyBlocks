StudyBlocks.Views.CardShow = Backbone.View.extend({
  tagName: "li",
  className: "card",
  template: JST["cards/show"],

  initialize: function () {
    this.listenTo(this.model, "sync", this.render)
  },

  render: function () {
    var content = this.template({ card: this.model });
    this.$el.html(content);
    return this;
  }
});
