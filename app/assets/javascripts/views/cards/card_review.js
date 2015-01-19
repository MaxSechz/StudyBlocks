StudyBlocks.Views.CardReview = Backbone.View.extend({
  tagName: "li",
  className: "card-review",
  template: JST["cards/review"],
  events: {
    'click .cube': 'flipCard'
  },

  initialize: function () {
  },

  render: function () {
    var content = this.template({
      card: this.model
    });
    this.$el.html(content);
    return this;
  },

  flipCard: function (event) {
    this.$(".cube").toggleClass('flip-up')
  }
});
