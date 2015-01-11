StudyBlocks.Views.CardReview = Backbone.View.extend({
  tagName: "li",
  className: "card-review",
  template: JST["cards/review"],
  events: {
    'click .flip': 'flipCard'
  },

  initialize: function () {
    this.sides = ['front', 'back'];
  },

  render: function () {
    var content = this.template({
      card: this.model,
      currentSide: this.sides[0]
    });
    this.$el.html(content);
    return this;
  },

  flipCard: function (event) {
    event.preventDefault();
    this.sides.reverse();
    this.render();
  }
});
