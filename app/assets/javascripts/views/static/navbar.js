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
  },
  template: JST["static/navbar"],
  renderThis: {
    currentUser: "model"
  },

  navigate: function (event) {
    var $target = $(event.currentTarget)
    if ($target.hasClass("google") || $target.hasClass("")) {
      return;
    }
    event.preventDefault();
    this.paths[$target[0].className] && this[this.paths[$target[0].className]]();
  },

  courseNew: function () {
    var courses = new StudyBlocks.Collections.Courses();
    var courseNew = new StudyBlocks.Views.CourseNew({
      collection: courses
    });
    this._modalify(courseNew);
  },

  login: function () {
    var user = new StudyBlocks.Models.User();
    var loginView = new StudyBlocks.Views.UserLogin({
      model: user
    });
    this._modalify(loginView);
  },

  register: function () {
    var user = new StudyBlocks.Models.User();
    var schools = new StudyBlocks.Collections.Schools();
    var registerView = new StudyBlocks.Views.UserNew({
      model: user,
      collection: schools
    });
    this._modalify(registerView);
  },

  account: function () {
    var schools = new StudyBlocks.Collections.Schools();
    var accountView = new StudyBlocks.Views.UserAccount({
      model: StudyBlocks.currentUser,
      collection: schools
    });
    this._modalify(accountView);
  },

  courseIndex: function () {
    var courses = new StudyBlocks.Collections.Courses();
    courses.fetch();
    var courseIndex = new StudyBlocks.Views.CourseIndex({
      collection: courses
    });
    this._modalify(courseIndex);
  },

  _modalify: function (view) {
    StudyBlocks.modal.set(view, "form");
  }
});
