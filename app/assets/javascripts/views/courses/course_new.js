StudyBlocks.Views.CourseNew = Backbone.CollectionView.extend({
  tagName: "section",
  className: "course-registration",
  template: JST["courses/new"],
  events: {
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
    registration.save({
      success: function (model) {
        console.log(model);
      }
    });
  },

  createAndRegister: function (event) {
    event.preventDefault();
    var $target = $(event.currentTarget);
    var data = $target.serializeJSON();
    var course = new StudyBlocks.Models.Course(data);
    course.save({
      success: function (model) {
          console.log(model);
      }
    });

  }
});
