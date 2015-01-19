StudyBlocks.Views.CourseIndex = Backbone.CollectionView.extend({
  tagName: "section",
  className: "courses",
  events: {
    "click a": "removeSelf"
  },
  template: JST["courses/index"],
  selector: ".course-list",
  subModelViewName: 'CourseTile',
  options: {
    tagName: 'li'
  },

  initialize: function () {
    this.options.collection = this.collection;
    this.listenTo(this.collection, "sync remove", this.render);
  },

  removeSelf: function (event) {
    if ($(event.currentTarget).hasClass("cancel")) {
      console.log($(event.currentTarget));
      event.preventDefault();
      Backbone.history.history.back();
    }
    $(".modal").removeClass("active").removeClass("form");
    this.remove();
  }
});
