StudyBlocks.Routers.Router = Backbone.Router.extend({
  routes: {
    // '': "home",
    "account": "account",
    "register": "register",
    "login": "login",
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

  execute: function (callback, args) {
    if (StudyBlocks.currentUser.isNew() && !this.sessionRoute()) {
      Backbone.history.navigate('', { replace: true });
    } else {
      callback.apply(this, args);
    }
  },

  sessionRoute: function () {
    return Backbone.history.fragment === "login" ||
    Backbone.history.fragment === "register";
  },

  initialize: function (options) {
    this.$rootEl = options.$rootEl;
    this.decks = options.decks;
    this.$modalEl = options.$modalEl;
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
    this._modalify(studyView)
  },

  deckReview: function (id) {
    var targetDeck = this.decks.getOrFetch(id);
    var studyView = new StudyBlocks.Views.DeckReview({
      model: targetDeck,
      collection: targetDeck.cards()
    });
    this._modalify(studyView);
  },

  deckTest: function (id) {
    var targetDeck = this.decks.getOrFetch(id);
    var emptyTest = new StudyBlocks.Models.Test({}, { deck: targetDeck });
    var testView = new StudyBlocks.Views.DeckTest({
      model: emptyTest,
      collection: targetDeck.cards()
    });
    this._modalify(testView);
  },

  testIndex: function (id) {
    var targetDeck = this.decks.getOrFetch(id);
    var deckTests = new StudyBlocks.Collections.Tests({}, { deck: targetDeck });
    deckTests.fetch();
    var indexView = new StudyBlocks.Views.TestIndex({
      collection: deckTests,
      model: targetDeck
    });
    this._modalify(indexView);
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
    this._modalify(testShow);
  },

  courseIndex: function () {
    var courses = new StudyBlocks.Collections.Courses();
    courses.fetch();
    var courseIndex = new StudyBlocks.Views.CourseIndex({
      collection: courses
    });
    this._modalify(courseIndex, "form");
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
    this._modalify(courseNew, "form");
  },

  login: function () {
    var user = new StudyBlocks.Models.User();
    var loginView = new StudyBlocks.Views.UserLogin({
      model: user
    });
    this._modalify(loginView, "form");
  },

  register: function () {
    var user = new StudyBlocks.Models.User();
    var schools = new StudyBlocks.Collections.Schools();
    var registerView = new StudyBlocks.Views.UserNew({
      model: user,
      collection: schools
    });
    this._modalify(registerView, "form");
  },

  account: function () {
    var schools = new StudyBlocks.Collections.Schools();
    var accountView = new StudyBlocks.Views.UserAccount({
      model: StudyBlocks.currentUser,
      collection: schools
    });
    this._modalify(accountView, "form");
  },

  _swapView: function (view) {
    this.$modalEl.empty().removeClass("form").removeClass("active");
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  },

  _modalify: function (view, option) {
    this.$modalEl.empty().removeClass("active").removeClass("form");
    var cssClass = option || "active"
    this.$modalEl.addClass(cssClass).html(view.render().$el)
  }
});
