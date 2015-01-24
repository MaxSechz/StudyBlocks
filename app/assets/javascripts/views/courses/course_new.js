StudyBlocks.Views.CourseNew = Backbone.CollectionView.extend({
  tagName: "section",
  className: "course-registration",
  template: JST["courses/new"],
  events: {
    "click .cancel": "closeForm",
    "keyup .search": "searchCourses",
    "focusout .search": "openSelect",
    "submit .register": "registerForCourse",
    "submit .create": "createAndRegister"
  },
  selector: ".course-list",
  subModelViewName: 'CourseTile',
  options: {
    tagName: 'option',
    attributes: function () {
      return { value: this.id() };
    }
  },

  openSelect: function (event) {
    event.preventDefault();
    this.$($("option")[0]).prop('selected', true);
    this.$("select").click();
  },

  searchCourses: function (event) {
    event.preventDefault();
    var thisView = this;
    this.collection.fetch({
      data: {query: this.$(".search").val()},
      success: function (collection) {
        thisView.renderCollection();
      }
    });
  },

  registerForCourse: function (event) {
    event.preventDefault();
    var $target = $(event.currentTarget);
    var data = $target.serializeJSON();
    var registration = new StudyBlocks.Models.Registration(data);
    var thisView = this;
    registration.save({}, {
      success: function (model) {
        Backbone.history.navigate("courses/" + model.id, { trigger: true })
      }
    });
  },

  createAndRegister: function (event) {
    event.preventDefault();
    var $target = $(event.currentTarget);
    var data = $target.serializeJSON();
    var course = new StudyBlocks.Models.Course(data);
    var thisView = this;
    course.save({}, {
      success: function (model) {
        Backbone.history.navigate("courses/" + model.id, { trigger: true })
      }
    });

  }
});
