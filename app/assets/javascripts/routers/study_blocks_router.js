StudyBlocks.Routers.Router = Backbone.Router.extend({
  routes: {
    // '': "home",
    'decks': "deckIndex",
    'decks/:id': "deckShow",
    'decks/:id/study': "deckStudy",
    'decks/:id/review': "deckReview",
    'decks/:id/test': "deckTest",
    'decks/:id/tests': 'testIndex',
    'decks/:id/tests/:id': 'testShow',
    'courses': "courseIndex",
    'courses/new': "courseNew",
    'courses/:id': "courseShow",
  },

  initialize: function (options) {
    this.$rootEl = options.$rootEl;
    this.decks = options.decks;
  },

  deckIndex: function () {
    this.decks.fetch();
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
    var indexView = new StudyBlocks.Views.TestIndex({
      collection: deckTests,
      model: targetDeck
    });
    this._swapView(indexView);
  },

  testShow: function (deck_id, test_id) {
    var targetDeck = new StudyBlocks.Models.Deck({ id: deck_id });
    var targetTest = new StudyBlocks.Models.Test(
      {id: test_id },
      {deck: targetDeck}
    );
    targetTest.fetch();
    var testShow = new StudyBlocks.Views.TestShow({
      model: targetTest,
      collection: targetTest.responses(),
    });
    this._swapView(testShow);
  },

  courseIndex: function () {
    var courses = new StudyBlocks.Collections.Courses();
    courses.fetch();
    var courseIndex = new StudyBlocks.Views.CourseIndex({
      collection: courses
    });
    this._swapView(courseIndex);
  },

  courseShow: function (id) {
    var course = new StudyBlocks.Models.Course({ id: id });
    course.fetch();
    var courseShow = new StudyBlocks.Views.CourseShow({
      model: course,
      collection: course.decks()
    });
    this._swapView(courseShow);
  },

  courseNew: function () {
    var courses = new StudyBlocks.Collections.Courses();
    var courseNew = new StudyBlocks.Views.CourseNew({
      collection: courses
    });
    this._swapView(courseNew);
  },

  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  }
});
