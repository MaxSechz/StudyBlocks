StudyBlocks.Views.ResponseShow = Backbone.View.extend({
  tagName: "li",
  className: "response",
  template: JST["responses/show"],
  renderThis: {
    response: "model"
  },
});
