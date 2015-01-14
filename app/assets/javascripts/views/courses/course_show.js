StudyBlocks.Views.CourseShow = Backbone.CollectionView.extend({
  tagName: "section",
  tagClass: "course",
  template: JST["courses/show"],
  subModelViewName: "DeckTile",
  selector: ".decks",
  renderThis: {
    course: 'model'
  },
  options: {
    writeable: false
  },

  initialize: function () {
    this.listenTo(this.model, "sync", this.render);
  }

});
