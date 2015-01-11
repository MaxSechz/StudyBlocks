StudyBlocks.Views.CardStudy = Backbone.View.extend({
  tagName: "li",
  className: "card-study",
  template: JST["cards/study"],

  render: function () {
    console.log(this.model)
    var content = this.template({ card: this.model });
    this.$el.html(content);
    return this;
  }

});
