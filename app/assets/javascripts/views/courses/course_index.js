StudyBlocks.Views.CourseIndex = Backbone.View.extend({
  tagName: "ul",
  className: "courses",
  events: {},
  template: JST["courses/index"],

  initialize: function () {
    this.listenTo(this.collection, "sync", this.render);
  },

  render: function () {
    var content = this.template({ courses: this.collection });
    this.$el.html(content);
    return this;
  }
});
