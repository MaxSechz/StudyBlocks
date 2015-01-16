StudyBlocks.Views.CourseIndex = Backbone.CollectionView.extend({
  tagName: "section",
  className: "courses",
  events: {},
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
});
