StudyBlocks.Views.CardReview = Backbone.View.extend({
  tagName: "li",
  className: "card-review",
  template: JST["cards/review"],
  events: {
    'click .cube': 'flipCard'
  },
  renderThis: {
    card: "model"
  },
  
  flipCard: function (event) {
    this.$(".cube").toggleClass('flip-up')
  }
});
