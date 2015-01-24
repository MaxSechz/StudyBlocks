StudyBlocks.Views.UserLogin = Backbone.View.extend({
  tagName: "form",
  className: "login",
  template: JST["users/login"],
  events: {
    "click .login": "login",
    "click .guest": "loginGuest",
  },

  login: function (event) {
    event.preventDefault();
    var data = { user: this.$el.serializeJSON() };
    var thisView = this;
    $.ajax({
      url: "/api/session",
      type: "POST",
      data: data,
      success: function (response) {
        StudyBlocks.currentUser.set(response)
        StudyBlocks.modal.remove();
        StudyBlocks.navbar.render()
      },
      error: function (response) {
      }
    });
  },

  loginGuest: function (event) {
    event.preventDefault();
    this.$("#password").val('password');
    this.$("#username").val('Guest');
    this.$(".login").click();
  }
});
