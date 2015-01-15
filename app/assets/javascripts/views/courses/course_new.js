StudyBlocks.Views.CourseNew = Backbone.CollectionView.extend({
  tagName: "section",
  className: "course-registration",
  template: JST["courses/new"],
  events: {
    "keyup .search": "searchCourses",
    "submit .register": "registerForCourse",
    "submit .create": "createAndRegister"
  },
  selector: ".course-list",
  subModelViewName: 'CourseTile',
  options: {
    tagName: 'option'
  },

  searchCourses: function (event) {
    console.log(this.$el)
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
    event.preventDefault()
    console.log(event)

  }
});
