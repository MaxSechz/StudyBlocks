StudyBlocks.Views.NavBar = Backbone.View.extend({
  tagName: "div",
  className: "navbar",
  template: JST["static/navbar"],

  render: function () {
    var content = this.template({
      currentUser : StudyBlocks.currentUser
      });
    this.$el.html(content);
    return this;
  }
});
