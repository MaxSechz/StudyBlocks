StudyBlocks.Views.DecksIndex = Backbone.View.extend({
  tagName: "ul",
  className: "decks",
  template: JST['decks/index'],

  render: function () {
    var content = this.template({ decks: this.collection });
    this.$el.html(content);
    return this;
  }

});
