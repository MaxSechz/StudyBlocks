StudyBlocks.Views.NavBar = Backbone.View.extend({
  tagName: "div",
  className: "navbar",
  events: {
    "click a": "navigate"
  },
  paths: {
    "courses-link": "courseIndex",
    "newcourse-link": "courseNew",
    "account-link": "account",
    "register-link": "register",
    "login-link": "login",
    "guest": "loginGuest"
  },
  template: JST["static/navbar"],
  renderThis: {
    currentUser: "currentUser"
  },

  navigate: function (event) {
    var $target = $(event.currentTarget);
    if ($target.hasClass("google") || $target.hasClass("")) {
      return;
    }
    event.preventDefault();
    this.paths[$target[0].className] && this[this.paths[$target[0].className]]();
  },

  currentUser: function () {
      return StudyBlocks.currentUser;
  },

  courseNew: function () {
    var courses = new StudyBlocks.Collections.Courses();
    var courseNew = new StudyBlocks.Views.CourseNew({
      collection: courses
    });
    this._modalify(courseNew.render());
  },

  login: function () {
    var user = new StudyBlocks.Models.User();
    var loginView = new StudyBlocks.Views.UserLogin({
      model: user
    });
    this._modalify(loginView.render());
  },

  register: function () {
    var user = new StudyBlocks.Models.User();
    var registerView = new StudyBlocks.Views.UserNew({
      model: user
    });
    this._modalify(registerView.render());
  },

  account: function () {
    var schools = new StudyBlocks.Collections.Schools();
    var accountView = new StudyBlocks.Views.UserAccount({
      model: StudyBlocks.currentUser,
      collection: schools
    });
    this._modalify(accountView.render());
  },

  courseIndex: function () {
    var courses = new StudyBlocks.Collections.Courses();
    courses.fetch();
    var courseIndex = new StudyBlocks.Views.CourseIndex({
      collection: courses
    });
    this._modalify(courseIndex.render());
  },

  loginGuest: function () {
    event.preventDefault();
    var data = { user: { username: "Guest", password: "password" }};
    var thisView = this;
    StudyBlocks.bump();
    $.ajax({
      url: "/api/session",
      type: "POST",
      data: data,
      success: function (response) {
        StudyBlocks.currentUser.set(response);
        StudyBlocks.modal.clear();
        StudyBlocks.navbar.render();
        Backbone.history.navigate('decks', { trigger: true });
        StudyBlocks.debump();
      }
    });
  },

  _modalify: function (view) {
    StudyBlocks.modal.set(view, "form");
  }
});
