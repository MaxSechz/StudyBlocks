StudyBlocks.Views.TestShow = Backbone.CollectionView.extend({
  tagName: "section",
  className: "test notready",
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
    this.listenTo(this.model, "sync", this.render);
  },
});
