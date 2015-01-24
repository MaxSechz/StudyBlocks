StudyBlocks.Views.Home = Backbone.View.extend({
  tagName: "section",
  className: "home",
  template: JST["static/home"],

  render: function () {
    var content = this.template();
    this.$el.html(content);
    return this;
  }
});
