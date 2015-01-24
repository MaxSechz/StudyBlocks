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
  renderThis: {
    course: "model"
  },

  id: function () {
    return this.model.id;
  },

  initialize: function (options) {
    this.registration = new StudyBlocks.Models.Registration({
      id: this.model.id
    });
    this.registration.fetch();
    this.tagName = options.tagName;
    this.template = this.templates[this.tagName];
  },

  dropCourse: function (event) {
    event.preventDefault();
    var thisView = this;
    this.registration.destroy({
      success: function (model, response) {
        thisView.collection.remove(thisView.model);
      }
    });
  }
});
