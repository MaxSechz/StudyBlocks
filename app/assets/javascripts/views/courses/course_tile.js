StudyBlocks.Views.CourseTile = Backbone.View.extend({
  tagName: '',
  className: "course-tile group",
  templates: {
    li: JST["courses/tile_list"],
    option: JST["courses/tile_option"],
  },
  events: {
    "click .drop-course": "dropCourse"
  },

  id: function () {
    return this.model.id;
  },

  initialize: function (options) {
    this.registration = new StudyBlocks.Models.Registration({
      id: this.model.id
    });
    this.registration.fetch({
      success: function (model, response) {
      }
    });
    this.tagName = options.tagName;
    this.template = this.templates[this.tagName];
  },

  render: function () {
    var content = this.template({ course: this.model });
    this.$el.html(content);
    return this;
  },

  dropCourse: function (event) {
    event.preventDefault();
    var thisView = this;
    this.registration.destroy({
      success: function (model, response) {
        console.log(model, response)
        thisView.collection.remove(thisView.model);
      }
    });
  }
});
