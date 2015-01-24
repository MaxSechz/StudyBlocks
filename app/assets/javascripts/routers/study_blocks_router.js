StudyBlocks.Routers.Router = Backbone.Router.extend({
  routes: {
    '': "home",
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

  home: function () {
    var homeView = new StudyBlocks.Views.Home();
    this._swapView(homeView);
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

  courseShow: function (id) {
    var course = new StudyBlocks.Models.Course({ id: id });
    course.fetch();
    var courseShow = new StudyBlocks.Views.CourseShow({
      model: course,
      collection: course.decks()
    });
    this._swapView(courseShow);
  },

  _swapView: function (view) {
    this.$modalEl.empty().removeClass("form").removeClass("active");
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$rootEl.html(view.render().$el);
  },

  _modalify: function (view) {
    this.$modalEl.empty().removeClass("active");
    var cssClass = "active";
    this.$modalEl.addClass(cssClass).html(view.render().$el);
  }

});
