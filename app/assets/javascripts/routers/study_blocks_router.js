StudyBlocks.Routers.Router = Backbone.Router.extend({
  routes: {
    '': "deckIndex",
    'decks': "deckIndex",
    'decks/:id': "deckShow",
    'decks/:id/study': "deckStudy",
    'decks/:id/review': "deckReview",
    'decks/:id/test': "deckTest",
    'decks/:id/tests': 'testIndex',
    'courses': "courseIndex",
    'courses/:id': "courseShow"
  },

  initialize: function (options) {
    this.$rootEl = options.$rootEl;
    this.decks = options.decks;
    this.decks.fetch();
  },

  deckIndex: function () {
    var indexView = new StudyBlocks.Views.DecksIndex({ collection: this.decks });
    this._swapView(indexView);
  },

  deckShow: function (id) {
    var targetDeck = this.decks.getOrFetch(id);
    var showView = new StudyBlocks.Views.DeckShow({
      model: targetDeck,
      collection: targetDeck.cards()
    });
    this._swapView(showView);
  },

  deckStudy: function (id) {
    var targetDeck = this.decks.getOrFetch(id);
    var studyView = new StudyBlocks.Views.DeckStudy({
      model: targetDeck,
      collection: targetDeck.cards()
    });
    this._swapView(studyView);
  },

  deckReview: function (id) {
    var targetDeck = this.decks.getOrFetch(id);
    var studyView = new StudyBlocks.Views.DeckReview({
      model: targetDeck,
      collection: targetDeck.cards()
    });
    this._swapView(studyView);
  },

  deckTest: function (id) {
    var targetDeck = this.decks.getOrFetch(id);
    var emptyTest = new StudyBlocks.Models.Test({}, { deck: targetDeck });
    var testView = new StudyBlocks.Views.DeckTest({
      model: emptyTest,
      collection: targetDeck.cards()
    });
    this._swapView(testView);
  },

  testIndex: function (id) {
    var targetDeck = this.decks.getOrFetch(id);
    var deckTests = new StudyBlocks.Collections.Tests({}, { deck: targetDeck });
    deckTests.fetch();
    var indexView = new StudyBlocks.Views.TestIndex({ collection: deckTests});
    this._swapView(indexView);
  },

  courseIndex: function () {
    var courses = new StudyBlocks.Collections.Courses();
    courses.fetch();
    var courseIndex = new StudyBlocks.Views.CourseIndex({
      collection: courses
    });
    this._swapView(courseIndex)
  },

  // courseShow: function (id) {
  //   var course = new StudyBlocks.Models.Course({ id: id });
  //   course.fetch();
  //   var courseShow = new StudyBlocks.Views.CourseShow({
  //
  //   });
  // },

  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }
});
