StudyBlocks.Views.ResponseShow = Backbone.View.extend({
  tagName: "li",
  className: "response",
  template: JST["responses/show"],
  
  render: function () {
    var content = this.template({ response: this.model });
    this.$el.html(content);
    return this;
  },
});
