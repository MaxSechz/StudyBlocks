StudyBlocks.Views.CourseTile = Backbone.View.extend({
  tagName: '',
  className: "course-tile",
  template: JST["courses/tile"],
  id: function () {
    return this.model.id;
  },
  attributes: function () {
      return { value: this.id() }
  },
  initialize: function (options) {
    this.tagName = options.tagName;
  },

  render: function () {
    var content = this.template({ course: this.model });
    this.$el.html(content);
    return this;
  },
});
