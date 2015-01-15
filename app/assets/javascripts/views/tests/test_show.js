StudyBlocks.Views.TestShow = Backbone.CollectionView.extend({
  tagName: "section",
  tagClass: "test",
  template: JST["tests/show"],
  subModelViewName: 'ResponseShow',
  renderThis: {
    test: 'model',
    deck: 'deck'
  },
  selector: ".responses",
  options: {},

  initialize: function (options) {
    this.deck = this.model.deck();
    this.listenTo(this.model, "change", this.render);
  },
});
