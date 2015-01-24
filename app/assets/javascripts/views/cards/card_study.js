StudyBlocks.Views.CardStudy = Backbone.View.extend({
  tagName: "li",
  className: "card",
  template: JST["cards/study"],
  renderThis: {
    card: "model"
  },

});
